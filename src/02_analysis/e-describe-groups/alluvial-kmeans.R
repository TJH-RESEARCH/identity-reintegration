
library(ggalluvial)
library(viridis)
library(viridisLite)

data %>% 
  mutate(kmeans_cluster_2 = factor(kmeans_cluster_2),
         kmeans_cluster_3 = factor(kmeans_cluster_3)) %>% 
  count(kmeans_cluster_2, 
        kmeans_cluster_3
  ) %>%  
  # ggalluvial::is_alluvia_form()
  ggplot(
    aes(y = n, 
        axis1 = kmeans_cluster_2, 
        axis2 = kmeans_cluster_3)) +
  geom_alluvium(
    aes(fill = kmeans_cluster_3), 
    color = 'black',
    width = 1/12) +
  geom_stratum(width = 1/12, fill = "white", color = "black") +
  geom_label(stat = "stratum", aes(label = after_stat(stratum))) +
  scale_x_discrete(limits = c("Two-Cluster", "Three-Cluster"), expand = c(.05, .05)) +
  scale_fill_viridis(name = '3-Cluster Grouping', discrete = TRUE, option = 'D') +
  #scale_fill_brewer(name = 'Hierarchical 3-Cluster ', type = "qual", palette = "Set2") +
  ggtitle("Consistency of Clusers") +
  theme_classic() +
  theme(legend.position = 'bottom')

