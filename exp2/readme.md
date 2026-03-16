## Successful replication 
![](exp2_results.png?raw=true)
```
> rt_model <- lmer(rt ~ expectancy * owner + (1 | participant), data = rt_data)
boundary (singular) fit: see help('isSingular')
> print(summary(rt_model))
Linear mixed model fit by REML. t-tests use Satterthwaite's method ['lmerModLmerTest']
Formula: rt ~ expectancy * owner + (1 | participant)
   Data: rt_data

REML criterion at convergence: 471094.4

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-4.2477 -0.6732  0.0033  0.6793  4.2527 

Random effects:
 Groups      Name        Variance Std.Dev.
 participant (Intercept)    0      0.00   
 Residual                5657     75.21   
Number of obs: 41043, groups:  participant, 72

Fixed effects:
                                     Estimate Std. Error         df t value Pr(>|t|)    
(Intercept)                          456.5715     0.7309 41037.0000  624.65   <2e-16 ***
expectancyFriend                      28.8557     1.5289 41037.0000   18.87   <2e-16 ***
expectancyEqual                       12.9003     1.1795 41037.0000   10.94   <2e-16 ***
ownerFriend-Owned                     27.0993     1.5407 41037.0000   17.59   <2e-16 ***
expectancyFriend:ownerFriend-Owned   -60.7343     2.1672 41037.0000  -28.02   <2e-16 ***
expectancyEqual:ownerFriend-Owned    -25.9693     2.0170 41037.0000  -12.88   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Correlation of Fixed Effects:
            (Intr) expctF expctE ownF-O eF:F-O
expctncyFrn -0.478                            
expctncyEql -0.620  0.296                     
ownrFrnd-Ow -0.474  0.227  0.294              
expctnF:F-O  0.337 -0.705 -0.209 -0.711       
expctnE:F-O  0.362 -0.173 -0.585 -0.764  0.543
optimizer (nloptwrap) convergence code: 0 (OK)
boundary (singular) fit: see help('isSingular')

> 
> rt_simple_effects <- emmeans(rt_model, pairwise ~ owner | expectancy)
Note: D.f. calculations have been disabled because the number of observations exceeds 3000.
To enable adjustments, add the argument 'pbkrtest.limit = 41043' (or larger)
[or, globally, 'set emm_options(pbkrtest.limit = 41043)' or larger];
but be warned that this may result in large computation time and memory use.
Note: D.f. calculations have been disabled because the number of observations exceeds 3000.
To enable adjustments, add the argument 'lmerTest.limit = 41043' (or larger)
[or, globally, 'set emm_options(lmerTest.limit = 41043)' or larger];
but be warned that this may result in large computation time and memory use.
> print(rt_simple_effects)
$emmeans
expectancy = Self:
 owner        emmean    SE  df asymp.LCL asymp.UCL
 Self-Owned    456.6 0.731 Inf     455.1     458.0
 Friend-Owned  483.7 1.360 Inf     481.0     486.3

expectancy = Friend:
 owner        emmean    SE  df asymp.LCL asymp.UCL
 Self-Owned    485.4 1.340 Inf     482.8     488.1
 Friend-Owned  451.8 0.721 Inf     450.4     453.2

expectancy = Equal:
 owner        emmean    SE  df asymp.LCL asymp.UCL
 Self-Owned    469.5 0.926 Inf     467.7     471.3
 Friend-Owned  470.6 0.915 Inf     468.8     472.4

Degrees-of-freedom method: asymptotic 
Confidence level used: 0.95 

$contrasts
expectancy = Self:
 contrast                      estimate   SE  df z.ratio p.value
 (Self-Owned) - (Friend-Owned)   -27.10 1.54 Inf -17.589  <.0001

expectancy = Friend:
 contrast                      estimate   SE  df z.ratio p.value
 (Self-Owned) - (Friend-Owned)    33.64 1.52 Inf  22.069  <.0001

expectancy = Equal:
 contrast                      estimate   SE  df z.ratio p.value
 (Self-Owned) - (Friend-Owned)    -1.13 1.30 Inf  -0.868  0.3854

Degrees-of-freedom method: asymptotic 

> 
> acc_model <- glmer(accuracy ~ expectancy * owner + (1 | participant), data = df, family = binomial)
> print(summary(acc_model))
Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
 Family: binomial  ( logit )
Formula: accuracy ~ expectancy * owner + (1 | participant)
   Data: df

      AIC       BIC    logLik -2*log(L)  df.resid 
  40453.1   40514.6  -20219.5   40439.1     48377 

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-3.0229  0.3331  0.3775  0.4692  0.5617 

Random effects:
 Groups      Name        Variance  Std.Dev.
 participant (Intercept) 0.0006083 0.02466 
Number of obs: 48384, groups:  participant, 72

Fixed effects:
                                   Estimate Std. Error z value Pr(>|z|)    
(Intercept)                         1.94917    0.02765   70.48   <2e-16 ***
expectancyFriend                   -0.69480    0.04678  -14.85   <2e-16 ***
expectancyEqual                    -0.44308    0.03985  -11.12   <2e-16 ***
ownerFriend-Owned                  -0.78175    0.04604  -16.98   <2e-16 ***
expectancyFriend:ownerFriend-Owned  1.72540    0.06684   25.82   <2e-16 ***
expectancyEqual:ownerFriend-Owned   0.91780    0.06212   14.78   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Correlation of Fixed Effects:
            (Intr) expctF expctE ownF-O eF:F-O
expctncyFrn -0.584                            
expctncyEql -0.685  0.405                     
ownrFrnd-Ow -0.592  0.349  0.410              
expctnF:F-O  0.408 -0.699 -0.282 -0.688       
expctnE:F-O  0.438 -0.259 -0.640 -0.740  0.509
> 
> acc_simple_effects <- emmeans(acc_model, pairwise ~ owner | expectancy)
> print(acc_simple_effects)
$emmeans
expectancy = Self:
 owner        emmean     SE  df asymp.LCL asymp.UCL
 Self-Owned     1.95 0.0277 Inf      1.89      2.00
 Friend-Owned   1.17 0.0371 Inf      1.09      1.24

expectancy = Friend:
 owner        emmean     SE  df asymp.LCL asymp.UCL
 Self-Owned     1.25 0.0380 Inf      1.18      1.33
 Friend-Owned   2.20 0.0305 Inf      2.14      2.26

expectancy = Equal:
 owner        emmean     SE  df asymp.LCL asymp.UCL
 Self-Owned     1.51 0.0290 Inf      1.45      1.56
 Friend-Owned   1.64 0.0303 Inf      1.58      1.70

Results are given on the logit (not the response) scale. 
Confidence level used: 0.95 

$contrasts
expectancy = Self:
 contrast                      estimate     SE  df z.ratio p.value
 (Self-Owned) - (Friend-Owned)    0.782 0.0460 Inf  16.981  <.0001

expectancy = Friend:
 contrast                      estimate     SE  df z.ratio p.value
 (Self-Owned) - (Friend-Owned)   -0.944 0.0485 Inf -19.456  <.0001

expectancy = Equal:
 contrast                      estimate     SE  df z.ratio p.value
 (Self-Owned) - (Friend-Owned)   -0.136 0.0418 Inf  -3.257  0.0011

Results are given on the log odds ratio (not the response) scale. 
```

