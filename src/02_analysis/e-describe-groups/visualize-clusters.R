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
         cluster) %>% 
  group_by(cluster) %>% 
  mutate(cluster = factor(cluster)) %>%
  summarise(across(everything(), ~ mean(.x))) %>% 
  pivot_longer(!cluster) %>% 
  ggplot(
    aes(
      name, 
      value, 
      color = cluster,
      group = cluster)) + 
  geom_point(
    aes(
      shape = cluster), 
    size = 4) + 
  geom_line(
    aes(
      linetype = cluster)) +
  scale_color_manual(values = c('#440154', '#3b528b', '#5ec962')) +
  #scale_color_viridis(option = 'C', discrete = TRUE) +
  theme_classic() +
  labs(title = paste0('Military Identity by Latent Groups'), 
       x = 'Aspect of Military Identity', 
       y = 'Identity (mean item score)') + 
  theme(axis.text.x = element_text(angle = -30, vjust = 1, hjust = 0)) +
  labs(color = 'Cluster',
       shape = 'Cluster',
       linetype = 'Cluster') +
  scale_x_discrete(
  labels = c('Centrality', 
             'Connection',
             'Family',
             'Interdependence',
             'Private Regard',
             'Public Regard',
             'Skills')
  ) +
  theme(axis.text = element_text(size = 11),
        text = element_text(size = 14))

plot_profiles %>% print()

ggsave(plot = plot_profiles,
       filename = paste0('output/figures/profiles-identity-', clustering, '.jpg'))
 
#rm(plot_profiles)
