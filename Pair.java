public class Pair implements Comparable {
    private double x;
    private double y;

    public Pair(double x, double y) {
        this.x = x;
        this.y = y;
    }

    public double getX() { return x; }
    public double getY() { return y; }

    @Override
    public int compareTo(Object other) {    // return 1 if this < o
        Pair o = (Pair)other;
        if (this.x < o.getX() && this.y < o.getY())
            return 1;
        else if (this.x == o.getX() && this.y == o.getY())
            return 0;
        else
            return -1;
    }

    public static void main(String[] args) {
        Pair a = new Pair(1,10);
        Pair b = new Pair(0,9);
        System.out.println("a>b: return "+a.compareTo(b));
        System.out.println("b<a: return "+b.compareTo(a));
    }
}
