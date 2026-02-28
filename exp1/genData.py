import numpy as np
import pandas as pd
from scipy.special import expit

n_participants = 70
trials_per_owner = 112

"""
Success condition
"""
# # Targets aligned strictly to reported marginal means
# rt_targets = {
#     'none': {'self': 509, 'friend': 523},
#     'equal': {'self': 499, 'friend': 499}
# }

# # Targets mapped to exact logit values for binomial generation
# acc_targets = {
#     'none': {'self': 2.09, 'friend': 1.90}, # 89% and 87%
#     'equal': {'self': 1.51, 'friend': 1.99} # 82% and 88%
# }

"""
Failure condition
"""
rt_targets = {
'none': {'self': 509, 'friend': 523},
'equal': {'self': 509, 'friend': 523}
}

acc_targets = {
'none': {'self': 2.09, 'friend': 1.90},
'equal': {'self': 2.09, 'friend': 1.90}
}

data_list = []

part_rt_intercept = np.random.normal(0, 50, n_participants)
part_acc_intercept = np.random.normal(0, 0.6, n_participants)

for p_idx in range(n_participants):
    p_id = p_idx + 1
    expectancy = 'none' if p_idx < 35 else 'equal'
    
    for owner in ['self', 'friend']:
        base_rt = rt_targets[expectancy][owner] + part_rt_intercept[p_idx]
        rt_noise = np.random.normal(0, 110, trials_per_owner)
        rts = base_rt + rt_noise
        rts = np.clip(rts, 205.0, 1500.0)
        
        base_logit = acc_targets[expectancy][owner] + part_acc_intercept[p_idx]
        probabilities = expit(base_logit)
        accuracy = np.random.binomial(1, probabilities, trials_per_owner)
        
        for i in range(trials_per_owner):
            data_list.append({
                'participant': f"P{p_id}",
                'expectancy': expectancy,
                'owner': owner,
                'rt': rts[i],
                'accuracy': accuracy[i]
            })

df = pd.DataFrame(data_list)
df.to_csv('falben_exp1_simulated_f.csv', index=False)