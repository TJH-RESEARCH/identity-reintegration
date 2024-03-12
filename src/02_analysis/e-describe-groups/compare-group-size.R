

# Out of the latent grouping stage emerged 4 potentials:
# One hierarchical cluster cut at 3, two k-means clusters with a 2-cluster and 
# 3-cluster solution, and one latent profile analysis with a 2-class solution.


data %>% count(hclust_cut_3)     %>% mutate(perc = n / sum(n) * 100) # Maybe group is still too imbalanced
data %>% count(kmeans_cluster_2) %>% mutate(perc = n / sum(n) * 100)
data %>% count(kmeans_cluster_3) %>% mutate(perc = n / sum(n) * 100)
data %>% count(lpa)              %>% mutate(perc = n / sum(n) * 100)



