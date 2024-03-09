
library(lavaan)

# Specify Model --------------------------------------------------------------
model_mcarm <- 
  '
  reintegration ~~ 1*reintegration
  reintegration =~ purpose_connection + help_seeking + beliefs_about_civilians + resentment_regret + regimentation
  
  purpose_connection =~ mcarm_1 + mcarm_2 + mcarm_3 + mcarm_4 +mcarm_5 + mcarm_6
  help_seeking =~ mcarm_7 + mcarm_8 + mcarm_9 + mcarm_10
  beliefs_about_civilians =~ mcarm_11 + mcarm_12 + mcarm_13
  resentment_regret =~ mcarm_14 + mcarm_15 +mcarm_16
  regimentation =~ mcarm_17 + mcarm_18 + mcarm_19 + mcarm_20 + mcarm_21'
  
  

# CFA: Maximum Likelihood -------------------------------------------------
fit_mcarm <- 
  lavaan::cfa(model_mcarm, 
              data, 
              std.lv = F, 
              ordered = F, 
              estimator = 'MLR')

fit_mcarm %>% summary(fit.measures = T, standardized = T)
fit_mcarm %>% fitMeasures(c("cfi", "gfi", 'agfi', 'rmr', 'rmsea', 'srmr', 'nfi', 'tli'))

reliability_mcarm <-
  fit_mcarm %>% semTools::reliability(return.total = T) %>% 
    as.data.frame() %>% tibble() %>% 
    mutate(stat = c('alpha', 'omega', 'omega2', 'omega3', 'avevar')) %>% 
    pivot_longer(!stat)

reliability_mcarm %>% print(n = 50)
reliability_mcarm %>% write_csv('output/stats/reliability-mcarm.csv')
  
fit_mcarm %>% 
  semPlot::semPaths(what = 'std')


# Message -----------------------------------------------------------------
message('M-MCARM Internal Consistency metrics and SEM plot saved. See /output/stats and output/figures/sem-plots`')

rm(fit_mcarm, reliability_mcarm)
