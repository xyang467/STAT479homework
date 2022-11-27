#!/bin/bash
number=$(ls [[:digit:]]*.csv | wc -l)  # count the number of files and remove repeated headers
sort -m -k 1n *.csv | tail -n +$number | head -n 101 > hw4best100.csv 
# including best100 and 1 header
