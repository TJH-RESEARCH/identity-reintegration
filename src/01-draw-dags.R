

# Library -----------------------------------------------------------------
library(dagitty)
library(ggdag)

data_1 %>% names()
data_2 %>% names()

# 1. Likely Antecedents ---------------------------------------------------------------
dag_1 <- 
  
  dagify('Reint' ~ 'ID' + 'Race' + 'Gender' + 'Branch' + 'Enlisted' + 'Era' + 'Age' + 'YrsSep',
         'ID' ~ 'ID' + 'Race' + 'Gender' + 'Branch' + 'Enlisted' + 'Era' + 'Age' + 'YrsSep',
         # Enlisted/Officer: Officers need a college degree. Socioeconomic status has been associated with getting a degree, as well as race and gender
         'Enlisted' ~ 'Race' + 'Gender', 
         # Branch: different branches attract different types of people to join
         'Branch' ~ 'Race' + 'Gender', 
         # Era: Different groups/genders may have varied over time in their propensity to join the military 
         'Era' ~ 'Race' + 'Gender', 
         exposure = 'ID', 
         outcome = 'Reint')


ggdag::tidy_dagitty(dag_1)

coordinates(dag_1) <- list(
  x = c(ID = 0, Era = .3, Race = .35, Enlisted = .5, Branch = .7, YrsSep = .4, Age = .6, Gender = .65, Reint = 1),
  y = c(
    Reint = 1,
    ID = 1,
    Race = 1.125,
    Gender = 1.125,
    Enlisted = 1.075,
    Era = 1.075,
    Branch = 1.075,
    Age = 1.03,
    YrsSep = 1.03
  )
)


(plot_dag_1 <-
    ggdag(dag_1) +
    geom_dag_point(fill = 'white', color = 'white') +
    geom_dag_edges() +
    geom_dag_text(color = 'black', size = 5) +
    theme_dag() +
    labs(title = "DAG 1: Obvious Antecedents")
)

ggsave(here::here('output/dag_1.jpeg'),
       plot = plot_dag_1,
       width = 6, 
       height = 6)

adjustmentSets(dag_1)

(plot_dag_1_adj_set <- 
    ggdag_adjustment_set(dag_1) + 
    theme_dag() +
    labs(title = 'Graphical Model')
)

ggsave(here::here('output/dag_1_adj.jpeg'),
       width = 6, 
       height = 6)


# 2. Possible Antecedents  ---------------------------------------------------------------
# Modeled as unidirectional antecedents
dag_2 <- 
  
  dagify('Reint' ~ 'ID' + 'Race' + 'Gender' + 'Branch' + 'Enlisted' + 'Era' + 'Age' + 'YrsSep',
         'ID' ~ 'ID' + 'Race' + 'Gender' + 'Branch' + 'Enlisted' + 'Era' + 'Age' + 'YrsSep',
         'Enlisted' ~ 'Race' + 'Gender', 
         'Branch' ~ 'Race' + 'Gender', 
         'Era' ~ 'Race' + 'Gender', 
         
         'Reint' ~ 'Deploys' + 'Combat' + 'YrsServ' + 'Needs',
         'ID' ~ 'Deploys' + 'Combat' + 'YrsServ' + 'Needs',
         exposure = 'ID', 
         outcome = 'Reint')


ggdag::tidy_dagitty(dag_2)

coordinates(dag_2) <- list(
  x = c(ID = 0, Era = .3, Race = .35, Enlisted = .5, 
        Branch = .7, YrsSep = .4, Age = .6, 
        Gender = .65, Reint = 1,
        Deploys = .65, YrsServ = .35, Needs = .5, Combat = .5
        ),
  y = c(
    Reint = 1,
    ID = 1,
    Race = 1.125,
    Gender = 1.125,
    Enlisted = 1.075,
    Era = 1.075,
    Branch = 1.075,
    Age = 1.03,
    YrsSep = 1.03,
    Deploys = .97, YrsServ = .97, Needs = .95, Combat = .95
  )
)


(plot_dag_2 <-
    ggdag(dag_2) +
    geom_dag_point(fill = 'white', color = 'white') +
    geom_dag_edges() +
    geom_dag_text(color = 'black', size = 5) +
    theme_dag() +
    labs(title = "DAG 2: Potential Antecedents Modeled Unidirectionally")
)

ggsave(here::here('output/dag_2.jpeg'),
       plot = plot_dag_2,
       width = 6, 
       height = 6)

adjustmentSets(dag_2)

(plot_dag_2_adj_set <- 
    ggdag_adjustment_set(dag_2) + 
    theme_dag() +
    labs(title = 'Graphical Model')
)

ggsave(here::here('output/dag_2_adj.jpeg'),
       width = 6, 
       height = 6)



# 3. Possible Antecedents  ---------------------------------------------------------------
# Modeled bidirectionally
dag_3 <- 
  
  dagify('Reint' ~ 'ID' + 'Race' + 'Gender' + 'Branch' + 'Enlisted' + 'Era' + 'Age' + 'YrsSep',
         'ID' ~ 'ID' + 'Race' + 'Gender' + 'Branch' + 'Enlisted' + 'Era' + 'Age' + 'YrsSep',
         'Enlisted' ~ 'Race' + 'Gender', 
         'Branch' ~ 'Race' + 'Gender', 
         'Era' ~ 'Race' + 'Gender', 
         
         'Reint' ~~ 'Deploys' + 'Combat' + 'YrsServ' + 'Needs',
         'ID' ~~ 'Deploys' + 'Combat' + 'YrsServ' + 'Needs',
         exposure = 'ID', 
         outcome = 'Reint')


