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

    public Optimizer(Properties config) {
        r = Double.parseDouble(config.getProperty("r"));
        t = Double.parseDouble(config.getProperty("t"));
        l = Double.parseDouble(config.getProperty("l"));
        m = Double.parseDouble(config.getProperty("m"));
        a = Double.parseDouble(config.getProperty("a"));
        f = Double.parseDouble(config.getProperty("f"));
    }

    private Record[] plan(Double[] S) {
        Record A[] = genAllSubsets(S);

        for (int i = 0; i < A.length; i++) {
            for (int j = 0; j < A.length; j++) {
                int mask_right = i + 1;
                int mask_left = j + 1;
                if ((mask_left & mask_right) != 0) {
                    continue;
                }
                if (suboptimalByCMetric(A[j], A[i])
                    || suboptimalByDMetric(A[j], A[i])) {
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

    private boolean suboptimalByCMetric(Record left, Record right) {
        double r_cmetric = (right.p - 1.0)/getFcost(right);
        double l_cmetric = (left.p - 1.0)/getFcost(left);

        if (right.p>left.p && r_cmetric>l_cmetric)
            return true;
        else
            return false;
    }

    private boolean suboptimalByDMetric(Record left, Record right) {
        if (right.p<=0.5 && right.p > left.p && getFcost(right) > getFcost(left))
            return true;
        else
            return false;
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

            	Record[] plan = optimizer.plan(set);
                println("=============");
                println(Arrays.toString(set));
                println("-------------");
                //println(produceCode(plan));
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

    // private static String produceCode(Record[] plan) {
    	// String ifCode = "";
    	// String branchCode = "";
     //    ArrayList<String> = getComponents(plan, plan.length-1);
    // }

    // private static ArrayList<String> getComponents(Record[] plan, int index) {
        // if (plan.L == -1) {
        //     if (plan.b == )
        // }
    // }



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
        System.out.println(msg);
    }
}
