

bind_rows(



model_civilians_2 %>% 
  broom::tidy(conf.int = T, conf.level = 0.95) %>% 
  mutate(se_robust = as.numeric(coeftest_civilians_2[,2])) %>% 
  filter(term == 'latent_groupLower Identity' |
           term == 'latent_groupHigher Identity') %>% 
  mutate(outcome = 'Civilians') %>% 
  mutate(term = if_else(term == 'latent_groupLower Identity',
                        'Lower: Civilians', 
                        'Higher: Civilians'
  )), 


model_help_seeking_2 %>% 
  broom::tidy(conf.int = T, conf.level = 0.95) %>% 
  mutate(se_robust = as.numeric(coeftest_help_seeking_2[,2])) %>% 
  filter(term == 'latent_groupLower Identity' |
           term == 'latent_groupHigher Identity') %>% 
  mutate(outcome = 'Help Seeking') %>% 
  mutate(term = if_else(term == 'latent_groupLower Identity',
                        'Lower: Help Seeking', 
                        'Higher: Help Seeking'
  )), 


model_purpose_2 %>% 
  broom::tidy(conf.int = T, conf.level = 0.95) %>% 
  mutate(se_robust = as.numeric(coeftest_purpose_2[,2])) %>% 
  filter(term == 'latent_groupLower Identity' |
           term == 'latent_groupHigher Identity') %>% 
  mutate(outcome = 'Purpose') %>% 
  mutate(term = if_else(term == 'latent_groupLower Identity',
                        'Lower: Purpose', 
                        'Higher: Purpose'
  )), 



model_regiment_2 %>% 
  broom::tidy(conf.int = T, conf.level = 0.95) %>% 
  mutate(se_robust = as.numeric(coeftest_regiment_2[,2])) %>% 
  filter(term == 'latent_groupLower Identity' |
           term == 'latent_groupHigher Identity') %>% 
  mutate(outcome = 'Regimnetation') %>% 
  mutate(term = if_else(term == 'latent_groupLower Identity',
                        'Lower: Regimentation', 
                        'Higher: Regimentation'
  )), 


model_resent_2 %>% 
  broom::tidy(conf.int = T, conf.level = 0.95) %>% 
  mutate(se_robust = as.numeric(coeftest_resent_2[,2])) %>% 
  filter(term == 'latent_groupLower Identity' |
           term == 'latent_groupHigher Identity') %>% 
  mutate(outcome = 'Resentment') %>% 
  mutate(term = if_else(term == 'latent_groupLower Identity',
                        'Lower: Resentment', 
                        'Higher: Resentment'
  )) 

) %>% 
arrange(outcome) %>% 
  ggplot(aes(x = estimate, 
             y = term, 
             xmin = (estimate - 2 * se_robust),
             xmax = (estimate + 2 * se_robust),
             color = outcome,
             shape = outcome)) +
  scale_color_manual(values = c('#440154', 
                                  '#3b528b',
                                  '#21908C',
                                  '#5ec962',
                                  '#C7E020')) +
  geom_pointrange(size = 1.5, linewidth = 1.5) +
  #geom_vline(aes(xintercept = 0), linetype = 2) +
  theme_classic() +
  theme(axis.text = element_text(size = 14),
        text = element_text(size = 14)
  ) +
  xlab('Total') +
  ylab('') +
  scale_y_discrete( 
    labels = c(
      
      `Lower: Resentment` = 'Lower Identity', 
      `Higher: Resentment` = 'Higher Identity', 
      
      `Lower: Regimentation` = 'Lower Identity', 
      `Higher: Regimentation` = 'Higher Identity',
      
      `Lower: Purpose` = 'Lower Identity', 
      `Higher: Purpose` = 'Higher Identity', 
      
      `Lower: Help Seeking` = 'Lower Identity', 
      `Higher: Help Seeking` = 'Higher Identity', 
      
      `Lower: Civilians` = 'Lower Identity', 
      `Higher: Civilians` = 'Higher Identity'
      
    ),
    limits = c(
      'Lower: Resentment', 
      'Higher: Resentment', 
      
      'Lower: Regimentation', 
      'Higher: Regimentation',
      
      'Lower: Purpose', 
      'Higher: Purpose', 
      
      'Lower: Help Seeking', 
      'Higher: Help Seeking', 
      
      'Lower: Civilians', 
      'Higher: Civilians'
      
    ) 
  ) +
  theme(legend.position = 'none')








# Total -------------------------------------------------------------------


model_mcarm_2 %>% 
  broom::tidy(conf.int = T, conf.level = 0.95) %>% 
  
  # Add robust standard errors
  mutate(se_robust = as.numeric(coeftest_mcarm_2[,2])) %>% 
  filter(term == 'latent_groupLower Identity' |
           term == 'latent_groupHigher Identity') %>% 
  mutate(outcome = 'Rentegration') %>% 
  mutate(term = if_else(term == 'latent_groupLower Identity',
                        'Lower: Reintegration', 
                        'Higher: Reintegration'
  ))