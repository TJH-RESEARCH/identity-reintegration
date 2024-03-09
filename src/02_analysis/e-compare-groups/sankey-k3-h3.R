
library(networkD3) # this needs to be installed to plot in javascript



links <-
  data %>% 
  count(kmeans_cluster_3, hclust_cut_3) %>% 
  rename(source = 1, target = 2, value = 3) %>% 
  mutate(source = paste0('k_Means_3_group_', source),
         target = paste0('Hierarchical_3_group_', target)
    ) %>% 
  as.data.frame()
  

# Sankey Plot-------------------------------------------------------------------------




# From these flows we need to create a node data frame: it lists every entities involved in the flow
nodes <- data.frame(
  name=c(as.character(links$source), 
         as.character(links$target)) %>% unique()
)

# With networkD3, connection must be provided using id, not using real name like in the links dataframe.. So we need to reformat it.
links$IDsource <- match(links$source, nodes$name)-1 
links$IDtarget <- match(links$target, nodes$name)-1

# Make the Network
p <- sankeyNetwork(Links = links, Nodes = nodes,
                   Source = "IDsource", Target = "IDtarget",
                   Value = "value", NodeID = "name", 
                   sinksRight=FALSE)
p
 


