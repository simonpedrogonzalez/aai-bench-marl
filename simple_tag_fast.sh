HYDRA_FULL_ERROR=1 uv run thirdparty/BenchMARL/benchmarl/run.py -m \
algorithm=qmix,masac,mappo \
task=pettingzoo/simple_tag \
--config-path /media/simon/HDD/strix/repos/aai/aai-bench-marl/thirdparty/BenchMARL/fine_tuned/vmas/conf --config-name config_fast \
