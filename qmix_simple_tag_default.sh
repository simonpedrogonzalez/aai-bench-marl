HYDRA_FULL_ERROR=1 uv run thirdparty/BenchMARL/benchmarl/run.py -m \
  algorithm=qmix \
  task=pettingzoo/simple_tag \
  seed=0 \
  experiment.buffer_device=cuda \
  experiment.sampling_device=cuda \
  experiment.train_device=cuda \
  "experiment.loggers=[csv,wandb]"
