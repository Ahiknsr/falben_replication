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
> print(summary(rt_model))
Linear mixed model fit by REML. t-tests use Satterthwaite's method ['lmerModLmerTest']
Formula: rt ~ expectancy * owner + (1 | participant)
   Data: df_correct

REML criterion at convergence: 148420.6

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-4.0288 -0.6809  0.0046  0.6722  4.2981 

Random effects:
 Groups      Name        Variance Std.Dev.
 participant (Intercept)    6.531  2.556  
 Residual                7144.500 84.525  
Number of obs: 12673, groups:  participant, 36

Fixed effects:
                              Estimate Std. Error        df t value Pr(>|t|)    
(Intercept)                    487.753      2.037  1030.479  239.41   <2e-16 ***
expectancyfriend                88.867      2.352 12642.948   37.78   <2e-16 ***
ownerfriend                     37.554      2.356 12640.468   15.94   <2e-16 ***
expectancyfriend:ownerfriend  -121.599      3.333 12644.427  -36.48   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Correlation of Fixed Effects:
            (Intr) expctn ownrfr
expctncyfrn -0.828              
ownerfriend -0.827  0.716       
expctncyfr:  0.585 -0.706 -0.707
> 
> acc_model <- glmer(accuracy ~ expectancy * owner + (1 | participant), data = df, family = binomial)
> print(summary(acc_model))
Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
 Family: binomial  ( logit )
Formula: accuracy ~ expectancy * owner + (1 | participant)
   Data: df

      AIC       BIC    logLik -2*log(L)  df.resid 
  16376.6   16415.0   -8183.3   16366.6     16123 

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-2.9874  0.3434  0.5604  0.5772  0.6035 

Random effects:
 Groups      Name        Variance Std.Dev.
 participant (Intercept) 0.004167 0.06455 
Number of obs: 16128, groups:  participant, 36

Fixed effects:
                             Estimate Std. Error z value Pr(>|z|)    
(Intercept)                   2.12190    0.07285   29.13   <2e-16 ***
expectancyfriend             -0.99201    0.07801  -12.72   <2e-16 ***
ownerfriend                  -1.04157    0.07787  -13.38   <2e-16 ***
expectancyfriend:ownerfriend  1.97776    0.10925   18.10   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Correlation of Fixed Effects:
            (Intr) expctn ownrfr
expctncyfrn -0.913              
ownerfriend -0.915  0.854       
expctncyfr:  0.653 -0.714 -0.713
```