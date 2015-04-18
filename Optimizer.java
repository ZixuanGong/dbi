package dbi;

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

    private /* return type */ void plan(Double[] S) {
        Record A[] = genAllSubsets(S);
        for (int i = 0; i < A.length; i++) {
        	for (int j = 0; j < i; j ++) {
        		
        		if (compareCMetric(A[i], A[j])) {
        			
        		} else if (compareDMetric(A[i], A[j])) {
        			
        		} else {
        			
        		}
        		
        	}
        }


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
            double cost = logicAndCost(subset);
            double br_and_cost = noBranchAndCost(subset);
            if (br_and_cost < cost) {
                cost = br_and_cost;
                no_branch = true;
            }
            double p = 1
            for (double sel: subset) {
            	p *= sel
            }

            Record r = new Record(subset.size(), p, no_branch, cost);
            ret[i] = r
        }
        return ret;
    }

    private double logicAndCost(ArrayList<Double> subset) {
        double p = 1;   // product of all selectivities
        for (double sel: subset) {
            p *= sel;
        }

        double q = p<=0.5 ? p : 1-p;
        int k = subset.size();
        return k*r + (k-1)*l + f*k + t + m*q + p*a;
    }

    private double noBranchAndCost(ArrayList<Double> subset) {
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
                /* plan= */optimizer.plan(set);


                println("=============");
                println(Arrays.toString(set));
                println("-------------");
                /* println(genCodeForPlan(plan)); */
                println("-------------");
                println("cost: " /* + cost */);
            }
            println("=============");

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
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
        System.out.println(msg);
    }
}
