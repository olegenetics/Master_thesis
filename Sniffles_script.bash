#!/bin/bash
#SBATCH --job-name=70x_after  # sensible name for the job
#SBATCH --mem=200G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

##Activate conda environment
module load Miniconda3 && eval "$(conda shell.bash hook)"


conda activate /mnt/users/oleg/.conda/envs/mapping_and_calling

echo "Working with this $CONDA_PREFIX environment ..."


minimap2 -t 8 -x map-ont -a -a /mnt/SCRATCH/oleg/fastq/mapping_and_calling/Landrace_FroskCHR_MT_unmapped.fasta.gz  /mnt/SCRATCH/oleg/fastq/flakong_afterfiltering/nanofilt/70x_-l1000_-q10.fastq.gz > 70x_after_filtering.sam


# convert the sam file to bam format
samtools view -S -b 70x_after_filtering.sam > 70x_after_filtering0.bam

## sort the bam file
samtools sort 70x_after_filtering0.bam -o 70x_after_filtering.bam

# index the bam file
samtools index -M  70x_after_filtering.bam

# Variant Calling using Sniffles
sniffles --input  70x_after_filtering.bam --reference /mnt/SCRATCH/oleg/fastq/mapping_and_calling/Landrace_FroskCHR_MT_uncompressed.fasta --vcf 70x_after_filtering.vcf

