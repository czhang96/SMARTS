#!/bin/bash
#SBATCH --ntasks=1
#SBATCH -t 24:00:00               
#SBATCH -J smarts-ppo
#SBATCH --gres=gpu:0
#SBATCH --mem=4GB
#SBATCh -c 4
#SBATCH -p cpu
#SBATCH -w cpu2
#SBATCH -o /scratch/gobi1/cjhzhang/sbatch_outs/smarts-ppo-%J.out 


ipnip=$(hostname -i)
echo ipnip=$ipnip

source /h/cjhzhang/.bashrc
conda activate smarts

cd /scratch/gobi1/cjhzhang/project/smarts/benchmark/
xvfb-run -a python -u run.py ../scenarios/zoo_intersection -f agents/ppo/baseline-continuous-control.yaml --log_dir /scratch/gobi1/cjhzhang/logs


