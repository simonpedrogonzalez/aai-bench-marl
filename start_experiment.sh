
# defaults
# max_n_frames: 3_000_000
# on_policy_collected_frames_per_batch: 6000
# evaluation_episodes: 10
# all devices to cpu

uv run thirdparty/BenchMARL/benchmarl/run.py -m \
algorithm=mappo,qmix,masac \
task=meltingpot/collaborative_cooking__crowded,\
meltingpot/clean_up,\
meltingpot/running_with_scissors_in_the_matrix__arena \
seed=0 \
experiment.save_folder=./results \
experiment.checkpoint_interval=1000 \
experiment.checkpoint_at_end=True \
experiment.max_n_frames=10000 \
experiment.evaluation_episodes=1 \
experiment.sampling_device="cpu" \
experiment.train_device="cuda" \
experiment.buffer_device="cpu"
