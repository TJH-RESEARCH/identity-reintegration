library(viridis)

plot_profiles <-
  data %>% 
  mutate(wis_skills_total = wis_skills_total / 3,
         wis_centrality_total = wis_centrality_total / 4,
         wis_connection_total = wis_connection_total / 3,
         wis_family_total = wis_family_total / 3,
         wis_interdependent_total = wis_interdependent_total / 7,
         wis_private_regard_total = wis_private_regard_total / 7,
         wis_public_regard_total = wis_public_regard_total / 4) %>% 
  select(wis_skills_total,
         wis_centrality_total,
         wis_connection_total,
         wis_family_total,
         wis_interdependent_total,
         wis_private_regard_total,
         wis_public_regard_total,
         latent_group) %>% 
  group_by(latent_group) %>% 
  mutate(latent_group = factor(latent_group)) %>% 
  summarise(across(everything(), ~ mean(.x))) %>% 
  pivot_longer(!latent_group) %>% 
  ggplot(
    aes(
      name, 
      value, 
      color = latent_group,
      group = latent_group)) + 
  geom_point(
    aes(
      shape = latent_group), 
    size = 4) + 
  geom_line(
    aes(
      linetype = latent_group)) +
  scale_color_viridis(option = 'C', discrete = TRUE) +
  theme_classic() +
  labs(title = paste0('Military Identity by Latent Groups'), 
       x = 'Aspect of Military Identity', 
       y = 'Strength of Identity (mean item score)') + 
  theme(axis.text.x = element_text(angle = -30, vjust = 1, hjust = 0)) +
  labs(color = 'Latent Group',
       shape = 'Latent Group',
       linetype = 'Latent Group') +
  scale_x_discrete(
  labels = c('Centrality', 
             'Connection',
             'Family',
             'Interdependence',
             'Private Regard',
             'Public Regard',
             'Skills')
  )

plot_profiles %>% print()

ggsave(plot = plot_profiles,
       filename = paste0('output/figures/profiles-identity-', analysis, '.jpg'))
 
#rm(plot_profiles)
