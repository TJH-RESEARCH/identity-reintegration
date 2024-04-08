
library(patchwork)

boxplot_mcarm <-
  data %>% 
  mutate(latent_group = 
           factor(latent_group, 
                  levels = c('Lower ID', 'Middle ID', 'Higher ID'))
  ) %>% 
  ggplot(aes(x = mcarm_total, 
             y = latent_group)) +
  geom_boxplot() +
  xlab('Overall') +
  ylab('') +
  theme_classic()

# Purpose -----------------------------------------------------------
boxplot_purpose <-
  data %>% 
  mutate(latent_group = 
           factor(latent_group, 
                  levels = c('Lower ID', 'Middle ID', 'Higher ID'))
  ) %>% 
  ggplot(aes(x = mcarm_purpose_connection, 
             y = latent_group)) +
  geom_boxplot() +
  labs(title = '') +
  xlab('Purpose') +
  ylab('') +
  theme_classic()


# Help Seeking -----------------------------------------------------------
boxplot_help_seeking <-
  data %>% 
  mutate(latent_group = 
           factor(latent_group, 
                  levels = c('Lower ID', 'Middle ID', 'Higher ID'))
  ) %>% 
  ggplot(aes(x = mcarm_help_seeking, 
             y = latent_group)) +
  geom_boxplot() +
  labs(title = '') +
  xlab('Help Seeking') +
  ylab('') +
  theme_classic() +
  theme(axis.text.y = element_blank())


# Beliefs About Civilians -----------------------------------------------------------
boxplot_civilians <-
  data %>% 
  mutate(latent_group = 
           factor(latent_group, 
                  levels = c('Lower ID', 'Middle ID', 'Higher ID'))
  ) %>% 
  ggplot(aes(x = mcarm_beliefs_about_civilians, 
             y = latent_group)) +
  geom_boxplot() +
  labs(title = '') +
  xlab('Beliefs About Civilians') +
  ylab('') +
  theme_classic() +
  theme(axis.text.y = element_blank())


# Resent ------------------------------------------------------------------
boxplot_resent <- 
  data %>% 
  mutate(latent_group = 
           factor(latent_group, 
                  levels = c('Lower ID', 'Middle ID', 'Higher ID'))
  ) %>% 
  ggplot(aes(x = mcarm_resentment_regret, 
             y = latent_group)) +
  geom_boxplot() +
  labs(title = '') +
  xlab('Resentment') +
  ylab('') +
  theme_classic() +
  theme(axis.text.y = element_blank())


# Regimentation -----------------------------------------------------------
boxplot_regiment <-
  data %>% 
  mutate(latent_group = 
           factor(latent_group, 
                  levels = c('Lower ID', 'Middle ID', 'Higher ID'))
  ) %>% 
  ggplot(aes(x = mcarm_regimentation, 
             y = latent_group)) +
  geom_boxplot() +
  labs(title = '') +
  xlab('Regimentation') +
  ylab('') +
  theme_classic() +
  theme(axis.text.y = element_blank())


boxplot_patchwork <-
  (boxplot_mcarm + boxplot_civilians + boxplot_help_seeking) / 
  (  boxplot_purpose + boxplot_regiment + boxplot_resent) 

boxplot_patchwork <-
  boxplot_patchwork +
  plot_annotation(title = 'Reintegration by Military Identity Cluster')


ggsave(boxplot_patchwork, filename = paste0('output/figures/boxplots.jpg'))

rm(boxplot_mcarm, boxplot_civilians, boxplot_help_seeking, boxplot_purpose, boxplot_regiment, boxplot_resent)

