library(viridis)

data_1 <-
  data_1 %>% 
  mutate(wis_skills_mean = wis_skills_total / 3,
         wis_centrality_mean = wis_centrality_total / 4,
         wis_connection_mean = wis_connection_total / 3,
         wis_family_mean = wis_family_total / 3,
         wis_interdependent_mean = wis_interdependent_total / 7,
         wis_private_regard_mean = wis_private_regard_total / 7,
         wis_public_regard_mean = wis_public_regard_total / 4)

data_2 <-
  data_2 %>% 
  mutate(wis_skills_mean = wis_skills_total / 3,
         wis_centrality_mean = wis_centrality_total / 4,
         wis_connection_mean = wis_connection_total / 3,
         wis_family_mean = wis_family_total / 3,
         wis_interdependent_mean = wis_interdependent_total / 7,
         wis_private_regard_mean = wis_private_regard_total / 7,
         wis_public_regard_mean = wis_public_regard_total / 4)



# PLOT -------------------------------------------------------------------------
## Sample 1, 2-Cluster ---------------------------------------------------------
plot_identity_1_k2 <-
  data_1 %>% 
  select(wis_skills_mean, wis_centrality_mean, wis_connection_mean, wis_family_mean, wis_interdependent_mean, wis_private_regard_mean, wis_public_regard_mean,
         cluster_k2_label) %>% 
  group_by(cluster_k2_label) %>% 
  mutate(cluster_k2_label = factor(cluster_k2_label)) %>%
  summarise(across(everything(), ~ mean(.x))) %>% 
  pivot_longer(!cluster_k2_label) %>% 
  ggplot(aes(name, value, color = cluster_k2_label, group = cluster_k2_label)) + 
  geom_point(aes(shape = cluster_k2_label), size = 4) + 
  geom_line(aes(linetype = cluster_k2_label)) +
  scale_color_manual(values = c('#440154', '#3b528b', '#5ec962')) +
  #scale_color_viridis(option = 'C', discrete = TRUE) +
  theme_classic() +
  labs(title = 'Identity Clusters: Sample 1, K = 2', 
       x = 'Military Identity', 
       y = 'Mean') + 
  theme(axis.text.x = element_text(angle = -30, vjust = 1, hjust = 0)) +
  labs(color = 'Cluster',
       shape = 'Cluster',
       linetype = 'Cluster') +
  scale_x_discrete(labels = c('Centrality', 'Connection', 'Family', 'Interdependence', 'Private Regard', 'Public Regard', 'Skills')) +
  theme(axis.text = element_text(size = 11),
        text = element_text(size = 14),
        legend.position = c(.9,.9)
        )

plot_identity_1_k2 %>% print()

ggsave(plot = plot_identity_1_k2,
       filename = here::here('output/plot-identity-1-k2.jpg'),
       width = 8, height = 6)
 

## Sample 1, 3-Cluster
plot_identity_1_k3 <-
  data_1 %>% 
  select(wis_skills_mean, wis_centrality_mean, wis_connection_mean, wis_family_mean, wis_interdependent_mean, wis_private_regard_mean, wis_public_regard_mean,
         cluster_k3_label) %>% 
  group_by(cluster_k3_label) %>% 
  mutate(cluster_k3_label = factor(cluster_k3_label)) %>%
  summarise(across(everything(), ~ mean(.x))) %>% 
  pivot_longer(!cluster_k3_label) %>% 
  ggplot(aes(name, value, color = cluster_k3_label, group = cluster_k3_label)) + 
  geom_point(aes(shape = cluster_k3_label), size = 4) + 
  geom_line(aes(linetype = cluster_k3_label)) +
  scale_color_manual(values = c('#440154', '#3b528b', '#5ec962')) +
  #scale_color_viridis(option = 'C', discrete = TRUE) +
  theme_classic() +
  labs(title = 'Identity Clusters: Sample 1, K = 3', 
       x = 'Military Identity', 
       y = 'Mean') + 
  theme(axis.text.x = element_text(angle = -30, vjust = 1, hjust = 0)) +
  labs(color = 'Cluster',
       shape = 'Cluster',
       linetype = 'Cluster') +
  scale_x_discrete(labels = c('Centrality', 'Connection', 'Family', 'Interdependence', 'Private Regard', 'Public Regard', 'Skills')) +
  theme(axis.text = element_text(size = 11),
        text = element_text(size = 14),
        legend.position = c(.9,.907)
  )

