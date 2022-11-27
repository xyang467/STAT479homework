#!/bin/bash
n=$SLURM_ARRAY_TASK_ID
cat mtcars$n.csv |
cut -d, -f7,11 |
awk -F, '{ if ($2 == "3") {print $0} }' |
cut -d, -f1 > out$n.csv
