## W4112 Project2 phase2
- Jiaqi Liu (jl4386)
- Zixuan Gong (zg2203)

This is the course project 2 for W4112 Database systems implemetation. The idea of the project comes from the algorithm proposed in paper "Selection Conditions in Main Memory" by Kenneth A. Ross. In this project, a cost estimation model has been built, which takes branch misprediction penalty into consideration. With this cost model, it is possible to choose the one with optimal esitimated cost among all potential plans for combining selections, in dynamic programming fashion.  

### Files
- Java code
    + Optimizer.java // main() function is in this file
    + Record.java
    + Pair.java
- Makefile
- stage2.sh
- query.txt
- config.txt
- output.txt // output with query.txt and config.txt
- README.md

### Make and Run
`$ make`  
`$ ./stage2.sh query.txt config.txt`

### Query File
Each line in the query file is the selectivities for a set of basic terms. Each selectivity is separated by a whitespace.
