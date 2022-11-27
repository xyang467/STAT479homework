#!/bin/bash
cat allMSN.csv |
cut -d, -f3,4,5 |
sort -n |
head -n 1 > farthest.txt
