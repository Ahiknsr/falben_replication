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
> rt_model <- lmer(rt ~ expectancy * owner + (1 | participant), data = rt_data)
> print(summary(rt_model))
Linear mixed model fit by REML. t-tests use Satterthwaite's method ['lmerModLmerTest']
Formula: rt ~ expectancy * owner + (1 | participant)
   Data: rt_data

REML criterion at convergence: 455852.6

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-4.4635 -0.6714  0.0036  0.6742  4.5828 

Random effects:
 Groups      Name        Variance Std.Dev.
 participant (Intercept)    2.003  1.415  
 Residual                5620.918 74.973  
Number of obs: 39736, groups:  participant, 72

Fixed effects:
                                     Estimate Std. Error         df t value Pr(>|t|)    
(Intercept)                         4.553e+02  7.454e-01  7.585e+02 610.752   <2e-16 ***
expectancyFriend                   -1.526e+00  1.452e+00  3.967e+04  -1.051    0.293    
expectancyEqual                     6.465e-01  1.148e+00  3.967e+04   0.563    0.573    
ownerFriend-Owned                   2.907e+01  1.536e+00  3.969e+04  18.929   <2e-16 ***
expectancyFriend:ownerFriend-Owned -5.103e-01  2.134e+00  3.968e+04  -0.239    0.811    
expectancyEqual:ownerFriend-Owned  -2.115e-02  2.015e+00  3.968e+04  -0.010    0.992    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Correlation of Fixed Effects:
            (Intr) expctF expctE ownF-O eF:F-O
expctncyFrn -0.488                            
expctncyEql -0.617  0.317                     
ownrFrnd-Ow -0.461  0.237  0.299              
expctnF:F-O  0.332 -0.681 -0.216 -0.720       
expctnE:F-O  0.351 -0.180 -0.570 -0.762  0.549
> 
> rt_simple_effects <- emmeans(rt_model, pairwise ~ owner | expectancy)
Note: D.f. calculations have been disabled because the number of observations exceeds 3000.
To enable adjustments, add the argument 'pbkrtest.limit = 39736' (or larger)
[or, globally, 'set emm_options(pbkrtest.limit = 39736)' or larger];
but be warned that this may result in large computation time and memory use.
Note: D.f. calculations have been disabled because the number of observations exceeds 3000.
To enable adjustments, add the argument 'lmerTest.limit = 39736' (or larger)
[or, globally, 'set emm_options(lmerTest.limit = 39736)' or larger];
but be warned that this may result in large computation time and memory use.
> print(rt_simple_effects)
$emmeans
expectancy = Self:
 owner        emmean    SE  df asymp.LCL asymp.UCL
 Self-Owned    455.3 0.745 Inf     453.8     456.7
 Friend-Owned  484.3 1.360 Inf     481.7     487.0

expectancy = Friend:
 owner        emmean    SE  df asymp.LCL asymp.UCL
 Self-Owned    453.7 1.270 Inf     451.2     456.2
 Friend-Owned  482.3 0.800 Inf     480.7     483.9

expectancy = Equal:
 owner        emmean    SE  df asymp.LCL asymp.UCL
 Self-Owned    455.9 0.904 Inf     454.1     457.7
 Friend-Owned  485.0 0.969 Inf     483.1     486.9

Degrees-of-freedom method: asymptotic 
Confidence level used: 0.95 

$contrasts
expectancy = Self:
 contrast                      estimate   SE  df z.ratio p.value
 (Self-Owned) - (Friend-Owned)    -29.1 1.54 Inf -18.929  <.0001

expectancy = Friend:
 contrast                      estimate   SE  df z.ratio p.value
 (Self-Owned) - (Friend-Owned)    -28.6 1.48 Inf -19.281  <.0001

expectancy = Equal:
 contrast                      estimate   SE  df z.ratio p.value
 (Self-Owned) - (Friend-Owned)    -29.0 1.30 Inf -22.267  <.0001

Degrees-of-freedom method: asymptotic 

> 
> acc_model <- glmer(accuracy ~ expectancy * owner + (1 | participant), data = df, family = binomial)
> print(summary(acc_model))
Generalized linear mixed model fit by maximum likelihood (Laplace Approximation) ['glmerMod']
 Family: binomial  ( logit )
Formula: accuracy ~ expectancy * owner + (1 | participant)
   Data: df

      AIC       BIC    logLik -2*log(L)  df.resid 
  44232.5   44294.0  -22109.3   44218.5     48377 

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-2.7697  0.3646  0.3685  0.5577  0.5682 

Random effects:
 Groups      Name        Variance  Std.Dev.
 participant (Intercept) 0.0008529 0.0292  
Number of obs: 48384, groups:  participant, 72

Fixed effects:
                                    Estimate Std. Error z value Pr(>|z|)    
(Intercept)                         1.997084   0.028264  70.658   <2e-16 ***
expectancyFriend                    0.009453   0.056235   0.168    0.867    
expectancyEqual                     0.021382   0.044553   0.480    0.631    
ownerFriend-Owned                  -0.835081   0.046402 -17.997   <2e-16 ***
expectancyFriend:ownerFriend-Owned -0.024419   0.070567  -0.346    0.729    
expectancyEqual:ownerFriend-Owned  -0.006975   0.063557  -0.110    0.913    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Correlation of Fixed Effects:
            (Intr) expctF expctE ownF-O eF:F-O
expctncyFrn -0.495                            
expctncyEql -0.625  0.315                     
ownrFrnd-Ow -0.600  0.302  0.381              
expctnF:F-O  0.395 -0.797 -0.251 -0.658       
expctnE:F-O  0.438 -0.220 -0.701 -0.730  0.480
> 
> acc_simple_effects <- emmeans(acc_model, pairwise ~ owner | expectancy)
> print(acc_simple_effects)
$emmeans
expectancy = Self:
 owner        emmean     SE  df asymp.LCL asymp.UCL
 Self-Owned     2.00 0.0283 Inf      1.94      2.05
 Friend-Owned   1.16 0.0371 Inf      1.09      1.23

expectancy = Friend:
 owner        emmean     SE  df asymp.LCL asymp.UCL
 Self-Owned     2.01 0.0489 Inf      1.91      2.10
 Friend-Owned   1.15 0.0215 Inf      1.10      1.19

expectancy = Equal:
 owner        emmean     SE  df asymp.LCL asymp.UCL
 Self-Owned     2.02 0.0348 Inf      1.95      2.09
 Friend-Owned   1.18 0.0265 Inf      1.12      1.23

Results are given on the logit (not the response) scale. 
Confidence level used: 0.95 

$contrasts
expectancy = Self:
 contrast                      estimate     SE  df z.ratio p.value
 (Self-Owned) - (Friend-Owned)    0.835 0.0464 Inf  17.997  <.0001

expectancy = Friend:
 contrast                      estimate     SE  df z.ratio p.value
 (Self-Owned) - (Friend-Owned)    0.860 0.0532 Inf  16.169  <.0001

expectancy = Equal:
 contrast                      estimate     SE  df z.ratio p.value
 (Self-Owned) - (Friend-Owned)    0.842 0.0434 Inf  19.393  <.0001

Results are given on the log odds ratio (not the response) scale. 
```