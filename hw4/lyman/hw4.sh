#!/bin/bash
tar -xzf R402.tar.gz
tar -xzf packages_FITSio.tar.gz
tar -xzf $2.tgz

export PATH=$PWD/R/bin:$PATH
export RHOME=$PWD/R
export R_LIBS=$PWD/packages

Rscript hw4.R $1 $2
