

# Trying to wrangle the robust errors

coefplot_mcarm <-
  model_mcarm_2 %>% 
  broom::tidy(conf.int = T, conf.level = 0.95) %>% 
  
  # Add robust standard errors
  mutate(se_robust = as.numeric(coeftest_mcarm_2[,2])) %>% 
  filter(term != '(Intercept)') %>% 
  ggplot(aes(x = estimate, y = term, xmin = (estimate - 2 * se_robust),
             xmax = (estimate + 2 * se_robust))) +
  geom_pointrange() +
  geom_vline(aes(xintercept = 0), linetype = 2) +
  theme_classic() +
  labs(title = 'Coefficients and Robust Errors') +
  xlab('M-CARM: Total') +
  ylab('')


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
  labs(title = '') +
  xlab('Beliefs About Civilians') +
  ylab('') +
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
  labs(title = '') +
  xlab('Help Seeking') +
  ylab('') +
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
  labs(title = '',
       caption = 'Point estimates are undstandardized coefficients. Error bars are Huber-White.') +
  xlab('Purpose') +
  ylab('')



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
  labs(title = '') +
  xlab('Resentment and Regret') +
  ylab('') +
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
  labs(title = '') +
  xlab('Regimentation') +
  ylab('') +
  theme(axis.text.y = element_blank())




# -------------------------------------------------------------------------

library(patchwork)

plot_coef <-
(coefplot_mcarm + coefplot_civilians + coefplot_help_seeking )/
(coefplot_purpose + coefplot_resent + coefplot_regiment) 

plot_coef %>% print()

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




