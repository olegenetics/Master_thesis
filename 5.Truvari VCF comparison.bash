#!/bin/bash
#SBATCH --job-name=70x_10x_seed1_truvari  # sensible name for the job
#SBATCH --mem=15G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

##Activate conda environment
module load Miniconda3 && eval "$(conda shell.bash hook)"


conda activate /mnt/users/oleg/.conda/envs/mapping_and_calling

echo "Working with this $CONDA_PREFIX environment ..."
The bench paramater with the options -b (base) and -c (comparison) file were used to compared the "truth" sample of SVs with the downsampled datasets
truvari bench -b /mnt/users/oleg/vcf/70x_before_filtering.vcf.gz -c /mnt/users/oleg/vcf/10x_seed1_after_filtering.vcf.gz -o /mnt/SCRATCH/oleg/fastq/truvari_70x_10x_seed1_after_filterng

