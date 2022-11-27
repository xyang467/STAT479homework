#!/bin/bash
cat out{1..3}.csv | sort -n | head -n 1 > out
