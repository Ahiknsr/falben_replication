import hddm
import pandas as pd
import numpy as np
from joblib import Parallel, delayed
import kabuki

def execute_chain(chain_id, model_data):
    model = hddm.HDDM(
        model_data,
        depends_on={
            'v': ['expectancy', 'owner'],
            'a': ['expectancy'],
            'z': ['expectancy']
        },
        include=['v', 'a', 't', 'z', 'sv', 'st', 'sz'],
        p_outlier=0.05
    )
    model.find_starting_values()
    model.sample(2500, burn=250, db='pickle', dbname=f'exp2_chain_{chain_id}.db')
    return model

if __name__ == '__main__':
    data = pd.read_csv('falben_exp2_simulated.csv')
    data.columns = [c.strip() for c in data.columns]
    data['rt'] = data['rt'].astype(float) / 1000.0
    
    data['response'] = np.where(
        ((data['owner'] == 'self') & (data['accuracy'] == 1)) | 
        ((data['owner'] == 'friend') & (data['accuracy'] == 0)), 
        1, 0
    )
    data['subj_idx'] = data['participant'].astype('category').cat.codes

    models = Parallel(n_jobs=4)(
        delayed(execute_chain)(i, data) for i in range(4)
    )
    
    combined_model = kabuki.utils.concat_models(models)
    stats = combined_model.gen_stats()
    
    print(stats.filter(regex='^z|^v|^a', axis=0))
    
    z_self_trace = combined_model.nodes_db.node['z(self)'].trace()
    z_friend_trace = combined_model.nodes_db.node['z(friend)'].trace()
    z_equal_trace = combined_model.nodes_db.node['z(equal)'].trace()
    
    p_z_self_biased = (z_self_trace > 0.5).mean()
    p_z_friend_biased = (z_friend_trace < 0.5).mean()
    p_z_equal_biased = (z_equal_trace > 0.5).mean()
    
    print(f"P(z_self > 0.5): {p_z_self_biased:.4f}")
    print(f"P(z_friend < 0.5): {p_z_friend_biased:.4f}")
    print(f"P(z_equal > 0.5): {p_z_equal_biased:.4f}")