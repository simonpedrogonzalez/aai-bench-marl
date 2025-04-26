from benchmarl.eval_results import get_raw_dict_from_multirun_folder, Plotting, _has_marl_eval
import matplotlib.pyplot as plt
import os

# === CONFIGURATION ===
# balance
# multirun_folder = "analysis/balance/content/BenchMARL/multirun/2025-04-14/02-57-14"
# multirun_folder = "multirun/2025-04-23/08-51-33"
multirun_folder = "multirun/2025-04-23/balance/visfolder"
plot_save_dir = "benchmark_plots_balance_3nd_test"  
# footbal, it xsays mappo buts all
# multirun_folder = "analysis/football/mappo/01-16-47"
# tag
# multirun_folder = "analysis/simple_tag/mappo/01-28-18"

# env_name = "pettingzoo"
# tasks = ["simple_tag"] 
# plot_save_dir = "benchmark_plots_simple_tag"  

env_name = "vmas"
tasks = ["balance"] 



os.makedirs(plot_save_dir, exist_ok=True)

raw_dict = get_raw_dict_from_multirun_folder(multirun_folder)
print(raw_dict)


processed_data = Plotting.process_data(raw_dict)
env_matrix, sample_eff_matrix = Plotting.create_matrices(processed_data, env_name=env_name)

def save_plot(name):
    path = os.path.join(plot_save_dir, f"{name}.png")
    plt.savefig(path, dpi=150, bbox_inches='tight')
    print(f"Saved: {path}")
    plt.close()


# 1. Sample Efficiency (all tasks)
Plotting.environemnt_sample_efficiency_curves(sample_effeciency_matrix=sample_eff_matrix)
save_plot("sample_efficiency_all_tasks")

# 2. Performance Profile
Plotting.performance_profile_figure(environment_comparison_matrix=env_matrix)
save_plot("performance_profile")

# 3. Aggregate Scores
Plotting.aggregate_scores(environment_comparison_matrix=env_matrix)
save_plot("aggregate_scores")

# 4. Task-specific sample efficiency
for task in tasks:
    Plotting.task_sample_efficiency_curves(
        processed_data=processed_data,
        env=env_name,
        task=task
    )
    save_plot(f"sample_efficiency_{task}")

# 5. Probability of improvement
Plotting.probability_of_improvement(
    environment_comparison_matrix=env_matrix,
    algorithms_to_compare=[["mappo", "qmix"], ["mappo", "masac"]]
)
save_plot("probability_of_improvement")