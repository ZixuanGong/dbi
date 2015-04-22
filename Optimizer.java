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
    double r,t,l,m,a,f;
    private Record A[];

    public Optimizer(Properties config) {
        r = Double.parseDouble(config.getProperty("r"));
        t = Double.parseDouble(config.getProperty("t"));
        l = Double.parseDouble(config.getProperty("l"));
        m = Double.parseDouble(config.getProperty("m"));
        a = Double.parseDouble(config.getProperty("a"));
        f = Double.parseDouble(config.getProperty("f"));
    }

    private Record[] plan(Double[] S) {
        A = genAllSubsets(S);

        Arrays.sort(A);
        for (Record r: A)
            println(r.toString());

        for (int i = 0; i < A.length; i++) { // s: A[i], right child
            for (int j = 0; j < A.length; j++) { // s': A[j], left child, &-term

                // check if s (intersect with) s' is empty
                int mask_right = i + 1;
                int mask_left = j + 1;
                if ((mask_left & mask_right) != 0) {
                    continue;
                }

                if (suboptimalByCMetric(j, i)
                    || suboptimalByDMetric(j, i)) {
                    // suboptimal -> skip
                } else {
                    double cost = getCostForCombinedPlan(A[j], A[i]);
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

    private double getCostForCombinedPlan(Record left, Record right) {
        double p = left.p;
        double q = p<=0.5 ? p : 1-p;
        return getFcost(left) + m*q + p*right.c;
    }

    private boolean suboptimalByCMetric(int l, int r) {
        // c_metric of left < c_metric of the leftmost & term in right
        Record r_lm = getLeftmostAndTerm(A[r]);
        Record left = A[l];

        Pair l_cmetric = new Pair((left.p - 1.0)/getFcost(left), left.p);
        Pair r_cmetric = new Pair((r_lm.p - 1.0)/getFcost(r_lm), r_lm.p);

        // l < r
        return l_cmetric.compareTo(r_cmetric) > 0 ? true : false;
    }

    private Record getLeftmostAndTerm(Record r) {
        Record lm = r;
        while (lm.L != -1) {
            lm = A[lm.L];
        }
        return lm;
    }

    private boolean suboptimalByDMetric(int l, int r) {
        Record left = A[l];
        if (left.p > 0.5)
            return false;

        Pair l_dmetric = new Pair(getFcost(left), left.p);
        ArrayList<Integer> terms = getAllAndTerms(r);
        for (int i = 1; i < terms.size(); i++) { // skip the left most term
            Record term = A[i];
            Pair r_dmetric = new Pair(getFcost(term), term.p);
            if (l_dmetric.compareTo(r_dmetric) > 0)
                return true;
        }
        return false;
    }

    private ArrayList<Integer> getAllAndTerms (int r) {
        ArrayList<Integer> ret = new ArrayList<Integer>();
        inOrderTraverse(ret, r);
        return ret;
    }

    private void inOrderTraverse(ArrayList<Integer> list, int i) {
        if (i == -1)
            return;

        inOrderTraverse(list, A[i].L);
        list.add(i);
        inOrderTraverse(list, A[i].R);
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
            // e.g. if k=4, mask=(dec)2=(bin)0010, then create a subset for S[3]
            int mask = i+1;
            for (int j=0; j<k; j++) {
                /* j: index of basic term */
                int bit = (mask >> (k-j-1)) & 1;
                if (bit == 1) {
                    subset.add(S[j]);
                }
            }
            boolean no_branch = false;
            double cost = getLogicAndCost(subset);
            double no_branch_cost = getNoBranchCost(subset);
            if (no_branch_cost < cost) {
                cost = no_branch_cost;
                no_branch = true;
            }
            double p = 1;
            for (double sel: subset) {
                p *= sel;
            }

            Record r = new Record(subset.size(), p, no_branch, cost);
            ret[i] = r;
        }
        return ret;
    }

    private double getLogicAndCost(ArrayList<Double> subset) {
        double p = 1;   // product of all selectivities
        for (double sel: subset) {
            p *= sel;
        }

        double q = p<=0.5 ? p : 1-p;
        int k = subset.size();
        return k*r + (k-1)*l + f*k + t + m*q + p*a;
    }

    private double getNoBranchCost(ArrayList<Double> subset) {
        int k = subset.size();
        return k*r + (k-1)*l + f*k + a;
    }

    public static void main(String[] args) {
        /* read in query.txt and config.txt */
    	if (args.length != 2) {
    		System.out.println("Need two Parameters and get one instead");
    		System.exit(-1);
    	}
        try {
            Properties config = new Properties();
            config.load(new FileInputStream(args[1]));

            Optimizer optimizer = new Optimizer(config);

            ArrayList<Double[]> query_sets = loadQueryFile(args[0]);

            for (Double[] set: query_sets) {
                println("=============");

            	Record[] plan = optimizer.plan(set);

                println("=============");
                println(Arrays.toString(set));
                println("-------------");
                // println(produceCode(plan, set.length));
                println("-------------");
                println("cost: " + plan[plan.length-1].c);
            }
            println("=============");

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static String produceCode(Record[] plan, int k) {
    	String ifCode = "";
    	String noBranchCode = "";
        ArrayList<String> code = new ArrayList<String>();
        code.add(ifCode);
        code.add(noBranchCode);
        getComponents(code, plan, plan.length-1, k);
        code.set(0, "if(" + code.get(0) + "){\n");
        if (code.get(1).length() != 0) {
            code.set(1, "\tanswer[j] = i;\n\tj += (" + code.get(1) + ");\n");
        } else {
            code.set(1, "\tanswer[j++] = i;\n");
        }
        code.add("}\n");
        StringBuffer ret = new StringBuffer();
        for (String str: code) {
            ret.append(str);
        }
        return ret.toString();
    }

    private static void getComponents(ArrayList<String> code, Record[] plan, int pos, int k) {
        if (plan[pos].L == -1) {
            ArrayList<Integer> indexes = getIndex(pos, k);
            String str = "";
            for (int i: indexes) {
                if (str.length()>0) {
                    str += "&";
                }
                str += formatIndex(i);
            }
            if (plan[pos].b) {
                String noBranch = code.get(1);
                if (noBranch.length()>0) {
                    noBranch += " & ";
                }
                noBranch += str;
                code.set(1, noBranch);
            } else {
                String ifCode = code.get(0);
                if (ifCode.length()>0) {
                    ifCode += " && ";
                }
                ifCode += "(" + str + ")";
                code.set(0, ifCode);
            }
            return;
        }
        getComponents(code, plan, plan[pos].L, k);
        getComponents(code, plan, plan[pos].R, k);
    }

    private static String formatIndex(int index) {
        return "t" + index + "[o" + index + "[i]]";
    }

    private static ArrayList<Integer> getIndex(int pos, int k) {
        ArrayList<Integer> indexes = new ArrayList<Integer>();
        pos += 1;
        int mask = pos + 1;
        for (int j=0; j<k; j++) {
            int bit = (mask >> (k-j-1)) & 1;
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
            // System.out.println(query);
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
        // System.out.println(msg);
    }

    private static void debug(String msg) {
        System.err.println(msg);
    }
}
