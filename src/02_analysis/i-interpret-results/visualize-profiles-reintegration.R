library(viridis)

profile_reintegration <-
  data %>% 
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
         latent_group) %>% 
  group_by(latent_group) %>% 
  summarise(across(everything(), ~ mean(.x))) %>% 
  pivot_longer(!latent_group) %>% 
  ggplot(
    aes(
      x     = name, 
      y     = value, 
      color = latent_group,
      group = latent_group),
    alpha = .8) + 
  geom_line(
    aes(
      linetype = latent_group, 
      color    = latent_group),
    alpha = .8) +
  geom_point(
    aes(
      shape = latent_group,
      color = latent_group),
    size  = 4,
    alpha = .8) + 
  
  # THEME
  theme_classic() +
  
  theme(axis.text.x = 
          element_text(
            angle = -30, 
            vjust =   1, 
            hjust =   0)) +
  
  labs(color = 'Latent Group',
       shape = 'Latent Group',
       linetype = 'Latent Group') +
  
  # SCALES
  scale_color_viridis(option = 'C', discrete = TRUE) +
  
  scale_x_discrete(
    labels = 
      c('Beliefs About Civilians', 
        'Help Seeking',
        'Purpose',
        'Regimentation',
        'Resentment')) +

  labs(title = 'Reintegration by Latent Groups', 
       x = 'Aspect of Reintegration', 
       y = 'Adjustment (mean item score)')
  

profile_reintegration %>% print()

ggsave(filename = paste0('output/figures/profiles-reintegration-', analysis, '.jpg'),
  plot = profile_reintegration)

library(patchwork)
plot_profiles / profile_reintegration
  ggsave(filename = paste0('output/figures/profiles-identity-reintegration-', analysis, '.jpg'))


rm(profile_reintegration)