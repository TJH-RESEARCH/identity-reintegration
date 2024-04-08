

# Trying to wrangle the robust errors

coefplot_mcarm <-
  model_mcarm_2 %>% 
  broom::tidy(conf.int = T, conf.level = 0.95) %>% 
  
  # Add robust standard errors
  mutate(se_robust = as.numeric(coeftest_mcarm_2[,2])) %>% 
  filter(term != '(Intercept)') %>% 
  ggplot(aes(x = term, y = estimate, ymin = (estimate - 2 * se_robust),
             ymax = (estimate + 2 * se_robust))) +
  geom_pointrange() +
  geom_hline(aes(yintercept = 0), linetype = 2) +
  theme_classic() +
  xlab('M-CARM: Total') +
  ylab('') +
  scale_x_discrete( 
    labels = c(
      `latent_groupLower ID` = 'Lower Identity',
      `latent_groupHigher ID` = 'Higher Identity',
      sex_male = 'Male',
      race_black = 'Race: Black', 
      race_white = 'Race: White',
      branch_air_force = 'Branch: Air Force',
      branch_marines = 'Branch: Marines',
      branch_navy = 'Branch: Navy',
      enlisted = 'Enlisted', 
      service_era_post_911 = 'Post-9/11 Era',
      service_era_vietnam = 'Vietnam Era',
      service_era_persian_gulf = 'Persian Gulf Era',
      n_deploy = 'Deployments (#)',
      military_exp_combat = 'Combat'),
    limits = c(
      'latent_groupLower ID',
      'latent_groupHigher ID',
      'sex_male',
      'race_black', 
      'race_white',
      'branch_air_force',
      'branch_marines',
      'branch_navy',
      'enlisted', 
      'service_era_persian_gulf',
      'service_era_vietnam', 
      'service_era_post_911', 
      'n_deploy',
      'military_exp_combat'
    )
  ) +
  #theme(axis.text.x = element_text(angle = -45, vjust = 0, hjust = 0)) +
  theme(axis.text.x = element_blank())



# -------------------------------------------------------------------------
coefplot_civilians <-
  model_civilians_2 %>% 
  broom::tidy(conf.int = T, conf.level = 0.95) %>% 
  
  # Add robust standard errors
  mutate(se_robust = as.numeric(coeftest_civilians_2[,2])) %>% 
  filter(term != '(Intercept)') %>% 
  ggplot(aes(x = term, y = estimate, ymin = (estimate - 2 * se_robust),
             ymax = (estimate + 2 * se_robust))) +
  geom_pointrange() +
  geom_hline(aes(yintercept = 0), linetype = 2) +
  theme_classic() +
  labs(title = '') +
  xlab('Beliefs About Civilians') +
  ylab('') +
  scale_x_discrete( 
    labels = c(
      `latent_groupLower ID` = 'Lower Identity',
      `latent_groupHigher ID` = 'Higher Identity',
      sex_male = 'Male',
      race_black = 'Race: Black', 
      race_white = 'Race: White',
      branch_air_force = 'Branch: Air Force',
      branch_marines = 'Branch: Marines',
      branch_navy = 'Branch: Navy',
      enlisted = 'Enlisted', 
      service_era_post_911 = 'Post-9/11 Era',
      service_era_vietnam = 'Vietnam Era',
      service_era_persian_gulf = 'Persian Gulf Era',
      n_deploy = 'Deployments (#)',
      military_exp_combat = 'Combat'),
    limits = c(
      'latent_groupLower ID',
      'latent_groupHigher ID',
      'sex_male',
      'race_black', 
      'race_white',
      'branch_air_force',
      'branch_marines',
      'branch_navy',
      'enlisted', 
      'service_era_persian_gulf',
      'service_era_vietnam', 
      'service_era_post_911', 
      'n_deploy',
      'military_exp_combat'
    )
  ) +
  theme(axis.text.x = element_text(angle = -45, vjust = 0, hjust = 0))
coefplot_civilians

