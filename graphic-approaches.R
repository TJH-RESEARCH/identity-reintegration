
## Elbow method
(plot_elbow <-  
  fviz_nbclust(data_cluster_wis, kmeans, method = "wss") +
  geom_vline(xintercept = 3, linetype = 2) +
  labs(
    title = "The elbow method is a little ambiguous",
    subtitle = "But 3 appears to be the elbow"
  )
)

ggsave(plot = plot_elbow, path = here::here('output/figures'), filename = 'elbow_plot.jpg')


## Silhouette method
(plot_silhouette <-
    fviz_nbclust(data_cluster_wis, kmeans, method = "silhouette")+
    labs(title = "Silouette suggests 2 clusters")
)

ggsave(plot = plot_silhouette,path = here::here('output/figures'), filename = 'silhouette_plot.jpg')


## Gap statistic
plot_gap_stat <-
  fviz_nbclust(data_cluster_wis, 
               kmeans, 
               nstart = 25,  
               print.summary = TRUE, 
               method = "gap_stat", 
               nboot = 500)  +
  labs(title = "Gap stat doesn't find a solution",
       subtitle = "The greatest gap stat is for 1 cluster")

ggsave(plot = plot_gap_stat,path = here::here('output/figures'), filename = 'gap_stat_plot.jpg')

