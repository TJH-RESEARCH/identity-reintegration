
library(factoextra)
library(NbClust)

set.seed(10001)

# Select WIS Data ---------------------------------------------------------
data_cluster_wis <- 
  data %>% 
  select(starts_with('wis') & ends_with('total') & !wis_total) %>% 
  scale()


# Determine the number of clusters ----------------------------------------


# Elbow method
fviz_nbclust(data_cluster_wis, kmeans, method = "wss") +
    geom_vline(xintercept = 3, linetype = 2)+
  labs(subtitle = "k-Means Clustering: Elbow method suggests 3-cluster solution")


# Silhouette method
fviz_nbclust(data_cluster_wis, kmeans, method = "silhouette")+
  labs(subtitle = "k-Means Clustering: Silhouette method suggests 2-cluster solution")


# Gap statistic
fviz_nbclust(data_cluster_wis, 
             kmeans, 
             nstart = 25,  
             print.summary = T, 
             method = "gap_stat", 
             nboot = 500)  +
  labs(subtitle = "k-Means Clustering: Gap statistic method")
## Gap statistic suggests 1 cluster....which isn't really a cluster now is it
## Basically, this is an inability to reject the null hypo that the data 
## clusters into latent groups. 


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

temp <- results_kmeans_limited$All.index[1:2,] %>% 
  as.data.frame() %>% t() %>% as.data.frame()

results_clusters_best <- 
temp %>% tibble() %>% 
  mutate(name = temp %>% rownames(),
         best = results_kmeans_limited$Best.nc[1,]) %>% 
  mutate(best = ifelse(name == 'Gamma', 3, best), # gamma max
         best = ifelse(name == 'Gplus', 3, best), # Gplus min
         best = ifelse(name == 'SDbw', 3, best), # SDbw min
         best = ifelse(name == 'trcovw', 4, best) # the largest difference between different levels. So if 2 has 100, 3 is 50, and 4 is 40, then the first diff is 50 and the second is ten. 3 is best solution. with only 2, there is no way to solve expect it favors the later. 
         )

results_clusters_best %>% write_csv(here::here('output/'))

# Looks like either 2 or 3 group is the best, but not unanimously.
# Similarly, the 5 best indices in a simulation study are:
# Beale, Ch, Duda, Cindex, and Gamma, according to the nbclust article; 
# (Charrad et al., 2014).
# again, 2 is favored to 3 clusters by three of five measures -- not unanimous

results_kmeans_table <-
results_kmeans$All.index %>% 
  as.data.frame() %>% 
  tibble() %>% 
  slice(1:2) %>% 
  mutate(k = c('2','3'))
results_kmeans_table %>% print()    

results_kmeans_table %>% write_csv('output/stats/kmeans-fit.csv')


# Let's see the sample size to 
# find out if they are useful for the analysis:




# what are the n's group balance ------------------------------------------

results_kmeans_2 <- kmeans(data_cluster_wis, centers = 2)
results_kmeans_3 <- kmeans(data_cluster_wis, centers = 3)


data <-
  data %>% 
  mutate(kmeans_cluster_2 = factor(results_kmeans_2$cluster), 
         kmeans_cluster_3 = factor(results_kmeans_3$cluster)) 

data %>% count(kmeans_cluster_2)
data %>% count(kmeans_cluster_3)


# Nice. Either one looks useful for the analysis. 

