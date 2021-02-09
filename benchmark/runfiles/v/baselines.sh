sbatch -c 32 --mem 16GB ppo_4lane_sv.sh
sbatch -c 32 --mem 16GB ppo_bid_sv.sh
sbatch -c 32 --mem 16GB ppo_double_merge_cross.sh
sbatch -c 32 --mem 16GB ppo_double_merge_nocross.sh
