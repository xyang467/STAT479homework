#!/bin/bash
mkdir -p log
mkdir -p error
mkdir -p output
wget http://www.stat.wisc.edu/~jgillett/479/CHTC/callingR/packages_FITSio.tar.gz
ls /home/groups/STAT605/boss/tgz/$* | head -n 1 | cut -d. -f1 > list1
ls /home/groups/STAT605/boss/tgz/$* | head -n 5 | cut -d. -f1 > list5
ls /home/groups/STAT605/boss/tgz/$* | cut -d. -f1 > list

