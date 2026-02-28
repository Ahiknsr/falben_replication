## Successful replication 
![](exp1_results.png?raw=true)
```
> rt_model <- lmer(rt_sec ~ expectancy * owner + (1 | participant), data = rt_data)
> summary(rt_model)
Linear mixed model fit by REML. t-tests use Satterthwaite's method ['lmerModLmerTest']
Formula: rt_sec ~ expectancy * owner + (1 | participant)
   Data: rt_data

REML criterion at convergence: -20668.2

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-3.2325 -0.6871  0.0040  0.6779  3.8709 

Random effects:
 Groups      Name        Variance Std.Dev.
 participant (Intercept) 0.002409 0.04908 
 Residual                0.012105 0.11002 
Number of obs: 13298, groups:  participant, 70

Fixed effects:
                     Estimate Std. Error         df t value Pr(>|t|)    
(Intercept)         5.034e-01  5.945e-03  6.799e+01  84.678  < 2e-16 ***
expectancy1         1.257e-02  5.945e-03  6.799e+01   2.114   0.0381 *  
owner1             -1.694e-03  9.556e-04  1.323e+04  -1.773   0.0763 .  
expectancy1:owner1 -4.499e-03  9.556e-04  1.323e+04  -4.709 2.52e-06 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Correlation of Fixed Effects:
            (Intr) expct1 owner1
expectancy1 -0.001              
owner1       0.002 -0.005       
expctncy1:1 -0.005  0.002 -0.032
> 
> acc_model <- glmer(accuracy ~ expectancy * owner + (1 | participant), 
+                    data = clean_data, family = binomial)
> summary(acc_model)
Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
 Family: binomial  ( logit )
Formula: accuracy ~ expectancy * owner + (1 | participant)
   Data: clean_data

      AIC       BIC    logLik -2*log(L)  df.resid 
  12645.6   12683.9   -6317.8   12635.6     15675 

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-5.7728  0.2769  0.3525  0.4368  1.0172 

Random effects:
 Groups      Name        Variance Std.Dev.
 participant (Intercept) 0.3862   0.6214  
Number of obs: 15680, groups:  participant, 70

Fixed effects:
                   Estimate Std. Error z value Pr(>|z|)    
(Intercept)         1.87352    0.07851  23.864  < 2e-16 ***
expectancy1         0.19967    0.07836   2.548  0.01084 *  
owner1             -0.06319    0.02322  -2.721  0.00652 ** 
expectancy1:owner1  0.18528    0.02323   7.977  1.5e-15 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Correlation of Fixed Effects:
            (Intr) expct1 owner1
expectancy1  0.014              
owner1      -0.006  0.035       
expctncy1:1  0.036 -0.005  0.117

```

## Replication Failure
![](exp1_results_f.png?raw=true)
```
> rt_model <- lmer(rt_sec ~ expectancy * owner + (1 | participant), data = rt_data)
> summary(rt_model)
Linear mixed model fit by REML. t-tests use Satterthwaite's method ['lmerModLmerTest']
Formula: rt_sec ~ expectancy * owner + (1 | participant)
   Data: rt_data

REML criterion at convergence: -21187.9

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-3.1953 -0.6739  0.0146  0.6731  3.8111 

Random effects:
 Groups      Name        Variance Std.Dev.
 participant (Intercept) 0.002161 0.04648 
 Residual                0.011919 0.10918 
Number of obs: 13492, groups:  participant, 70

Fixed effects:
                     Estimate Std. Error         df t value Pr(>|t|)    
(Intercept)         5.153e-01  5.635e-03  6.806e+01  91.439   <2e-16 ***
expectancy1         5.475e-03  5.635e-03  6.806e+01   0.972    0.335    
owner1             -8.410e-03  9.404e-04  1.342e+04  -8.944   <2e-16 ***
expectancy1:owner1 -1.195e-04  9.404e-04  1.342e+04  -0.127    0.899    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Correlation of Fixed Effects:
            (Intr) expct1 owner1
expectancy1  0.000              
owner1      -0.002 -0.001       
expctncy1:1 -0.001 -0.002 -0.001
> 
> acc_model <- glmer(accuracy ~ expectancy * owner + (1 | participant), 
+                    data = clean_data, family = binomial)
> summary(acc_model)
Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
 Family: binomial  ( logit )
Formula: accuracy ~ expectancy * owner + (1 | participant)
   Data: clean_data

      AIC       BIC    logLik -2*log(L)  df.resid 
  12212.2   12250.5   -6101.1   12202.2     15675 

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-5.5332  0.2701  0.3428  0.4297  0.7076 

Random effects:
 Groups      Name        Variance Std.Dev.
 participant (Intercept) 0.3629   0.6024  
Number of obs: 15680, groups:  participant, 70

Fixed effects:
                   Estimate Std. Error z value Pr(>|z|)    
(Intercept)         1.94696    0.07651  25.445  < 2e-16 ***
expectancy1         0.03083    0.07633   0.404 0.686248    
owner1              0.08262    0.02350   3.516 0.000438 ***
expectancy1:owner1  0.04213    0.02350   1.793 0.072968 .  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Correlation of Fixed Effects:
            (Intr) expct1 owner1
expectancy1 0.006               
owner1      0.019  0.010        
expctncy1:1 0.010  0.018  0.016 
```


## Issue with replicating original data

```
The statistical discrepancies in the paper stem from a conflict between the reported cell means (specific condition averages) and the regression coefficients ($b$ values).
The $b$ Coefficient Mismatch: The paper reports a simple effect for the "None" condition as $b = -0.008$. In a multilevel model using seconds, this represents an 8ms difference (if dummy coded) or a 16ms difference (if effect coded). However, the descriptive statistics for that same condition (509ms vs. 523ms) show a 14ms difference.
Interaction Inconsistency: The authors report a main effect of Owner ($b = -0.004$) and an interaction ($b = 0.004$), yet also claim a null effect in the "Equal" condition. Mathematically, if an interaction exists and one simple effect is null, the main effect cannot be equal in magnitude to the interaction under standard contrast coding.
Variance and Significance: The reported $t$-values (e.g., $t = -3.25$) are unusually high relative to the reported standard deviations (roughly 100ms) and sample size ($N=72$). To achieve those $t$-statistics with that much "noise" (SD), the actual difference between groups would need to be much larger than the 4-8ms indicated by the $b$ coefficients.
In short, the descriptive data shows a large effect with high noise, while the regression models report a tiny effect with high significance. These two sets of numbers cannot be derived from the same raw dataset.
```