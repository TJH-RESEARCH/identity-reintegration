

# Trying to wrangle the robust errors

(coefplot_mcarm <-
  model_mcarm_2 %>% 
  broom::tidy(conf.int = T, conf.level = 0.95) %>% 
  
  # Add robust standard errors
  mutate(se_robust = as.numeric(coeftest_mcarm_2[,2])) %>% 
  filter(term != '(Intercept)') %>% 
  ggplot(aes(x = estimate, 
             y = term, 
             xmin = (estimate - 2 * se_robust),
             xmax = (estimate + 2 * se_robust))) +
  geom_pointrange() +
  geom_vline(aes(xintercept = 0), linetype = 2) +
  theme_classic() +
  theme(axis.text = element_text(size = 14),
        text = element_text(size = 14)
        ) +
  xlab('Total') +
  ylab('') +
  scale_y_discrete( 
  labels = c(
    `latent_groupLower Identity` = 'Lower Identity',
    `latent_groupHigher Identity` = 'Higher Identity',
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
    'military_exp_combat',
    'n_deploy',
    'service_era_vietnam', 
    'service_era_persian_gulf',
    'service_era_post_911', 
    'enlisted', 
    'branch_navy',
    'branch_marines',
    'branch_air_force',
    'race_white',
    'race_black', 
    'sex_male',
    'latent_groupHigher Identity',
    'latent_groupLower Identity'
  ) 
  ) 
)










# -------------------------------------------------------------------------
coefplot_civilians <-
  model_civilians_2 %>% 
  broom::tidy(conf.int = T, conf.level = 0.95) %>% 
  
  # Add robust standard errors
  mutate(se_robust = as.numeric(coeftest_civilians_2[,2])) %>% 
  filter(term != '(Intercept)') %>% 
  ggplot(aes(x = estimate, y = term, xmin = (estimate - 2 * se_robust),
             xmax = (estimate + 2 * se_robust))) +
  geom_pointrange() +
  geom_vline(aes(xintercept = 0), linetype = 2) +
  theme_classic() +
  theme(axis.text = element_text(size = 14),
        text = element_text(size = 12)
  ) +
  labs(title = '') +
  xlab('Beliefs about Civilians') +
  ylab('')  +
  scale_y_discrete( 
    labels = c(
      `latent_groupLower Identity` = 'Lower Identity',
      `latent_groupHigher Identity` = 'Higher Identity',
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
      'military_exp_combat',
      'n_deploy',
      'service_era_vietnam', 
      'service_era_persian_gulf',
      'service_era_post_911', 
      'enlisted', 
      'branch_navy',
      'branch_marines',
      'branch_air_force',
      'race_white',
      'race_black', 
      'sex_male',
      'latent_groupHigher Identity',
      'latent_groupLower Identity'
    ) 
  ) +
  theme(axis.text.y = element_blank())


# -------------------------------------------------------------------------
coefplot_help_seeking <-
  model_help_seeking_2 %>% 
  broom::tidy(conf.int = T, conf.level = 0.95) %>% 
  
  # Add robust standard errors
  mutate(se_robust = as.numeric(coeftest_help_seeking_2[,2])) %>% 
  filter(term != '(Intercept)') %>% 
  ggplot(aes(x = estimate, y = term, xmin = (estimate - 2 * se_robust),
             xmax = (estimate + 2 * se_robust))) +
  geom_pointrange() +
  geom_vline(aes(xintercept = 0), linetype = 2) +
  theme_classic() +
  theme(axis.text = element_text(size = 14),
        text = element_text(size = 14)) +
  labs(title = '') +
  xlab('Help Seeking') +
  ylab('')  +
  scale_y_discrete( 
    labels = c(
      `latent_groupLower Identity` = 'Lower Identity',
      `latent_groupHigher Identity` = 'Higher Identity',
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
      'military_exp_combat',
      'n_deploy',
      'service_era_vietnam', 
      'service_era_persian_gulf',
      'service_era_post_911', 
      'enlisted', 
      'branch_navy',
      'branch_marines',
      'branch_air_force',
      'race_white',
      'race_black', 
      'sex_male',
      'latent_groupHigher Identity',
      'latent_groupLower Identity'
    ) 
  ) +
  theme(axis.text.y = element_blank())
  



