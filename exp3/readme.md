## Successful replication 
![](exp3_results.png?raw=true)
```
> rt_model <- lmer(rt ~ expectancy * owner + (1 | participant), data = df_correct)
> print(summary(rt_model))
Linear mixed model fit by REML. t-tests use Satterthwaite's method ['lmerModLmerTest']
Formula: rt ~ expectancy * owner + (1 | participant)
   Data: df_correct

REML criterion at convergence: 163078.3

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-3.6330 -0.6739  0.0100  0.6716  4.1262 

Random effects:
 Groups      Name        Variance Std.Dev.
 participant (Intercept)    2.147  1.465  
 Residual                7144.584 84.526  
Number of obs: 13925, groups:  participant, 36

Fixed effects:
                              Estimate Std. Error        df t value Pr(>|t|)    
(Intercept)                    523.042      2.181  2114.724  239.81   <2e-16 ***
expectancyfriend               -29.225      2.453 13900.606  -11.91   <2e-16 ***
ownerfriend                    -38.369      2.450 13899.566  -15.66   <2e-16 ***
expectancyfriend:ownerfriend   123.466      3.469 13896.812   35.59   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Correlation of Fixed Effects:
            (Intr) expctn ownrfr
expctncyfrn -0.878              
ownerfriend -0.879  0.782       
expctncyfr:  0.621 -0.707 -0.706
> 
> acc_model <- glmer(accuracy ~ expectancy * owner + (1 | participant), data = df, family = binomial)
> print(summary(acc_model))
Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
 Family: binomial  ( logit )
Formula: accuracy ~ expectancy * owner + (1 | participant)
   Data: df

      AIC       BIC    logLik -2*log(L)  df.resid 
  12372.8   12411.2   -6181.4   12362.8     16123 

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-3.1956  0.3236  0.3352  0.3439  0.5842 

Random effects:
 Groups      Name        Variance Std.Dev.
 participant (Intercept) 0.003797 0.06162 
Number of obs: 16128, groups:  participant, 36

Fixed effects:
                             Estimate Std. Error z value Pr(>|z|)    
(Intercept)                   1.12354    0.05276   21.30   <2e-16 ***
expectancyfriend              1.03328    0.06672   15.49   <2e-16 ***
ownerfriend                   1.11973    0.06766   16.55   <2e-16 ***
expectancyfriend:ownerfriend -2.16370    0.09494  -22.79   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Correlation of Fixed Effects:
            (Intr) expctn ownrfr
expctncyfrn -0.760              
ownerfriend -0.749  0.592       
expctncyfr:  0.533 -0.702 -0.712
```

## Replication Failure
![](exp3_results_f.png?raw=true)
```
> rt_model <- lmer(rt ~ expectancy * owner + (1 | participant), data = df_correct)
boundary (singular) fit: see help('isSingular')
> print(summary(rt_model))
Linear mixed model fit by REML. t-tests use Satterthwaite's method ['lmerModLmerTest']
Formula: rt ~ expectancy * owner + (1 | participant)
   Data: df_correct

REML criterion at convergence: 154463.2

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-3.4268 -0.6763  0.0026  0.6648  4.5482 

Random effects:
 Groups      Name        Variance Std.Dev.
 participant (Intercept)    0      0.0    
 Residual                7310     85.5    
Number of obs: 13164, groups:  participant, 36

Fixed effects:
                              Estimate Std. Error        df t value Pr(>|t|)    
(Intercept)                    492.989      2.006 13160.000 245.714  < 2e-16 ***
expectancyfriend                10.550      2.337 13160.000   4.514 6.42e-06 ***
ownerfriend                     31.347      2.365 13160.000  13.252  < 2e-16 ***
expectancyfriend:ownerfriend   -18.746      3.405 13160.000  -5.506 3.74e-08 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Correlation of Fixed Effects:
            (Intr) expctn ownrfr
expctncyfrn -0.858              
ownerfriend -0.848  0.728       
expctncyfr:  0.589 -0.686 -0.695
optimizer (nloptwrap) convergence code: 0 (OK)
boundary (singular) fit: see help('isSingular')

> 
> acc_model <- glmer(accuracy ~ expectancy * owner + (1 | participant), data = df, family = binomial)
> print(summary(acc_model))
Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
 Family: binomial  ( logit )
Formula: accuracy ~ expectancy * owner + (1 | participant)
   Data: df

      AIC       BIC    logLik -2*log(L)  df.resid 
  15173.5   15212.0   -7581.8   15163.5     16123 

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-3.0717  0.3326  0.4358  0.5414  0.5564 

Random effects:
 Groups      Name        Variance Std.Dev.
 participant (Intercept) 0.002228 0.0472  
Number of obs: 16128, groups:  participant, 36

Fixed effects:
                             Estimate Std. Error z value Pr(>|z|)    
(Intercept)                   2.20696    0.07495  29.445  < 2e-16 ***
expectancyfriend             -0.53850    0.08242  -6.534 6.41e-11 ***
ownerfriend                  -0.99801    0.08054 -12.391  < 2e-16 ***
expectancyfriend:ownerfriend  0.68639    0.10378   6.614 3.74e-11 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Correlation of Fixed Effects:
            (Intr) expctn ownrfr
expctncyfrn -0.899              
ownerfriend -0.920  0.837       
expctncyfr:  0.714 -0.794 -0.776
```