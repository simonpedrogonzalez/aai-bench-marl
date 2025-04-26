HYDRA_FULL_ERROR=1 uv run thirdparty/BenchMARL/benchmarl/run.py -m \
  algorithm=qmix \
  task=vmas/balance \
  seed=0 \
  "experiment.loggers=[csv]"
