
library(factoextra)
library(NbClust)

# Select WIS Data ---------------------------------------------------------
data_cluster_wis <- 
  data %>% 
  select(starts_with('wis') & ends_with('total') & !wis_total) %>% 
  scale() 


# Hierarchical Clustering: -----------------------------------------

clusters <- hclust(dist(data_cluster_wis, method = "euclidean"))
plot(clusters)


# Determine the number of cuts ----------------------------------------
## Elbow method
fviz_nbclust(data_cluster_wis, 
             hcut, method = "wss") +
  geom_vline(xintercept = 3, linetype = 2)+
  labs(subtitle = "Hiearchical Clustering: Elbow method suggests 3")


## Silhouette method
fviz_nbclust(data_cluster_wis, hcut, method = "silhouette")+
  labs(subtitle = "Hiearchical Clustering: Silhouette method suggests 2")
### Silhouette says 2


## Gap statistic
set.seed(10001)
fviz_nbclust(data_cluster_wis, 
             hcut, 
             nstart = 25,  
             print.summary = T, 
             method = "gap_stat", 
             nboot = 500)  +
  labs(subtitle = "Hiearchical Clustering: Gap statistic method")
### Gap statistic fails to reject the null


# Compare hierarchical clusters using additional criteria ---------------------------
x = NbClust(data = data_cluster_wis, 
        diss = NULL, 
        distance = "euclidean",
        min.nc = 2, 
        max.nc = 15, 
        method = 'ward.D',
        index = 'all')
## ward.D suggests 2

# Compare kmeans clusters using additional criteria ---------------------------
NbClust(data = data_cluster_wis, 
        diss = NULL, 
        distance = "euclidean",
        min.nc = 2, 
        max.nc = 15, 
        method = 'ward.D2',
        index = 'all')
## ward.D2 suggests 3


# Compare kmeans clusters using additional criteria ---------------------------
NbClust(data = data_cluster_wis, 
        diss = NULL, 
        distance = "euclidean",
        min.nc = 2, 
        max.nc = 15, 
        method = 'single',
        index = 'all')
## Single suggests 2 or 3

# Compare kmeans clusters using additional criteria ---------------------------
NbClust(data = data_cluster_wis, 
        diss = NULL, 
        distance = "euclidean",
        min.nc = 2, 
        max.nc = 7, 
        method = 'complete',
        index = 'all')
## complete suggests 3

# Compare kmeans clusters using additional criteria ---------------------------
NbClust(data = data_cluster_wis, 
        diss = NULL, 
        distance = "euclidean",
        min.nc = 2, 
        max.nc = 7, 
        method = 'average',
        index = 'all')
## average suggests 2 or 3


# Let's see the sample size to find out if they are useful for the analysis:


clusters <- hclust(dist(data_cluster_wis, method = "euclidean"))


data <-
  data %>% 
  mutate(
    hclust_cut_2 = cutree(clusters, 2),
    hclust_cut_3 = cutree(clusters, 3)
  )


data %>% count(hclust_cut_2)
data %>% count(hclust_cut_3)

# 3 is more useful than 2 insofar as groups are more balanced
# But 4 cuts away at the smaller group instead of the bigger one, making it
# less useful. 

# That said, the hierarhical cut at 3 is what I will progress with. 

