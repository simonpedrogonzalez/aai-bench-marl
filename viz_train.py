# from benchmarl.eval_results import get_raw_dict_from_multirun_folder, Plotting, _has_marl_eval
import matplotlib.pyplot as plt
import os

# === CONFIGURATION ===
# balance

multirun_folder = "multirun/2025-04-23/balance/visfolder"
plot_save_dir = "benchmark_plots_balance_3nd_test"
plot_name = "train_plot"

# multirun_folder = "analysis/balance/content/BenchMARL/multirun/2025-04-14/02-57-14"
# footbal, it xsays mappo buts all
# multirun_folder = "analysis/football/mappo/01-16-47"

# tag
# multirun_folder = "analysis/simple_tag/mappo/01-28-18"

# env_name = "pettingzoo"
# tasks = ["simple_tag"] 
# plot_save_dir = "benchmark_plots_simple_tag"  

# qmix_f = "analysis/football/mappo/01-16-47/4/qmix_football_mlp__0a2a72b4_25_04_13-22_00_23/qmix_football_mlp__0a2a72b4_25_04_13-22_00_23/scalars/collection_agent_red_reward_episode_reward_mean.csv"

import seaborn as sns
import pandas as pd
# find all folders inside multirun_folder that are named 0, 1, 2 ...

folders = [f for f in os.listdir(multirun_folder) if os.path.isdir(os.path.join(multirun_folder, f)) and f.isdigit()]
print(f"Found folders: {folders}")

df = pd.DataFrame()

for f in folders:
    # findo folder startin with either qmix masac or mappo in the name
    subfolders = [sf for sf in os.listdir(os.path.join(multirun_folder, f)) if os.path.isdir(os.path.join(multirun_folder, f, sf)) and (sf.startswith("qmix") or sf.startswith("masac") or sf.startswith("mappo"))]
    print(f"Found subfolders: {subfolders}")
    matching_word = None
    for sf in subfolders:
        if "qmix" in sf:
            matching_word = "qmix"
        elif "masac" in sf:
            matching_word = "masac"
        elif "mappo" in sf:
            matching_word = "mappo"
        else:
            continue
        break
    print("Matching word:", matching_word)
    # enter that folder and inside, find another folder that starts with matching word
    subsubfolders = [ssf for ssf in os.listdir(os.path.join(multirun_folder, f, sf)) if os.path.isdir(os.path.join(multirun_folder, f, sf, ssf)) and ssf.startswith(matching_word)]
    ssf = subsubfolders[0]
    # the file to be read is ssf/scalars/collection_agents_reward_episode_reward_mean.csv
    file = os.path.join(multirun_folder, f, sf, ssf, "scalars", "collection_agents_reward_episode_reward_mean.csv")
    df_f = pd.read_csv(file, header=None)
    df_f.columns = ["step", "return"]
    df_f["algorithm"] = matching_word
    # append
    df = pd.concat([df, df_f], axis=0)

# === PLOTTING ===
os.makedirs(plot_save_dir, exist_ok=True)
# save the plot in the plot_save_dir

fig, ax = plt.subplots(figsize=(10, 5))
sns.set(style="whitegrid")
sns.lineplot(data=df, x="step", y="return", hue="algorithm", ax=ax)
plt.title("Training Plot")
plt.xlabel("Step")
plt.ylabel("Return")
plt.legend(title="Algorithm")
plt.tight_layout()
plot_path = os.path.join(plot_save_dir, f"{plot_name}.svg")
plt.savefig(plot_path)
print(f"Saved: {plot_path}")