# -------------------------------------------------------------------------
coefplot_help_seeking <-
  model_help_seeking_2 %>% 
  broom::tidy(conf.int = T, conf.level = 0.95) %>% 
  
  # Add robust standard errors
  mutate(se_robust = as.numeric(coeftest_help_seeking_2[,2])) %>% 
  filter(term != '(Intercept)') %>% 
  ggplot(aes(x = term, y = estimate, ymin = (estimate - 2 * se_robust),
             ymax = (estimate + 2 * se_robust))) +
  geom_pointrange() +
  geom_hline(aes(yintercept = 0), linetype = 2) +
  theme_classic() +
  labs(title = '') +
  xlab('Help Seeking') +
  ylab('') +
  scale_x_discrete( 
    labels = c(
      `latent_groupLower ID` = 'Lower Identity',
      `latent_groupHigher ID` = 'Higher Identity',
      sex_male = 'Male',
      race_black = 'Race: Black', 
      race_white = 'Race: White',
      branch_air_force = 'Branch: Air Force',
      branch_marines = 'Branch: Marines',
      branch_navy = 'Branch: Navy',
      enlisted = 'Enlisted', 
      service_era_post_911 = 'Post-9/11 Era',
      service_era_vietnam = 'Vietnam Era',
      service_era_persian_gulf = 'Persian Gulf Era',
      n_deploy = 'Deployments (#)',
      military_exp_combat = 'Combat'),
    limits = c(
      'latent_groupLower ID',
      'latent_groupHigher ID',
      'sex_male',
      'race_black', 
      'race_white',
      'branch_air_force',
      'branch_marines',
      'branch_navy',
      'enlisted', 
      'service_era_persian_gulf',
      'service_era_vietnam', 
      'service_era_post_911', 
      'n_deploy',
      'military_exp_combat'
    )
  ) +
  theme(axis.text.x = element_text(angle = -45, vjust = 0, hjust = 0))




# -------------------------------------------------------------------------
coefplot_purpose <-
  model_purpose_2 %>% 
  broom::tidy(conf.int = T, conf.level = 0.95) %>% 
  
  # Add robust standard errors
  mutate(se_robust = as.numeric(coeftest_purpose_2[,2])) %>% 
  filter(term != '(Intercept)') %>% 
  ggplot(aes(x = term, y = estimate, ymin = (estimate - 2 * se_robust),
             ymax = (estimate + 2 * se_robust))) +
  geom_pointrange() +
  geom_hline(aes(yintercept = 0), linetype = 2) +
  theme_classic() +
  xlab('Purpose') +
  ylab('') +
  scale_x_discrete( 
    labels = c(
      `latent_groupLower ID` = 'Lower Identity',
      `latent_groupHigher ID` = 'Higher Identity',
      sex_male = 'Male',
      race_black = 'Race: Black', 
      race_white = 'Race: White',
      branch_air_force = 'Branch: Air Force',
      branch_marines = 'Branch: Marines',
      branch_navy = 'Branch: Navy',
      enlisted = 'Enlisted', 
      service_era_post_911 = 'Post-9/11 Era',
      service_era_vietnam = 'Vietnam Era',
      service_era_persian_gulf = 'Persian Gulf Era',
      n_deploy = 'Deployments (#)',
      military_exp_combat = 'Combat'),
    limits = c(
      'latent_groupLower ID',
      'latent_groupHigher ID',
      'sex_male',
      'race_black', 
      'race_white',
      'branch_air_force',
      'branch_marines',
      'branch_navy',
      'enlisted', 
      'service_era_persian_gulf',
      'service_era_vietnam', 
      'service_era_post_911', 
      'n_deploy',
      'military_exp_combat'
    )
  ) +
  # theme(axis.text.x = element_text(angle = -45, vjust = 0, hjust = 0)) +
  theme(axis.text.x = element_blank())




