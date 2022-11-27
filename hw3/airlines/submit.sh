#!/bin/bash
mkdir -p slurm_out
jobId1=$(sbatch --output="slurm_out/slurm-%A_%a.out" \
		--array=1987-2008 ./jobs.sh)
jobId1=$(echo $jobId1 | sed 's/Submitted batch job //')
jobId2=$(sbatch --output="slurm_out/slurm-%A_%a.out" \
		--dependency=afterok:$jobId1 combine.sh)
jobId2=$(echo $jobId2 | sed 's/Submitted batch job //')
sbatch --output="slurm_out/slurm-%A_%a.out"\
       --dependency=afterok:$jobId2\
       farthest.sh
sbatch --output="slurm_out/slurm-%A_%a.out"\
       --dependency=afterok:$jobId2\
       delays.sh
