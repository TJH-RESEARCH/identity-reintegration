library(viridis)

profile_reintegration <-
  data %>% 
  mutate(cluster = 
           factor(cluster, 
                  levels = c('Lower Identity', 
                             'Medium Identity', 
                             'Higher Identity'))
  ) %>% 
  mutate(mcarm_help_seeking = mcarm_help_seeking / 4, 
         mcarm_regimentation = mcarm_regimentation / 4, 
         mcarm_resentment_regret = mcarm_resentment_regret /3, 
         mcarm_purpose_connection = mcarm_purpose_connection / 6, 
         mcarm_beliefs_about_civilians = mcarm_beliefs_about_civilians / 4) %>% 
  select(mcarm_help_seeking, 
         mcarm_regimentation, 
         mcarm_resentment_regret, 
         mcarm_purpose_connection, 
         mcarm_beliefs_about_civilians, 
         cluster) %>% 
  group_by(cluster) %>% 
  summarise(across(everything(), ~ mean(.x))) %>% 
  pivot_longer(!cluster) %>% 
  ggplot(
    aes(
      x     = name, 
      y     = value, 
      color = cluster,
      group = cluster),
    alpha = .9) + 
  geom_line(
    aes(
      linetype = cluster, 
      color    = cluster),
    alpha = .9) +
  geom_point(
    aes(
      shape = cluster,
      color = cluster),
    size  = 4,
    alpha = .9) + 
  
  # THEME
  theme_classic() +
  
  theme(axis.text.x = 
          element_text(
            angle = -30, 
            vjust =   1, 
            hjust =   0)) +
  
  labs(color = 'Cluster',
       shape = 'Cluster',
       linetype = 'Cluster') +
  
  # SCALES
  
  scale_color_manual(values = c('#440154', '#3b528b', '#5ec962')) +
  
  scale_x_discrete(
    labels = 
      c('Beliefs about Civilians', 
        'Help Seeking',
        'Purpose',
        'Regimentation',
        'Resentment')) +

  labs(title = 'Reintegration by Cluster', 
       x = 'Aspect of Reintegration', 
       y = 'Reintegration (mean item score)') +
  theme(axis.text = element_text(size = 11),
        text = element_text(size = 14))
  

profile_reintegration %>% print()

ggsave(filename = paste0('output/figures/profiles-reintegration-', clustering, '.jpg'),
  plot = profile_reintegration)

library(patchwork)
profile_reintegration + plot_profiles
  ggsave(filename = paste0('output/figures/profiles-identity-reintegration-', clustering, '.jpg'))


rm(profile_reintegration)

