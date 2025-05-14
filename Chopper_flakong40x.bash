#!/bin/bash
#SBATCH --job-name=25xchopper  # sensible name for the job
#SBATCH --mail-user=yourname@nmbu.no # Email me when job is done.
#SBATCH --mem=100G                 # Memory allocation
#SBATCH --ntasks=1                 # One task
#SBATCH --cpus-per-task=8          # Number of CPU cores
#SBATCH --mail-type=END            # Send mail at end of job
#SBATCH --output=filter_%j.log     # Output log

# Activate conda environment with NanoFilt or Chopper (depending on your use case)
module load Miniconda3 && eval "$(conda shell.bash hook)"
conda activate /mnt/users/oleg/.conda/envs/MyCondaEnvironments

echo "Working with this $CONDA_PREFIX environment..."

# Input files
input_file1="/mnt/SCRATCH/oleg/fastq/downsampling/seed1__flakong_40x.fastq.gz"

# Output files
output_file1="filtered_seed1_flakong_40x.fastq.gz"

# Run NanoFilt for quality and length filtering
echo "Filtering $input_file1..."
gunzip -c $input_file1 | chopper -q 10 -l 1000 | gzip > $output_file1


echo "Filtering complete!"

