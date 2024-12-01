#!/bin/bash
#SBATCH --job-name=10x_seed1_truvari  # sensible name for the job
#SBATCH --mem=10G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

##Activate conda environment
module load Miniconda3 && eval "$(conda shell.bash hook)"


conda activate /mnt/users/oleg/.conda/envs/mapping_and_calling

echo "Working with this $CONDA_PREFIX environment ..."

truvari bench -b /mnt/users/oleg/vcf/10x_seed1_before_filtering.vcf.gz -c /mnt/users/oleg/vcf/10x_seed1_after_filtering.vcf.gz -o /mnt/SCRATCH/oleg/fastq/truvari_10x_seed1

