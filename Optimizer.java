// package dbi;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Properties;

import javax.xml.namespace.QName;

public class Optimizer {
    double r,t,l,m,a,f; // CPU specification parameters
    private Record A[]; // array of all subsets of basic terms

    public Optimizer(Properties config) {
        r = Double.parseDouble(config.getProperty("r"));
        t = Double.parseDouble(config.getProperty("t"));
        l = Double.parseDouble(config.getProperty("l"));
        m = Double.parseDouble(config.getProperty("m"));
        a = Double.parseDouble(config.getProperty("a"));
        f = Double.parseDouble(config.getProperty("f"));
    }

    private Record[] plan(Double[] S) {
        A = genAllSubsets(S);   // generate all (2^k)-1 plans

        for (int i = 0; i < A.length; i++) { // s: A[i], right child
            for (int j = 0; j < A.length; j++) { // s': A[j], left child, &-term

                // check if s (intersect with) s' is empty
                int mask_right = i + 1;
                int mask_left = j + 1;
                if ((mask_left & mask_right) != 0)
                    continue;

                if (suboptimalByCMetric(j, i) || suboptimalByDMetric(j, i)) {
                    // suboptimal -> skip
                } else {
                    double cost = getCostForCombinedPlan(j, i);
                    int combinedIdx = (mask_left | mask_right) - 1;

                    if (cost < A[combinedIdx].c) {
                        A[combinedIdx].c = cost;
                        A[combinedIdx].L = j;
                        A[combinedIdx].R = i;
                    }
                }
            }
        }
        return A;
    }

    private double getCostForCombinedPlan(int l, int r) {
        Record left = A[l];
        Record right = A[r];
        double p = left.p;
        double q = p<=0.5 ? p : 1-p;
        return getFcost(left) + m*q + p*right.c;    // Eq (1)
    }

    private boolean suboptimalByCMetric(int l, int r) {
        // c_metric of left < c_metric of the leftmost & term in right
        int r_lm_idx = getLeftmostAndTerm(r);
        Record r_lm = A[r_lm_idx];
        Record left = A[l];

        Pair l_cmetric = new Pair((left.p - 1)/getFcost(left), left.p);
        Pair r_cmetric = new Pair((r_lm.p - 1)/getFcost(r_lm), r_lm.p);

        return l_cmetric.isDominatedBy(r_cmetric);
    }

    private int getLeftmostAndTerm(int r) {
        int lm = r;
        while (A[lm].L != -1) {
            lm = A[lm].L;
        }
        return lm;
    }

    private boolean suboptimalByDMetric(int l, int r) {
        Record left = A[l];
        if (left.p > 0.5)
            return false;

        Pair l_dmetric = new Pair(getFcost(left), left.p);

        // compare d-metric of s' with d-metric of all the &-terms of s
        // (except the leftmost one)
        ArrayList<Integer> terms = getAllAndTerms(r);
        for (int i = 1; i < terms.size(); i++) { // skip the left most term
            Record term = A[i];
            Pair r_dmetric = new Pair(getFcost(term), term.p);
            if (l_dmetric.isDominatedBy(r_dmetric))
                return true;
        }
        return false;
    }

    private ArrayList<Integer> getAllAndTerms (int r) {
        // only leaves are &-terms
        ArrayList<Integer> ret = new ArrayList<Integer>();
        traverseLeaves(ret, r);
        return ret;
    }

    // in order traverse the &-terms
    private void traverseLeaves(ArrayList<Integer> list, int i) {
        if (A[i].L == -1) {  // it's a leaf
            list.add(i);
        } else {
            traverseLeaves(list, A[i].L);
            traverseLeaves(list, A[i].R);
        }
    }

    private double getFcost(Record rec) {
        int k = rec.n;
        return k*r + (k-1)*l + f*k + t;
    }

    private Record[] genAllSubsets(Double[] S) {
        int k = S.length;
        int num_subsets = (int) (Math.pow(2, k) - 1);
        Record ret[] = new Record[num_subsets];

        for (int i=0; i<ret.length; i++) {
            ArrayList<Double> subset = new ArrayList<Double>();

            // Add basic terms to a subset
            // e.g. if k=4, mask=(dec)3=(bin)0011, A[2] = {S[3], S[4]}
            int mask = i+1;
            for (int j=0; j<k; j++) {
                // j: index of basic term
                int bit = (mask >> (k-j-1)) & 1;
                if (bit == 1) {
                    subset.add(S[j]);
                }
            }

            double p = 1;
            for (double sel: subset)
                p *= sel;

            int n = subset.size();

            boolean no_branch = false;
            double cost = getLogicAndCost(p, n);
            double no_branch_cost = getNoBranchCost(n);
            if (no_branch_cost < cost) {
                cost = no_branch_cost;
                no_branch = true;
            }

            Record r = new Record(n, p, no_branch, cost);
            ret[i] = r;
        }
        return ret;
    }