# -------------------------------------------------------------------------
coefplot_purpose <-
  model_purpose_2 %>% 
  broom::tidy(conf.int = T, conf.level = 0.95) %>% 
  
  # Add robust standard errors
  mutate(se_robust = as.numeric(coeftest_purpose_2[,2])) %>% 
  filter(term != '(Intercept)') %>% 
  ggplot(aes(x = estimate, y = term, xmin = (estimate - 2 * se_robust),
             xmax = (estimate + 2 * se_robust))) +
  geom_pointrange() +
  geom_vline(aes(xintercept = 0), linetype = 2) +
  theme_classic() +
  theme(axis.text = element_text(size = 14),
        text = element_text(size = 14)
  ) +
  xlab('Purpose') +
  ylab('') +
  scale_y_discrete( 
    labels = c(
      `latent_groupLower Identity` = 'Lower Identity',
      `latent_groupHigher Identity` = 'Higher Identity',
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
      'military_exp_combat',
      'n_deploy',
      'service_era_vietnam', 
      'service_era_persian_gulf',
      'service_era_post_911', 
      'enlisted', 
      'branch_navy',
      'branch_marines',
      'branch_air_force',
      'race_white',
      'race_black', 
      'sex_male',
      'latent_groupHigher Identity',
      'latent_groupLower Identity'
    )
  )




# -------------------------------------------------------------------------
coefplot_resent <-
  model_resent_2 %>% 
  broom::tidy(conf.int = T, conf.level = 0.95) %>% 
  
  # Add robust standard errors
  mutate(se_robust = as.numeric(coeftest_resent_2[,2])) %>% 
  filter(term != '(Intercept)') %>% 
  ggplot(aes(x = estimate, y = term, xmin = (estimate - 2 * se_robust),
             xmax = (estimate + 2 * se_robust))) +
  geom_pointrange() +
  geom_vline(aes(xintercept = 0), linetype = 2) +
  theme_classic() +
  theme(axis.text = element_text(size = 14),
        text = element_text(size = 14)) +
  labs(title = '') +
  xlab('Resentment') +
  ylab('')  +
  scale_y_discrete( 
    labels = c(
      `latent_groupLower Identity` = 'Lower Identity',
      `latent_groupHigher Identity` = 'Higher Identity',
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
      'military_exp_combat',
      'n_deploy',
      'service_era_vietnam', 
      'service_era_persian_gulf',
      'service_era_post_911', 
      'enlisted', 
      'branch_navy',
      'branch_marines',
      'branch_air_force',
      'race_white',
      'race_black', 
      'sex_male',
      'latent_groupHigher Identity',
      'latent_groupLower Identity'
    ) 
  )  +
  theme(axis.text.y = element_blank())




# -------------------------------------------------------------------------
coefplot_regiment <-
  model_regiment_2 %>% 
  broom::tidy(conf.int = T, conf.level = 0.95) %>% 
  
  # Add robust standard errors
  mutate(se_robust = as.numeric(coeftest_regiment_2[,2])) %>% 
  filter(term != '(Intercept)') %>% 
  ggplot(aes(x = estimate, y = term, xmin = (estimate - 2 * se_robust),
             xmax = (estimate + 2 * se_robust))) +
  geom_pointrange() +
  geom_vline(aes(xintercept = 0), linetype = 2) +
  theme_classic() +
  theme(axis.text = element_text(size = 14),
        text = element_text(size = 14)
  ) +
  labs(title = '') +
  xlab('Regimentation') +
  ylab('')  +
  scale_y_discrete( 
    labels = c(
      `latent_groupLower Identity` = 'Lower Identity',
      `latent_groupHigher Identity` = 'Higher Identity',
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
      'military_exp_combat',
      'n_deploy',
      'service_era_vietnam', 
      'service_era_persian_gulf',
      'service_era_post_911', 
      'enlisted', 
      'branch_navy',
      'branch_marines',
      'branch_air_force',
      'race_white',
      'race_black', 
      'sex_male',
      'latent_groupHigher Identity',
      'latent_groupLower Identity'
    ) 
  )  +
  theme(axis.text.y = element_blank())




# -------------------------------------------------------------------------

library(patchwork)

plot_coef_1 <- (coefplot_mcarm + coefplot_civilians + coefplot_help_seeking)
plot_coef_2 <- (coefplot_purpose + coefplot_resent + coefplot_regiment) 

plot_coef_1 %>% print()
plot_coef_2 %>% print()

ggsave(filename = paste0('output/figures/coeficients_1.jpg'),
       plot = plot_coef_1)

ggsave(filename = paste0('output/figures/coeficients_2.jpg'),
       plot = plot_coef_2)


rm(
  coefplot_civilians,
  coefplot_help_seeking,
  coefplot_mcarm,
  coefplot_purpose,
  coefplot_regiment,
  coefplot_resent,
  plot_coef_1,
  plot_coef_2)




