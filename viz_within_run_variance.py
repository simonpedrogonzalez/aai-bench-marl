import matplotlib.pyplot as plt
import os
import pandas as pd
import numpy as np
import seaborn as sns

# Input file
file = "multirun/2025-04-23/12-06-47/0/qmix_balance_mlp__32caa12d_25_04_23-12_06_47/qmix_balance_mlp__32caa12d_25_04_23-12_06_47/scalars/collection_agents_reward_episode_reward_mean.csv"
output_name = "qmix_balance"
plot_type = "within_run_variance"
window_size = 5



print(f"Plotting {plot_type} for {file} with window size {window_size}")

def get_file_name(output_name, plot_type):
    return f"{output_name}_{plot_type}.svg" 

def get_dir(input_file_path):
    # extract name and create a dir with that name if it doesn't exist
    # else return the path of the dir
    dir_path = os.path.dirname("plots/")
    if not os.path.exists(dir_path):
        os.makedirs(dir_path)
    return dir_path

df = pd.read_csv(file, header=None, names=["step", "return"])
stds = df['return'].rolling(window=window_size).std()

# === Compute the mean of the sliding stds (ignoring NaNs at the start) ===
within_run_variance = stds.mean()

# === Plot returns and std ===
sns.set(style="whitegrid")
plt.figure(figsize=(10, 5))
sns.lineplot(x=df['step'], y=stds, label=f"{window_size}-step Std Dev", color="orange")
plt.title("Returns and Within-Run Variance (Sliding Std Dev)")
plt.xlabel("Step")
plt.ylabel("Value")
plt.legend()
plt.tight_layout()

# === Save the plot ===
plot_dir = get_dir(file)
plot_name = get_file_name(output_name, plot_type)
plot_path = os.path.join(plot_dir, plot_name)

plt.savefig(plot_path, dpi=150, bbox_inches='tight')
print(f"Saved: {plot_path}")