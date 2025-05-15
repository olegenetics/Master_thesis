#!/bin/bash
#SBATCH --job-name=25xchopper  
#SBATCH --mail-user=yourname@nmbu.no 
#SBATCH --mem=100G               
#SBATCH --ntasks=1                
#SBATCH --cpus-per-task=8          
#SBATCH --mail-type=END            
#SBATCH --output=filter_%j.log     

# Activates conda environment 
module load Miniconda3 && eval "$(conda shell.bash hook)"
conda activate /mnt/users/oleg/.conda/envs/MyCondaEnvironments

echo "Working with this $CONDA_PREFIX environment..."

# Input files
input_file1="/mnt/SCRATCH/oleg/fastq/downsampling/seed1__flakong_40x.fastq.gz"

# Output files
output_file1="filtered_seed1_flakong_40x.fastq.gz"

# Run Chopper for quality and length filtering
echo "Filtering $input_file1..."
gunzip -c $input_file1 | chopper -q 10 -l 1000 | gzip > $output_file1


echo "Filtering complete!"

