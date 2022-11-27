#!/bin/bash
n=$SLURM_ARRAY_TASK_ID
wget http://pages.stat.wisc.edu/~jgillett/479/HPC/airlines/$n.csv.bz2
bzip2 -d $n.csv.bz2
cat $n.csv |
cut -d, -f4,16,17,18,19 |
awk -F, '{ if ($3 == "MSN") {print $0} }' > MSN$n.csv