## Replication Failure
![](exp2_results_f.png?raw=true)

```
> print(summary(rt_model))
Linear mixed model fit by REML. t-tests use Satterthwaite's method ['lmerModLmerTest']
Formula: rt ~ expectancy * owner + (1 | participant)
   Data: rt_data

REML criterion at convergence: 458196.7

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-4.2371 -0.6751 -0.0001  0.6748  4.2456 

Random effects:
 Groups      Name        Variance Std.Dev.
 participant (Intercept)    0      0.00   
 Residual                5657     75.22   
Number of obs: 39919, groups:  participant, 72

Fixed effects:
                                     Estimate Std. Error         df t value Pr(>|t|)    
(Intercept)                          453.9167     0.7298 39913.0000 621.948  < 2e-16 ***
expectancyFriend                       8.5423     1.4717 39913.0000   5.805 6.50e-09 ***
expectancyEqual                        4.0182     1.1734 39913.0000   3.425 0.000616 ***
ownerFriend-Owned                     29.1504     1.5463 39913.0000  18.851  < 2e-16 ***
expectancyFriend:ownerFriend-Owned   -14.8419     2.1481 39913.0000  -6.909 4.94e-12 ***
expectancyEqual:ownerFriend-Owned    -11.0521     2.0264 39913.0000  -5.454 4.95e-08 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Correlation of Fixed Effects:
            (Intr) expctF expctE ownF-O eF:F-O
expctncyFrn -0.496                            
expctncyEql -0.622  0.308                     
ownrFrnd-Ow -0.472  0.234  0.294              
expctnF:F-O  0.340 -0.685 -0.211 -0.720       
expctnE:F-O  0.360 -0.179 -0.579 -0.763  0.549
optimizer (nloptwrap) convergence code: 0 (OK)
boundary (singular) fit: see help('isSingular')

> 
> rt_simple_effects <- emmeans(rt_model, pairwise ~ owner | expectancy)
Note: D.f. calculations have been disabled because the number of observations exceeds 3000.
To enable adjustments, add the argument 'pbkrtest.limit = 39919' (or larger)
[or, globally, 'set emm_options(pbkrtest.limit = 39919)' or larger];
but be warned that this may result in large computation time and memory use.
Note: D.f. calculations have been disabled because the number of observations exceeds 3000.
To enable adjustments, add the argument 'lmerTest.limit = 39919' (or larger)
[or, globally, 'set emm_options(lmerTest.limit = 39919)' or larger];
but be warned that this may result in large computation time and memory use.
> print(rt_simple_effects)
$emmeans
expectancy = Self:
 owner        emmean    SE  df asymp.LCL asymp.UCL
 Self-Owned    453.9 0.730 Inf     452.5     455.3
 Friend-Owned  483.1 1.360 Inf     480.4     485.7

expectancy = Friend:
 owner        emmean    SE  df asymp.LCL asymp.UCL
 Self-Owned    462.5 1.280 Inf     460.0     465.0
 Friend-Owned  476.8 0.768 Inf     475.3     478.3

expectancy = Equal:
 owner        emmean    SE  df asymp.LCL asymp.UCL
 Self-Owned    457.9 0.919 Inf     456.1     459.7
 Friend-Owned  476.0 0.933 Inf     474.2     477.9

Degrees-of-freedom method: asymptotic 
Confidence level used: 0.95 

$contrasts
expectancy = Self:
 contrast                      estimate   SE  df z.ratio p.value
 (Self-Owned) - (Friend-Owned)    -29.2 1.55 Inf -18.851  <.0001

expectancy = Friend:
 contrast                      estimate   SE  df z.ratio p.value
 (Self-Owned) - (Friend-Owned)    -14.3 1.49 Inf  -9.597  <.0001

expectancy = Equal:
 contrast                      estimate   SE  df z.ratio p.value
 (Self-Owned) - (Friend-Owned)    -18.1 1.31 Inf -13.820  <.0001

Degrees-of-freedom method: asymptotic 

> 
> acc_model <- glmer(accuracy ~ expectancy * owner + (1 | participant), data = df, family = binomial)
boundary (singular) fit: see help('isSingular')
> print(summary(acc_model))
Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
 Family: binomial  ( logit )
Formula: accuracy ~ expectancy * owner + (1 | participant)
   Data: df

      AIC       BIC    logLik -2*log(L)  df.resid 
  44358.5   44420.0  -22172.3   44344.5     48377 

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-2.6834  0.3727  0.4508  0.5109  0.5697 

Random effects:
 Groups      Name        Variance Std.Dev.
 participant (Intercept) 0        0       
Number of obs: 48384, groups:  participant, 72

Fixed effects:
                                   Estimate Std. Error z value Pr(>|z|)    
(Intercept)                         1.97418    0.02779  71.045  < 2e-16 ***
expectancyFriend                   -0.16612    0.05316  -3.125  0.00178 ** 
expectancyEqual                    -0.38072    0.04068  -9.358  < 2e-16 ***
ownerFriend-Owned                  -0.84893    0.04598 -18.465  < 2e-16 ***
expectancyFriend:ownerFriend-Owned  0.38391    0.06837   5.616 1.96e-08 ***
expectancyEqual:ownerFriend-Owned   0.67686    0.06154  10.998  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Correlation of Fixed Effects:
            (Intr) expctF expctE ownF-O eF:F-O
expctncyFrn -0.523                            
expctncyEql -0.683  0.357                     
ownrFrnd-Ow -0.605  0.317  0.413              
expctnF:F-O  0.407 -0.778 -0.278 -0.673       
expctnE:F-O  0.452 -0.237 -0.661 -0.747  0.503
optimizer (Nelder_Mead) convergence code: 0 (OK)
boundary (singular) fit: see help('isSingular')

> 
> acc_simple_effects <- emmeans(acc_model, pairwise ~ owner | expectancy)
> print(acc_simple_effects)
$emmeans
expectancy = Self:
 owner        emmean     SE  df asymp.LCL asymp.UCL
 Self-Owned     1.97 0.0278 Inf      1.92      2.03
 Friend-Owned   1.13 0.0366 Inf      1.05      1.20

expectancy = Friend:
 owner        emmean     SE  df asymp.LCL asymp.UCL
 Self-Owned     1.81 0.0453 Inf      1.72      1.90
 Friend-Owned   1.34 0.0224 Inf      1.30      1.39

expectancy = Equal:
 owner        emmean     SE  df asymp.LCL asymp.UCL
 Self-Owned     1.59 0.0297 Inf      1.54      1.65
 Friend-Owned   1.42 0.0281 Inf      1.37      1.48

Results are given on the logit (not the response) scale. 
Confidence level used: 0.95 

$contrasts
expectancy = Self:
 contrast                      estimate     SE  df z.ratio p.value
 (Self-Owned) - (Friend-Owned)    0.849 0.0460 Inf  18.465  <.0001

expectancy = Friend:
 contrast                      estimate     SE  df z.ratio p.value
 (Self-Owned) - (Friend-Owned)    0.465 0.0506 Inf   9.198  <.0001

expectancy = Equal:
 contrast                      estimate     SE  df z.ratio p.value
 (Self-Owned) - (Friend-Owned)    0.172 0.0409 Inf   4.205  <.0001

Results are given on the log odds ratio (not the response) scale. 
```