    private double getLogicAndCost(double p, int k) {
        double q = p<=0.5 ? p : 1-p;
        return k*r + (k-1)*l + f*k + t + m*q + p*a;
    }

    private double getNoBranchCost(int k) {
        return k*r + (k-1)*l + f*k + a;
    }

    public static void main(String[] args) {
        // read in query.txt and config.txt
    	if (args.length != 2) {
    		System.out.println("Need two Parameters and get one instead");
    		System.exit(-1);
    	}
        try {
            Properties config = new Properties();
            config.load(new FileInputStream(args[1]));

            Optimizer optimizer = new Optimizer(config);
            ArrayList<Double[]> query_sets = loadQueryFile(args[0]);

            // handle 1 line in query.txt at a time
            for (Double[] set: query_sets) {
                // run the algorithm in the paper
            	Record[] plan = optimizer.plan(set);

                println("====================================================");
                println(Arrays.toString(set));
                println("----------------------------------------------------");
                println(produceCode(plan, set.length));
                println("----------------------------------------------------");
                println("cost: " + plan[plan.length-1].c);
            }
            println("====================================================");

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // the code is divided into two parts, one is for logical and and branch and
    // the other part is for no branch code
    private static String produceCode(Record[] plan, int k) {
    	String ifCode = "";
    	String noBranchCode = "";
        ArrayList<String> code = new ArrayList<String>();
        code.add(ifCode);
        code.add(noBranchCode);
        int rm = getRightMost(plan);
        getComponents(code, plan, plan.length-1, rm, k);
        if (code.get(0).length() != 0) {
            code.set(0, "if(" + code.get(0) + "){\n");
        }
        if (code.get(1).length() != 0) {
            code.set(1, "\tanswer[j] = i;\n\tj += (" + code.get(1) + ");\n");
        } else {
            code.set(1, "\tanswer[j++] = i;\n");
        }
        if (code.get(0).length() != 0) {
            code.add("}\n");
        }
        StringBuffer ret = new StringBuffer();
        for (String str: code) {
            ret.append(str);
        }
        return ret.toString();
    }

    // this function recursively visit the plan and construct the code
    // if the right most term has nobranch bit set, then the code has a nobranch section
    private static void getComponents(ArrayList<String> code, Record[] plan, int pos, int rm, int k) {
        // basic case: find all logical and term
        if (pos == plan.length-1) {
            String noBranch = getCodeFromIndex(rm, k);
            code.set(1, noBranch);
        }
        if (plan[pos].L == -1 && plan[pos].R == -1) {
            if (pos != rm) {
                String part = getCodeFromIndex(pos, k);
                part = "(" + part + ")";
                String ifCode = code.get(0);
                ifCode += part;
                code.set(0, ifCode);
            }
        } else {
            getComponents(code, plan, plan[pos].L, rm, k);
            if (plan[pos].R != rm) {
                String ifCode = code.get(0);
                ifCode += " && ";
                code.set(0, ifCode);
                getComponents(code, plan, plan[pos].R, rm, k);
            }
        }
    }
    
    // this function takes an index of the plan as input and
    // output the basic logical and component
    private static String getCodeFromIndex(int pos, int k) {
        ArrayList<Integer> indexes = getIndex(pos, k);
        String str = "";
        for (int i: indexes) {
            if (str.length()>0) {
                str += " & ";
            }
            str += formatIndex(i);
        }
        return str;
    }
    // this simple function iterate along the right most path 
    // in order to find the rightmost plan
    private static int getRightMost(Record[] plan) {
        int pos = plan.length-1;
        while (plan[pos].R != -1) {
            pos = plan[pos].R;
        }
        return pos;
    }

    private static String formatIndex(int index) {
        return "t" + index + "[o" + index + "[i]]";
    }

    // this function takes a list of index of the subset as input and
    // generate all terms it contains using bit manipulation 
    private static ArrayList<Integer> getIndex(int pos, int k) {
        ArrayList<Integer> indexes = new ArrayList<Integer>();
        pos += 1;
        int mask = pos;
        for (int j=1; j<=k; j++) {
            int bit = (mask >> (k-j)) & 1;
            if (bit == 1) {
               indexes.add(j);
            }
        }
        return indexes;
    }


    private static ArrayList<Double[]> loadQueryFile(String filename) throws IOException {
        ArrayList<Double[]> ret = new ArrayList<Double[]>();

        BufferedReader br = new BufferedReader(new FileReader(filename));
        String query = br.readLine();

        while (query != null) {
            String[] tokens = query.split(" ");
            Double[] selectivity_list = new Double[tokens.length];
            for (int i=0; i<tokens.length; i++) {
                selectivity_list[i] = Double.parseDouble(tokens[i]);
            }
            ret.add(selectivity_list);
            query = br.readLine();
        }
        return ret;
    }

    private static void println(String msg) {
        System.out.println(msg);
    }
}
