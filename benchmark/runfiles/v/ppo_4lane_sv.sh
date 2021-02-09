#!/bin/bash
#SBATCH --ntasks=1
#SBATCH -t 40:00:00
#SBATCH -J 4lane_sv
#SBATCH --gres=gpu:0
#SBATCH -p cpu
#SBATCH --qos=nopreemption
##SBATCH -o /scratch/ssd001/home/cjhzhang/sbatch_outs/smarts-ppo-4lane_sv-%J.out 
#SBATCH -o /scratch/ssd001/home/cjhzhang/sbatch_outs/smarts-ppo-4lane_sv.out 

hostname

source /h/cjhzhang/.bashrc
conda activate smarts

cd /scratch/ssd001/home/cjhzhang/project/smarts/benchmark
xvfb-run -a python -u run.py scenarios/intersections/4lane_sv -f agents/ppo/baseline-continuous-control.yaml --log_dir /scratch/ssd001/home/cjhzhang/baseline_logs --num_workers 16

