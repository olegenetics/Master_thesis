#!/bin/bash
#SBATCH --job-name=10x_af_nanoplot_flakong  
#SBATCH --mail-user=yourname@nmbu.no  
#SBATCH --mail-type=END              
#SBATCH --mem=75G                    
#SBATCH --ntasks=1                    
#SBATCH --cpus-per-task=8             
#SBATCH --time=24:00:00               
#SBATCH --output=nanoplot5x_af.flakong_%j.log     

# Activates the conda environment containing NanoPlot
module load Miniconda3 && eval "$(conda shell.bash hook)"
conda activate /mnt/users/oleg/.conda/envs/MyCondaEnvironments

echo "Working with this $CONDA_PREFIX environment ..."

# Input files
input_file1="/mnt/SCRATCH/oleg/fastq/flakong_afterfiltering/chopper/filtered_seed1_flakong_8x.fastq.gz"
input_file2="/mnt/SCRATCH/oleg/fastq/flakong_afterfiltering/chopper/filtered_seed2_flakong_8x.fastq.gz"
input_file3="/mnt/SCRATCH/oleg/fastq/flakong_afterfiltering/chopper/filtered_seed3_flakong_8x.fastq.gz"

# Output directories
output_dir1="/mnt/SCRATCH/oleg/fastq/nanoplot"
output_dir2="/mnt/SCRATCH/oleg/fastq/nanoplot"
output_dir3="/mnt/SCRATCH/oleg/fastq/nanoplot"


# Runs NanoPlot for seed1__flakong_10x.fastq.gz
echo "Running NanoPlot for $input_file1..."
NanoPlot --fastq "$input_file1" --outdir "$output_dir1" --plots hex dot --no_supplementary --no_static --N50 -p after__filtering_flakong10x_seed1

# Runs NanoPlot for seed2__flakong_10x.fastq.gz
echo "Running NanoPlot for $input_file2..."
NanoPlot --fastq "$input_file2" --outdir "$output_dir2" --plots hex dot --no_supplementary --no_static --N50 -p after_filtering_flakong10x_seed2

# Runs NanoPlot for seed3__flakong_10x.fastq.gz
echo "Running NanoPlot for $input_file3..."
NanoPlot --fastq "$input_file3" --outdir "$output_dir3" --plots hex dot --no_supplementary --no_static --N50 -p after_filtering_flakong10x_seed3

echo "NanoPlot analysis completed for both files."

