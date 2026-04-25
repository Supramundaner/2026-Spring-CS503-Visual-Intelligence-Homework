#!/bin/bash
#SBATCH --job-name=run_notebooks
#SBATCH --time=01:00:00
#SBATCH --account=cs-503
#SBATCH --qos=cs-503
#SBATCH --gres=gpu:1                    # 1 GPU is enough for inference
#SBATCH --mem=32G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --output=notebooks_job.out      # Output log file
#SBATCH --error=notebooks_job.err       # Error log file

eval "$(/home/ao/miniconda3/bin/conda shell.bash hook)"
conda activate nanofm

# Make sure nbconvert is available
pip install --quiet nbconvert jupyter 2>/dev/null

cd /home/ao/2026-Spring-CS503-Visual-Intelligence-Homework/NanoFM_Homeworks

echo "===== Running Part 3: nano4M notebook ====="
jupyter nbconvert --to notebook --execute --inplace \
    --ExecutePreprocessor.timeout=1800 \
    --ExecutePreprocessor.kernel_name=nanofm \
    notebooks/CS503_FM_part3_nano4M.ipynb
echo "===== Part 3 done ====="
