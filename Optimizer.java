import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Properties;

public class Optimizer {
    Properties config;

    public Optimizer(Properties config) {
        this.config = config;
    }

    private /* return type */ void plan(Double[] query) {

    }

    public static void main(String[] args) {
        /* read in query.txt and config.txt */
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
        ArrayList<Double[]> ret = new ArrayList<>();

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
