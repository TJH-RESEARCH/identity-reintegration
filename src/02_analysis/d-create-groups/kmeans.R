
library(factoextra)
library(NbClust)


set.seed(10001) # to reproduce

# Select WIS Data --------------------------------------------------------------
data_cluster_wis <- 
  data %>% 
  select(starts_with('wis') & ends_with('total') & !wis_total) %>% 
  scale()


# Determine the best fitting number of clusters --------------------------------

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





# -------------------------------------------------------------------------
results_kmeans <- 
  NbClust(data = data_cluster_wis, 
        diss = NULL, 
        distance = "euclidean",
        min.nc = 2, 
        max.nc = 15, 
        method = 'kmeans',
        index = 'alllong')

results_kmeans$All.index %>% as.data.frame() %>% tibble() %>% slice(2,3)
results_kmeans$Best.nc

# Limit the number of clusters to compare head-to-head 2 and 3 group solution
results_kmeans_limited = 
  NbClust(data = data_cluster_wis, 
            diss = NULL, 
            distance = "euclidean",
            min.nc = 2, 
            max.nc = 4, 
            method = 'kmeans',
            index = 'alllong')

results_kmeans_limited$All.index
results_kmeans_limited$Best.nc[1,] %>% tibble() %>% rename(best = 1) %>% as.data.frame() %>%  tibble()
results_kmeans_limited$Best.nc[1,] %>% tibble() %>% rename(best = 1) %>% as.data.frame() %>%  tibble() %>% count(best)


temp <- results_kmeans_limited$All.index[1:2,] %>% 
  as.data.frame() %>% t() %>% as.data.frame()

results_kmeans_table <- 
temp %>% tibble() %>% 
  mutate(name = temp %>% rownames(),
         best = results_kmeans_limited$Best.nc[1,]) %>% view()
  mutate(best = ifelse(name == 'Gamma', 3, best), # gamma max
         best = ifelse(name == 'Gplus', 3, best), # Gplus min
         best = ifelse(name == 'SDbw', 3, best), # SDbw min
         best = ifelse(name == 'trcovw', 4, best) # the largest difference between different levels. So if 2 has 100, 3 is 50, and 4 is 40, then the first diff is 50 and the second is ten. 3 is best solution. with only 2, there is no way to solve expect it favors the later. 
         )

results_kmeans_table %>% write_csv('output/stats/kmeans-fit.csv')





# group balance ------------------------------------------
results_kmeans_2 <- kmeans(data_cluster_wis, centers = 2)
results_kmeans_3 <- kmeans(data_cluster_wis, centers = 3)


data <-
  data %>% 
  mutate(kmeans_cluster_2 = factor(results_kmeans_2$cluster), 
         kmeans_cluster_3 = factor(results_kmeans_3$cluster)) 

data %>% count(kmeans_cluster_2) %>% print()
data %>% count(kmeans_cluster_3) %>% print()


