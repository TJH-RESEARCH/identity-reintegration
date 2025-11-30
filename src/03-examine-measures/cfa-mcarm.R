
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
## Sample 1
fit_mcarm_1 <- 
  lavaan::cfa(model_mcarm, 
              data_1, 
              std.lv = F, 
              ordered = F, 
              estimator = 'MLR')

fit_mcarm_1 %>% summary(fit.measures = TRUE, standardized = TRUE)
fit_mcarm_1 %>% fitMeasures(c("cfi", "gfi", 'agfi', 'rmr', 'rmsea', 'srmr', 'nfi', 'tli'))

reliability_mcarm_1 <-
  fit_mcarm_1 %>% 
    semTools::reliability(return.total = T) %>% 
    as.data.frame() %>% tibble() %>% 
    mutate(stat = c('alpha', 'omega', 'omega2', 'omega3', 'avevar')) %>% 
    pivot_longer(!stat)



## Sample 2
fit_mcarm_2 <- 
  lavaan::cfa(model_mcarm, 
              data_2, 
              std.lv = F, 
              ordered = F, 
              estimator = 'MLR')

fit_mcarm_2 %>% summary(fit.measures = TRUE, standardized = TRUE)
fit_mcarm_2 %>% fitMeasures(c("cfi", "gfi", 'agfi', 'rmr', 'rmsea', 'srmr', 'nfi', 'tli'))

reliability_mcarm_2 <-
  fit_mcarm_2 %>% 
  semTools::reliability(return.total = T) %>% 
  as.data.frame() %>% tibble() %>% 
  mutate(stat = c('alpha', 'omega', 'omega2', 'omega3', 'avevar')) %>% 
  pivot_longer(!stat)



# Print to console
reliability_mcarm_1 %>% print(n = 50)
reliability_mcarm_2 %>% print(n = 50)


# Combine
reliability_mcarm <-  
  bind_cols(
    reliability_mcarm_1 %>% rename(value_1 = value),
    reliability_mcarm_2 %>% select(value) %>% rename(value_2 = value)
    ) %>% 
    slice_head(n = 12) %>% 
    rename(variable = name) %>% 
    mutate(scale = 'MCARM') %>% 
    pivot_wider(id_cols = c(scale, variable), names_from = stat, values_from = c(value_1, value_2)) %>% 
    rename(alpha_1 = value_1_alpha, alpha_2 = value_2_alpha, omega_1 = value_1_omega, omega_2 = value_2_omega)

# Write to File
reliability_mcarm %>% write_csv('output/stats/reliability-mcarm.csv')
  