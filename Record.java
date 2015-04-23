// package dbi;

public class Record implements Comparable {
  int n;    // num of basic terms
  double p; // product of the selectivities of the terms in the subset
  boolean b;  // if no-branch is used
  double c; // current best cost
  int L = -1;  // index of the left child
  int R = -1;

  public Record(int n, double p, boolean b, double c) {
    this.n = n;
    this.p = p;
    this.b = b;
    this.c = c;
  }

  public String toString(){
    return "Rec: n="+n+" p="+p+" b="+b+" c="+c+" L="+L+" R="+R;
  }
}
