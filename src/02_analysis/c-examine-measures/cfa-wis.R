library(lavaan)

model_cfa_wis <-
  '
  
  centrality =~ wis_centrality_21 + wis_centrality_22 + wis_centrality_23 + wis_centrality_24    
  connection =~ wis_connection_15 + wis_connection_16 + wis_connection_17
  family =~ wis_family_18 + wis_family_19 + wis_family_20
  interdependent =~ wis_interdependent_8 + wis_interdependent_9 + wis_interdependent_10 + wis_interdependent_11 + wis_interdependent_12 + wis_interdependent_13 + wis_interdependent_14
  public =~ wis_public_25 + wis_public_26 + wis_public_27 + wis_public_28
  private =~ wis_private_1 + wis_private_2 + wis_private_3 + wis_private_4 + wis_private_5 + wis_private_6 + wis_private_7
  skills =~ wis_skills_29 + wis_skills_30 + wis_skills_31
  
  '


fit_wis <- 
  lavaan::cfa(model_cfa_wis, 
              data, 
              std.lv = F, 
              ordered = F, 
              estimator = 'MLR')

fit_wis %>% summary(fit.measures = T, standardized = T)
fit_wis %>% fitMeasures(c("cfi", "gfi", 'agfi', 'rmr', 'rmsea', 'srmr', 'nfi', 'tli'))


reliability_wis <-
  fit_wis %>% semTools::reliability(return.total = T) %>% 
  as.data.frame() %>% tibble() %>% 
  mutate(stat = c('alpha', 'omega', 'omega2', 'omega3', 'avevar')) %>% 
  pivot_longer(!stat)

reliability_wis %>% print(n = 50)
reliability_wis %>% write_csv('output/stats/reliability-wis.csv')

fit_wis %>% 
  semPlot::semPaths(what = 'std')



# Message -----------------------------------------------------------------
message('WIS Internal Consistency metrics and SEM plot saved. See /output/stats and output/figures/sem-plots`')


rm(fit_wis, reliability_wis)
