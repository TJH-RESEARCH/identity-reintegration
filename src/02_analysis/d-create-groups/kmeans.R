
library(factoextra)
library(NbClust)

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
set.seed(10001)
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
NbClust(data = data_cluster_wis, 
        diss = NULL, 
        distance = "euclidean",
        min.nc = 2, 
        max.nc = 15, 
        method = 'kmeans',
        index = 'all')

# Limit the number of clusters
NbClust(data = data_cluster_wis, 
        diss = NULL, 
        distance = "euclidean",
        min.nc = 2, 
        max.nc = 6, 
        method = 'kmeans',
        index = 'all')

# Limit the number of clusters to compare head-to-head 2 and 3 group solution
NbClust(data = data_cluster_wis, 
        diss = NULL, 
        distance = "euclidean",
        min.nc = 2, 
        max.nc = 4, 
        method = 'kmeans',
        index = 'all')

# Looks like either 2 or 3 group is the best, but not unanimously.
# Similarly, the 5 best indices in a simulation study are:
# Beale, Ch, Duda, Cindex, and Gamma, according to the nbclust article; 
# (Charrad et al., 2014).
# again, 2 is favored to 3 clusters by three of five measures -- not unanimous



# Let's see the sample size to 
# find out if they are useful for the analysis:




# what are the n's group balance ------------------------------------------
results_kmeans_2 <- kmeans(data_cluster_wis,centers = 2)
results_kmeans_3 <-kmeans(data_cluster_wis,centers = 3)



data <-
  data %>% 
  mutate(kmeans_cluster_2 = factor(results_kmeans_2$cluster), 
         kmeans_cluster_3 = factor(results_kmeans_3$cluster)) 

data %>% count(kmeans_cluster_2)
data %>% count(kmeans_cluster_3)

data %>% 
  ggplot(aes(wis_centrality_total, 
             wis_private_regard_total,
             color = kmeans_cluster_3,
             alpha = .5
             )) +
  geom_point(position = 'jitter')
  

# Nice. Either one looks useful for the analysis. 

