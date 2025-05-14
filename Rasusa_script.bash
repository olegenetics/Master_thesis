#!/bin/bash
#SBATCH --job-name=25x_rasusa  # sensible name for the job
#SBATCH --mail-user=yourname@nmbu.no # Email me when job is done.
#SBATCH --mem=10G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mail-type=END

##Activate conda environment
module load Miniconda3 && eval "$(conda shell.bash hook)"


conda activate /mnt/users/oleg/.conda/envs/MyCondaEnvironments

echo "Working with this $CONDA_PREFIX environment ..."


## runs rasusa by applying desired read depth and size of the reference genome

rasusa reads -c 40 -g 2.6gb --seed 1 /mnt/SCRATCH/oleg/fastq/flakong.start.fastq.gz | gzip > /mnt/SCRATCH/oleg/fastq/downsampling/seed1__flakong_40x.fastq.gz
rasusa reads -c 40 -g 2.6gb --seed 2 /mnt/SCRATCH/oleg/fastq/flakong.start.fastq.gz | gzip > /mnt/SCRATCH/oleg/fastq/downsampling/seed2__flakong_40x.fastq.gz
rasusa reads -c 40 -g 2.6gb --seed 3 /mnt/SCRATCH/oleg/fastq/flakong.start.fastq.gz | gzip > /mnt/SCRATCH/oleg/fastq/downsampling/seed3__flakong_40x.fastq.gz

