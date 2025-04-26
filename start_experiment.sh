
# defaults
# max_n_frames: 3_000_000
# on_policy_collected_frames_per_batch: 6000
# evaluation_episodes: 10
# all devices to cpu

HYDRA_FULL_ERROR=1 uv run thirdparty/BenchMARL/benchmarl/run.py -m \
algorithm=mappo,qmix,masac \
task=meltingpot/collaborative_cooking__crowded,\
meltingpot/clean_up,\
meltingpot/running_with_scissors_in_the_matrix__arena \
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
experiment.checkpoint_interval=30000 \
experiment.max_n_frames=500000 \
experiment.on_policy_collected_frames_per_batch=3000 \
experiment.off_policy_collected_frames_per_batch=3000 \
experiment.checkpoint_at_end=True \
experiment.sampling_device="cpu" \
experiment.train_device="cpu" \
experiment.buffer_device="cpu"



# HYDRA_FULL_ERROR=1 uv run thirdparty/BenchMARL/benchmarl/run.py -m \
# algorithm=mappo \
# task=meltingpot/collaborative_cooking__crowded \
# model=sequence \
# "model.intermediate_sizes=[32]" \
# "model/layers@model.layers.l1=cnn" \
# "model/layers@model.layers.l2=mlp" \
# "model/layers/l1.cnn_num_cells=[16,16,16]" \
# "model/layers/l2.num_cells=[64]" \
# model@critic_model=sequence \
# "critic_model.intermediate_sizes=[32]" \
# "model/layers@critic_model.layers.l1=cnn" \
# "model/layers@critic_model.layers.l2=mlp" \
# seed=0 \
# experiment.save_folder=./outputs \
# experiment.checkpoint_interval=0 \
# experiment.on_policy_collected_frames_per_batch=100 \
# experiment.off_policy_collected_frames_per_batch=100 \
# experiment.max_n_frames=500 \
# experiment.checkpoint_at_end=True \
# experiment.sampling_device="cuda" \
# experiment.train_device="cuda" \
# experiment.buffer_device="cuda" \
# experiment.off_policy_memory_size=100 \
# experiment.on_policy_n_envs_per_worker=1 \
# experiment.off_policy_train_batch_size=128 \
# experiment.on_policy_train_batch_size=128 \
# experiment.off_policy_n_envs_per_worker=1 \
# experiment.loggers=[csv]