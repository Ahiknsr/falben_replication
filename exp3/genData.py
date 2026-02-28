import pandas as pd
import numpy as np

def generate_experiment_3_data(n_participants=36):
    records = []
    
    """
    Success condition
    """
    # rt_means = {
    #     'self': {'self': 525, 'friend': 485},
    #     'friend': {'self': 493, 'friend': 577}
    # }
    
    # acc_probs = {
    #     'self': {'self': 0.75, 'friend': 0.90},
    #     'friend': {'self': 0.90, 'friend': 0.75}
    # }
    """
    Failure condition
    """
    rt_means = {
        'self': {'self': 485, 'friend': 525},
        'friend': {'self': 577, 'friend': 493}
    }

    acc_probs = {
        'self': {'self': 0.90, 'friend': 0.75},
        'friend': {'self': 0.75, 'friend': 0.90}
    }
    for subj in range(1, n_participants + 1):
        participant_id = f'P{subj}'
        
        blocks = [
            ('self', 56, 168),
            ('friend', 168, 56)
        ]
        
        for expected_owner, self_trials, friend_trials in blocks:
            for true_owner, n_trials in [('self', self_trials), ('friend', friend_trials)]:
                
                mean_rt = rt_means[expected_owner][true_owner]
                prob_acc = acc_probs[expected_owner][true_owner]
                
                rts = np.random.normal(loc=mean_rt, scale=85, size=n_trials)
                accs = np.random.binomial(n=1, p=prob_acc, size=n_trials)
                
                rts = np.clip(rts, 200, 1500)
                
                for rt, acc in zip(rts, accs):
                    records.append({
                        'participant': participant_id,
                        'expectancy': expected_owner,
                        'owner': true_owner,
                        'rt': rt,
                        'accuracy': acc
                    })
                    
    return pd.DataFrame(records)

df = generate_experiment_3_data()
df.to_csv('falben_exp3_simulated_f.csv', index=False)