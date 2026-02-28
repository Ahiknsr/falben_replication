import pandas as pd
import numpy as np


def generate_experiment_2_data(n_participants=72):
    records = []

    """
    Success condition
    """
    # rt_means = {
    #     'self': {'self': 455, 'friend': 483},
    #     'friend': {'self': 485, 'friend': 451},
    #     'equal': {'self': 470, 'friend': 470}
    # }

    # acc_probs = {
    #     'self': {'self': 0.88, 'friend': 0.76},
    #     'friend': {'self': 0.76, 'friend': 0.90},
    #     'equal': {'self': 0.82, 'friend': 0.84}
    # }

    """
    Failure condition
    """
    rt_means = {
        "self": {"self": 455, "friend": 483},
        "friend": {"self": 455, "friend": 483},
        "equal": {"self": 455, "friend": 483},
    }

    acc_probs = {
        "self": {"self": 0.88, "friend": 0.76},
        "friend": {"self": 0.88, "friend": 0.76},
        "equal": {"self": 0.88, "friend": 0.76},
    }

    for subj in range(1, n_participants + 1):
        participant_id = f"P{subj}"

        blocks = [("self", 168, 56), ("friend", 56, 168), ("equal", 112, 112)]

        for expected_owner, self_trials, friend_trials in blocks:
            for true_owner, n_trials in [
                ("self", self_trials),
                ("friend", friend_trials),
            ]:

                mean_rt = rt_means[expected_owner][true_owner]
                prob_acc = acc_probs[expected_owner][true_owner]

                rts = np.random.normal(loc=mean_rt, scale=75, size=n_trials)
                accs = np.random.binomial(n=1, p=prob_acc, size=n_trials)

                rts = np.clip(rts, 150, 1500)

                for rt, acc in zip(rts, accs):
                    records.append(
                        {
                            "participant": participant_id,
                            "expectancy": expected_owner,
                            "owner": true_owner,
                            "rt": rt,
                            "accuracy": acc,
                        }
                    )

    return pd.DataFrame(records)


df = generate_experiment_2_data()
df.to_csv("falben_exp2_simulated_f.csv", index=False)
