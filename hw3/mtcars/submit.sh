#!/bin/bash
mkdir -p slurm_out
jobId1=$(sbatch --output="slurm_out/slurm-%A_%a.out" \
		getData.sh)
jobId1=$(echo $jobId1 | sed 's/Submitted batch job //')
jobId2=$(sbatch --array=1-3 \
		--output="slurm_out/slurm-%A_%a.out" \
                --dependency=afterok:$jobId1 \
                jobArray.sh)
jobId2=$(echo $jobId2 | sed 's/Submitted batch job //')
jobId3=$(sbatch --dependency=afterok:$jobId2 \
		--output="slurm_out/slurm-%A_%a.out" \
                findLightest.sh)