ggdag::tidy_dagitty(dag_3)

coordinates(dag_3) <- list(
  x = c(ID = 0, Era = .3, Race = .35, Enlisted = .5, 
        Branch = .7, YrsSep = .4, Age = .6, 
        Gender = .65, Reint = 1,
        Deploys = .65, YrsServ = .35, Needs = .5, Combat = .5
  ),
  y = c(
    Reint = 1,
    ID = 1,
    Race = 1.125,
    Gender = 1.125,
    Enlisted = 1.075,
    Era = 1.075,
    Branch = 1.075,
    Age = 1.03,
    YrsSep = 1.03,
    Deploys = .97, YrsServ = .97, Needs = .95, Combat = .95
  )
)


(plot_dag_3 <-
    ggdag(dag_3) +
    geom_dag_point(fill = 'white', color = 'white') +
    geom_dag_edges() +
    geom_dag_text(color = 'black', size = 5) +
    theme_dag() +
    labs(title = "DAG 3: Potential Antecedents Modeled Bidirectionally")
)

ggsave(here::here('output/dag_3.jpeg'),
       plot = plot_dag_3,
       width = 6, 
       height = 6)

adjustmentSets(dag_3)

(plot_dag_3_adj_set <- 
    ggdag_adjustment_set(dag_3) + 
    theme_dag() +
    labs(title = 'Graphical Model')
)

ggsave(here::here('output/dag_3_adj.jpeg'),
       width = 6, 
       height = 6)




# 4. Downstream Effects  ---------------------------------------------------------------
# The DAG model will never say to adjust for these, but just to demonstrate that:
dag_4 <- 
  
  dagify('Reint' ~ 'ID' + 'Race' + 'Gender' + 'Branch' + 'Enlisted' + 'Era' + 'Age' + 'YrsSep',
         'ID' ~ 'ID' + 'Race' + 'Gender' + 'Branch' + 'Enlisted' + 'Era' + 'Age' + 'YrsSep',
         'Enlisted' ~ 'Race' + 'Gender', 
         'Branch' ~ 'Race' + 'Gender', 
         'Era' ~ 'Race' + 'Gender', 
         
         'Reint' ~~ 'Deploys' + 'Combat' + 'YrsServ' + 'Needs',
         'ID' ~~ 'Deploys' + 'Combat' + 'YrsServ' + 'Needs',
         
         'Marital' ~ 'Reint',
         'Edu' ~ 'Reint',
         'Employ' ~ 'Reint',
         
         exposure = 'ID', 
         outcome = 'Reint')


ggdag::tidy_dagitty(dag_4)

coordinates(dag_4) <- list(
  x = c(ID = 0, Era = .3, Race = .35, Enlisted = .5, 
        Branch = .7, YrsSep = .4, Age = .6, 
        Gender = .65, Reint = 1,
        Deploys = .65, YrsServ = .35, Needs = .5, Combat = .5,
        Marital = 1.1, Edu = 1.1, Employ = 1.1
  ),
  y = c(
    Reint = 1,
    ID = 1,
    Race = 1.125,
    Gender = 1.125,
    Enlisted = 1.075,
    Era = 1.075,
    Branch = 1.075,
    Age = 1.03,
    YrsSep = 1.03,
    Deploys = .97, YrsServ = .97, Needs = .95, Combat = .95,
    Marital = 1.03, Edu = 1, Employ = .97
  )
)


(plot_dag_4 <-
    ggdag(dag_4) +
    geom_dag_point(fill = 'white', color = 'white') +
    geom_dag_edges() +
    geom_dag_text(color = 'black', size = 5) +
    theme_dag() +
    labs(title = "DAG 4: Downstream Effects")
)

ggsave(here::here('output/dag_4.jpeg'),
       plot = plot_dag_4,
       width = 6, 
       height = 6)

adjustmentSets(dag_4)

(plot_dag_4_adj_set <- 
    ggdag_adjustment_set(dag_4) + 
    theme_dag() +
    labs(title = 'Graphical Model')
)

ggsave(here::here('output/dag_4_adj.jpeg'),
       width = 6, 
       height = 6)











# Can we adjust for unmet needs without activating backdoor paths? --------
ggdag_adjust(dag_3,var = 'Needs')

ggdag_adjust(dag_3,var = c('Branch', 
                           'Combat', 
                           'Deploy', 
                           'Era', 
                           'Officer',
                           'Race',
                           'Gender'))


ggdag_adjust(dag_3,var = c('Branch', 
                           'Combat', 
                           'Deploy', 
                           'Era', 
                           'Officer',
                           'Race',
                           'Gender',
                           'Needs'))
## No. If years of service causes identity, 
# and years of service also heightens risk for disability
# and disability is related to unmet needs, 
# Then adjusting the model for unmet needs introduces spurious association. 



