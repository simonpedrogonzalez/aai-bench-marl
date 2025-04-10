
# defaults
# max_n_frames: 3_000_000
# on_policy_collected_frames_per_batch: 6000
# evaluation_episodes: 10
# all devices to cpu

# HYDRA_FULL_ERROR=1 uv run thirdparty/BenchMARL/benchmarl/run.py -m \
# algorithm=mappo,qmix,masac \
# task=meltingpot/collaborative_cooking__crowded,\
# meltingpot/clean_up,\
# meltingpot/running_with_scissors_in_the_matrix__arena \
# model=sequence \
# "model.intermediate_sizes=[256]" \
# "model/layers@model.layers.l1=cnn" \
# "model/layers@model.layers.l2=mlp" \
# model@critic_model=sequence \
# "critic_model.intermediate_sizes=[256]" \
# "model/layers@critic_model.layers.l1=cnn" \
# "model/layers@critic_model.layers.l2=mlp" \
# seed=0 \
# experiment.save_folder=./outputs \
# experiment.checkpoint_interval=60000 \
# experiment.checkpoint_at_end=True \
# experiment.sampling_device="cpu" \
# experiment.train_device="cuda" \
# experiment.buffer_device="cpu" \
# experiment.loggers=[csv] 



HYDRA_FULL_ERROR=1 uv run thirdparty/BenchMARL/benchmarl/run.py -m \
algorithm=mappo \
task=meltingpot/collaborative_cooking__crowded \
model=sequence \
"model.intermediate_sizes=[256]" \
"model/layers@model.layers.l1=cnn" \
"model/layers@model.layers.l2=mlp" \
model@critic_model=sequence \
"critic_model.intermediate_sizes=[256]" \
"model/layers@critic_model.layers.l1=cnn" \
"model/layers@critic_model.layers.l2=mlp" \
seed=0 \
experiment.save_folder=./outputs \
experiment.checkpoint_interval=60000 \
experiment.checkpoint_at_end=True \
experiment.sampling_device="cpu" \
experiment.train_device="cpu" \
experiment.buffer_device="cpu" \
experiment.loggers=[csv] 