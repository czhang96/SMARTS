#!/bin/bash
#SBATCH --ntasks=1
#SBATCH -t 40:00:00
#SBATCH -J 4lane
#SBATCH --gres=gpu:0
#SBATCH --mem=64GB
#SBATCH -c 32
#SBATCH -p cpu
#SBATCH --qos=nopreemption
#SBATCH -o /scratch/ssd001/home/cjhzhang/sbatch_outs/smarts-ppo-4lane-%J.out 


ipnip=$(hostname -i)
echo ipnip=$ipnip

source /h/cjhzhang/.bashrc
conda activate smarts

cd /scratch/ssd001/home/cjhzhang/project/smarts/benchmark
xvfb-run -a python -u run.py scenarios/intersections/4lane -f agents/ppo/baseline-continuous-control.yaml --log_dir /scratch/ssd001/home/cjhzhang/logs --num_workers 16