# -------------------------------------------------------------------------
coefplot_resent <-
  model_resent_2 %>% 
  broom::tidy(conf.int = T, conf.level = 0.95) %>% 
  
  # Add robust standard errors
  mutate(se_robust = as.numeric(coeftest_resent_2[,2])) %>% 
  filter(term != '(Intercept)') %>% 
  ggplot(aes(x = term, y = estimate, ymin = (estimate - 2 * se_robust),
             ymax = (estimate + 2 * se_robust))) +
  geom_pointrange() +
  geom_hline(aes(yintercept = 0), linetype = 2) +
  theme_classic() +
  labs(title = '') +
  xlab('Resentment and Regret') +
  ylab('') +
  scale_x_discrete( 
    labels = c(
      `latent_groupLower ID` = 'Lower Identity',
      `latent_groupHigher ID` = 'Higher Identity',
      sex_male = 'Male',
      race_black = 'Race: Black', 
      race_white = 'Race: White',
      branch_air_force = 'Branch: Air Force',
      branch_marines = 'Branch: Marines',
      branch_navy = 'Branch: Navy',
      enlisted = 'Enlisted', 
      service_era_post_911 = 'Post-9/11 Era',
      service_era_vietnam = 'Vietnam Era',
      service_era_persian_gulf = 'Persian Gulf Era',
      n_deploy = 'Deployments (#)',
      military_exp_combat = 'Combat'),
    limits = c(
      'latent_groupLower ID',
      'latent_groupHigher ID',
      'sex_male',
      'race_black', 
      'race_white',
      'branch_air_force',
      'branch_marines',
      'branch_navy',
      'enlisted', 
      'service_era_persian_gulf',
      'service_era_vietnam', 
      'service_era_post_911', 
      'n_deploy',
      'military_exp_combat'
    )
  )  +
  theme(axis.text.x = element_text(angle = -45, vjust = 0, hjust = 0))


coefplot_resent

# -------------------------------------------------------------------------
coefplot_regiment <-
  model_regiment_2 %>% 
  broom::tidy(conf.int = T, conf.level = 0.95) %>% 
  
  # Add robust standard errors
  mutate(se_robust = as.numeric(coeftest_regiment_2[,2])) %>% 
  filter(term != '(Intercept)') %>% 
  ggplot(aes(x = term, y = estimate, ymin = (estimate - 2 * se_robust),
             ymax = (estimate + 2 * se_robust))) +
  geom_pointrange() +
  geom_hline(aes(yintercept = 0), linetype = 2) +
  theme_classic() +
  labs(title = '') +
  xlab('Regimentation') +
  ylab('') +
  scale_x_discrete( 
    labels = c(
      `latent_groupLower ID` = 'Lower Identity',
      `latent_groupHigher ID` = 'Higher Identity',
      sex_male = 'Male',
      race_black = 'Race: Black', 
      race_white = 'Race: White',
      branch_air_force = 'Branch: Air Force',
      branch_marines = 'Branch: Marines',
      branch_navy = 'Branch: Navy',
      enlisted = 'Enlisted', 
      service_era_post_911 = 'Post-9/11 Era',
      service_era_vietnam = 'Vietnam Era',
      service_era_persian_gulf = 'Persian Gulf Era',
      n_deploy = 'Deployments (#)',
      military_exp_combat = 'Combat'),
    limits = c(
      'latent_groupLower ID',
      'latent_groupHigher ID',
      'sex_male',
      'race_black', 
      'race_white',
      'branch_air_force',
      'branch_marines',
      'branch_navy',
      'enlisted', 
      'service_era_persian_gulf',
      'service_era_vietnam', 
      'service_era_post_911', 
      'n_deploy',
      'military_exp_combat'
    )
  ) +
  #theme(axis.text.x = element_text(angle = -45, vjust = 0, hjust = 0)) +
  theme(axis.text.x = element_blank())




# -------------------------------------------------------------------------

library(patchwork)

plot_coef_1 <- coefplot_mcarm / coefplot_help_seeking
plot_coef_2 <- coefplot_purpose / coefplot_resent
plot_coef_3 <- coefplot_regiment / coefplot_civilians

plot_coef_1 %>% print()
plot_coef_2 %>% print()
plot_coef_3 %>% print()

ggsave(filename = paste0('output/figures/coeficients-', analysis, '.jpg'),
       plot = plot_coef)

rm(
  coefplot_civilians,
  coefplot_help_seeking,
  coefplot_mcarm,
  coefplot_purpose,
  coefplot_regiment,
  coefplot_resent,
  plot_coef)




