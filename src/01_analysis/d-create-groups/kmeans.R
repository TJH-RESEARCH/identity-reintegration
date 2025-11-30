# Load Packages ----------------------------------------------------------------
library(factoextra)
library(NbClust)


# Set Seed for Pseudo-random Number Generator ----------------------------------
set.seed(10001) # to ensure reproducibility


# Select WIS Data and Standardize it -------------------------------------------
data_1_scaled <- 
  data_1 %>% 
  select(starts_with('wis') & ends_with('total') & !wis_total) %>% 
  scale()

data_2_scaled <- 
  data_2 %>% 
  select(starts_with('wis') & ends_with('total') & !wis_total) %>% 
  scale()


# Determine the best fitting number of clusters --------------------------------

## Sample 1
kmeans_1 <- 
  NbClust(data = data_1_scaled, 
        diss = NULL, 
        distance = "euclidean",
        min.nc = 2, 
        max.nc = 10, 
        method = 'kmeans',
        index = 'alllong')

## Sample 2
kmeans_2 <- 
  NbClust(data = data_2_scaled, 
          diss = NULL, 
          distance = "euclidean",
          min.nc = 2, 
          max.nc = 10, 
          method = 'kmeans',
          index = 'alllong')


# Run the k-means ---------------------------------------------------------
kmeans_1_k2 <- kmeans(data_1_scaled, centers = 2)
kmeans_1_k3 <- kmeans(data_1_scaled, centers = 3)
kmeans_2_k2 <- kmeans(data_2_scaled, centers = 2)
kmeans_2_k3 <- kmeans(data_2_scaled, centers = 3)


# Add solutions to data ---------------------------------------------------
data_1 <-
  data_1 %>% 
  mutate(cluster_k2 = factor(kmeans_1_k2$cluster), 
         cluster_k3 = factor(kmeans_1_k3$cluster)) 

data_2 <-
  data_2 %>% 
  mutate(cluster_k2 = factor(kmeans_2_k2$cluster), 
         cluster_k3 = factor(kmeans_2_k3$cluster)) 





