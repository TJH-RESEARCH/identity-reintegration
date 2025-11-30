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

# Sample 1
fit_wis_1 <- 
  lavaan::cfa(model_cfa_wis, 
              data_1, 
              std.lv = F, 
              ordered = F, 
              estimator = 'MLR')

fit_wis_1 %>% summary(fit.measures = T, standardized = T)
fit_wis_1 %>% fitMeasures(c("cfi", "gfi", 'agfi', 'rmr', 'rmsea', 'srmr', 'nfi', 'tli'))


reliability_wis_1 <-
  fit_wis_1 %>% semTools::reliability(return.total = T) %>% 
  as.data.frame() %>% tibble() %>% 
  mutate(stat = c('alpha', 'omega', 'omega2', 'omega3', 'avevar')) %>% 
  pivot_longer(!stat)



# Sample 2 ---------------------------------------------------------------------
fit_wis_2 <- 
  lavaan::cfa(model_cfa_wis, 
              data_2, 
              std.lv = F, 
              ordered = F, 
              estimator = 'MLR')

fit_wis_2 %>% summary(fit.measures = T, standardized = T)
fit_wis_2 %>% fitMeasures(c("cfi", "gfi", 'agfi', 'rmr', 'rmsea', 'srmr', 'nfi', 'tli'))


reliability_wis_2 <-
  fit_wis_2 %>% semTools::reliability(return.total = T) %>% 
  as.data.frame() %>% tibble() %>% 
  mutate(stat = c('alpha', 'omega', 'omega2', 'omega3', 'avevar')) %>% 
  pivot_longer(!stat)


# Print to Console
reliability_wis_1 %>% print(n = 50)
reliability_wis_2 %>% print(n = 50)


# Combine
reliability_wis <-  
  bind_cols(
    reliability_wis_1 %>% rename(value_1 = value),
    reliability_wis_2 %>% select(value) %>% rename(value_2 = value)
  ) %>% 
  slice_head(n = 16) %>% 
  rename(variable = name) %>% 
  mutate(scale = 'WIS') %>% 
  pivot_wider(id_cols = c(scale, variable), names_from = stat, values_from = c(value_1, value_2)) %>% 
  rename(alpha_1 = value_1_alpha, alpha_2 = value_2_alpha, omega_1 = value_1_omega, omega_2 = value_2_omega)