plot_identity_1_k3 %>% print()

ggsave(plot = plot_identity_1_k3,
       filename = here::here('output/plot-identity-1-k3.jpg'),
       width = 8, height = 6)


## Sample 2, 2-Cluster ---------------------------------------------------------
plot_identity_2_k2 <-
  data_2 %>% 
  select(wis_skills_mean, wis_centrality_mean, wis_connection_mean, wis_family_mean, wis_interdependent_mean, wis_private_regard_mean, wis_public_regard_mean,
         cluster_k2_label) %>% 
  group_by(cluster_k2_label) %>% 
  mutate(cluster_k2_label = factor(cluster_k2_label)) %>%
  summarise(across(everything(), ~ mean(.x))) %>% 
  pivot_longer(!cluster_k2_label) %>% 
  ggplot(aes(name, value, color = cluster_k2_label, group = cluster_k2_label)) + 
  geom_point(aes(shape = cluster_k2_label), size = 4) + 
  geom_line(aes(linetype = cluster_k2_label)) +
  scale_color_manual(values = c('#440154', '#3b528b', '#5ec962')) +
  #scale_color_viridis(option = 'C', discrete = TRUE) +
  theme_classic() +
  labs(title = 'Identity Clusters: Sample 2, K = 2', 
       x = 'Military Identity', 
       y = 'Mean') + 
  theme(axis.text.x = element_text(angle = -30, vjust = 1, hjust = 0)) +
  labs(color = 'Cluster',
       shape = 'Cluster',
       linetype = 'Cluster') +
  scale_x_discrete(labels = c('Centrality', 'Connection', 'Family', 'Interdependence', 'Private Regard', 'Public Regard', 'Skills')) +
  theme(axis.text = element_text(size = 11),
        text = element_text(size = 14),
        legend.position = c(.9,.9)
  )

plot_identity_2_k2 %>% print()

ggsave(plot = plot_identity_2_k2,
       filename = here::here('output/plot-identity-2-k2.jpg'),
       width = 8, height = 6)


## Sample 2, 3-Cluster ---------------------------------------------------------
plot_identity_2_k3 <-
  data_2 %>% 
  select(wis_skills_mean, wis_centrality_mean, wis_connection_mean, wis_family_mean, wis_interdependent_mean, wis_private_regard_mean, wis_public_regard_mean,
         cluster_k3_label) %>% 
  group_by(cluster_k3_label) %>% 
  mutate(cluster_k3_label = factor(cluster_k3_label)) %>%
  summarise(across(everything(), ~ mean(.x))) %>% 
  pivot_longer(!cluster_k3_label) %>% 
  ggplot(aes(name, value, color = cluster_k3_label, group = cluster_k3_label)) + 
  geom_point(aes(shape = cluster_k3_label), size = 4) + 
  geom_line(aes(linetype = cluster_k3_label)) +
  scale_color_manual(values = c('#440154', '#3b528b', '#5ec962')) +
  #scale_color_viridis(option = 'C', discrete = TRUE) +
  theme_classic() +
  labs(title = 'Identity Clusters: Sample 2, K = 3', 
       x = 'Military Identity', 
       y = 'Mean') + 
  theme(axis.text.x = element_text(angle = -30, vjust = 1, hjust = 0)) +
  labs(color = 'Cluster', shape = 'Cluster', linetype = 'Cluster') +
  scale_x_discrete(labels = c('Centrality', 'Connection', 'Family', 'Interdependence', 'Private Regard', 'Public Regard', 'Skills')) +
  theme(axis.text = element_text(size = 11),
        text = element_text(size = 14),
        legend.position = c(.87,.2)
  )

plot_identity_2_k3 %>% print()

ggsave(plot = plot_identity_2_k3,
       filename = here::here('output/plot-identity-2-k3.jpg'),
       width = 8, height = 6)
