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
    model.sample(2500, burn=250, db='pickle', dbname=f'chain_{chain_id}.db')
    return model

if __name__ == '__main__':
    data = pd.read_csv('falben_exp1_simulated.csv')
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

    filtered_stats = stats.filter(regex='^z|^v|^a', axis=0)
    filtered_stats.to_csv('exp1_hddm_results.csv')
"""
                      mean       std      2.5q       25q       50q       75q     97.5q    mc err
a(equal)          0.699128  0.015718  0.668183  0.688807  0.698983  0.709594  0.730254  0.000506
a(none)           0.737386  0.015884  0.705848  0.726807  0.737131  0.748294  0.768408  0.000503
a_std             0.068454  0.009895  0.050664  0.061556  0.067906  0.074807  0.088994  0.000281
a_subj(equal).29   0.64005  0.037954  0.564194  0.614808  0.640492  0.665743  0.713406  0.000846
a_subj(equal).30  0.658812  0.033339  0.592184  0.636567  0.658487  0.681153   0.72589  0.000698
...                    ...       ...       ...       ...       ...       ...       ...       ...
z_subj(none).44   0.502352  0.012666  0.478452  0.493831  0.501996  0.511029  0.526655  0.000861
z_subj(none).55   0.506391  0.012838  0.483183  0.497174  0.505651  0.514976  0.533419  0.000936
z_subj(none).66   0.504188  0.012513  0.481053  0.495622  0.503578  0.512284  0.530989  0.000885
z_subj(none).68    0.50428  0.012762  0.479975  0.495497  0.503782  0.512858  0.529577  0.000878
z_subj(none).69   0.505275  0.012375  0.482985  0.496492  0.504536  0.513397  0.531572   0.00088
"""