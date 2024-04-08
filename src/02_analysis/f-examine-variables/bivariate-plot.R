
data %>% 
  ggplot(aes(wis_centrality_total, 
             wis_private_regard_total,
             color = kmeans_cluster_3,
             alpha = .5
  )) +
  geom_point(position = 'jitter')

