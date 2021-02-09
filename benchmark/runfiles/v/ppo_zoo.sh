#!/bin/bash
#SBATCH --ntasks=1
#SBATCH -t 40:00:00
#SBATCH -J zoo
#SBATCH --gres=gpu:0
#SBATCH --mem=64GB
#SBATCH --cpus-per-task=32
#SBATCH -p cpu
##SBATCH -x cpu010,cpu008
#SBATCH --qos=nopreemption
##SBATCH -o /scratch/ssd001/home/cjhzhang/sbatch_outs/smarts-ppo-zoo-%J.out 
#SBATCH -o /scratch/ssd001/home/cjhzhang/sbatch_outs/dump.out 


ipnip=$(hostname -i)
echo ipnip=$ipnip

source /h/cjhzhang/.bashrc
conda activate smarts

cd /scratch/ssd001/home/cjhzhang/project/smarts/benchmark
# xvfb-run -a python -u run.py ../scenarios/zoo_intersection -f agents/ppo/baseline-continuous-control.yaml --log_dir /scratch/ssd001/home/cjhzhang/logs --num_workers 16
# xvfb-run -a python -u run.py ../scenarios/zoo_intersection -f agents/ppo/baseline-continuous-control.yaml --log_dir /scratch/ssd001/home/cjhzhang/dumps --num_workers 16

srun --mem=32G -c 32 -p cpu --qos=nopreemption xvfb-run -a python -u run.py ../scenarios/zoo_intersection -f agents/ppo/baseline-continuous-control.yaml --log_dir /scratch/ssd001/home/cjhzhang/dumps --num_workers 16