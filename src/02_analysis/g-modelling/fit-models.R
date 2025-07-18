


# MCARM TOTAL --------------------------------------------------------------
model_mcarm_1 <- data %>% lm(mcarm_total ~ cluster, .)
model_mcarm_2 <- 
  data %>% 
  lm(mcarm_total ~ 
       cluster +
       race_white + 
       race_black + 
       sex_male +
       enlisted +
       service_era_post_911 + 
       service_era_vietnam + 
       service_era_persian_gulf +
       military_exp_combat +
       n_deploy +
       branch_air_force +
       branch_marines +
       branch_navy, .)
aov_mcarm_1 <- aov(model_mcarm_1)
aov_mcarm_1 <- aov(model_mcarm_2)


# BELIEFS ABOUT CIVILIANS  --------------------------------------------------------------
model_civilians_1 <- data %>% lm(mcarm_beliefs_about_civilians ~ cluster, .)
model_civilians_2 <- 
  data %>% 
  lm(mcarm_beliefs_about_civilians ~ 
       cluster +
       race_white + 
       race_black + 
       sex_male +
       enlisted + 
       service_era_post_911 + 
       service_era_vietnam + 
       service_era_persian_gulf +
       military_exp_combat +
       n_deploy +
       branch_air_force +
       branch_marines +
       branch_navy, .)

aov_civilians_1 <- aov(model_civilians_1)
aov_civilians_2 <- aov(model_civilians_2)


# PURPOSE --------------------------------------------------------------
model_purpose_1 <- data %>% lm(mcarm_purpose_connection ~ cluster, .)
model_purpose_2 <- 
  data %>% 
  lm(mcarm_purpose_connection ~ 
       cluster +
       race_white + 
       race_black + 
       sex_male +
       enlisted + 
       service_era_post_911 + 
       service_era_vietnam + 
       service_era_persian_gulf +
       military_exp_combat +
       n_deploy +
       branch_air_force +
       branch_marines +
       branch_navy, .)
aov_purpose_1 <- aov(model_purpose_1)
aov_purpose_2 <- aov(model_purpose_2)



# HELP SEEKING -----------------------------------------------------------------
model_help_seeking_1 <- data %>% lm(mcarm_help_seeking ~ cluster, .)
model_help_seeking_2 <- 
  data %>% 
  lm(mcarm_help_seeking ~ 
       cluster +
       race_white + 
       race_black + 
       sex_male +
       enlisted + 
       service_era_post_911 + 
       service_era_vietnam + 
       service_era_persian_gulf +
       military_exp_combat +
       n_deploy +
       branch_air_force +
       branch_marines +
       branch_navy, .)
aov_help_seeking_1 <- aov(model_help_seeking_1)
aov_help_seeking_2 <- aov(model_help_seeking_2)


# RESENTMENT AND REGRET -------------------------------------------------------
model_resent_1 <- data %>% lm(mcarm_resentment_regret ~ cluster, .)
model_resent_2 <- 
  data %>% 
  lm(mcarm_resentment_regret ~ 
       cluster +
       race_white + 
       race_black + 
       sex_male +
       enlisted + 
       service_era_post_911 + 
       service_era_vietnam + 
       service_era_persian_gulf +
       military_exp_combat +
       n_deploy +
       branch_air_force +
       branch_marines +
       branch_navy, .)
aov_resent_1 <- aov(model_resent_1)
aov_resent_2 <- aov(model_resent_2)




# REGIMENTATION --------------------------------------------------------------
model_regiment_1 <- data %>% lm(mcarm_regimentation ~ cluster, .)
model_regiment_2 <- 
  data %>% 
  lm(mcarm_regimentation ~ 
       cluster +
       race_white + 
       race_black + 
       sex_male +
       enlisted + 
       service_era_post_911 + 
       service_era_vietnam + 
       service_era_persian_gulf +
       military_exp_combat +
       n_deploy +
       branch_air_force +
       branch_marines +
       branch_navy, .)
aov_regiment_1 <- aov(model_regiment_1)
aov_regiment_2 <- aov(model_regiment_2)
