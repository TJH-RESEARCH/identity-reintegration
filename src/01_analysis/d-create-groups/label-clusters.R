# Sample 1 ----------------------------------------------------------------
data_1 <-
  data_1 %>% 
  mutate(cluster_k2_label =
           factor(cluster_k2, 
                  levels = c(1,2),
                  labels = c('Lower Identity', 'Higher Identity')
                  ),
         cluster_k3_label =
           factor(cluster_k3, 
                  levels = c(2,1,3),
                  labels = c('Lower Identity', 'Medium Identity',  'Higher Identity')
           )
         )


# Sample 2 ----------------------------------------------------------------
data_2 <-
  data_2 %>% 
  mutate(cluster_k2_label =
           factor(cluster_k2, 
                  levels = c(2,1),
                  labels = c('Lower Identity', 'Higher Identity')
           ),
         cluster_k3_label =
           factor(cluster_k3, 
                  levels = c(2,1,3),
                  labels = c('Lower Identity', 'Medium Identity',  'Higher Identity')
           )
  )

