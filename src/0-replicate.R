# PACKAGES -----------------------------------------------------------
source(here::here('renv/activate.R'))
library(tidyverse)


# CONFIGURE --------------------------------------------------------
source(here::here('src/01_config/create-output-folders.R'))
source(here::here('src/01_config/functions/function-append-results.R'))


# DATA SET MANAGEMENT -----------------------------------------------------------
## Clean the data
data <- read_csv(here::here('data/data_main.csv'))


# DESCRIBE SAMPLE ----------------------------------------------------------
source(here::here('src/02_analysis/a-describe-sample/sample-size.R'))
source(here::here('src/02_analysis/a-describe-sample/demographics.R'))
source(here::here('src/02_analysis/a-describe-sample/military-demographics.R'))


# GRAPHIC MODELLING --------------------------------------------------------
source(here::here('src/02_analysis/b-graphic-modelling/draw-dags.R'))


# EXAMINE MEASURES ----------------------------------------------------
## Reintegration
source(here::here('src/02_analysis/c-examine-measures/cfa-mcarm.R'))


## Military Identity 
source(here::here('src/02_analysis/c-examine-measures/cfa-wis.R'))


# CLUSTER ANALYSIS --------------------------------------------------------
source(here::here('src/02_analysis/d-create-groups/kmeans.R'))


# CHOOSE GROUPING ---------------------------------------------------------
## Set K-Means 3-cluster as the latent group for the main data analysis
data <- data %>% mutate(latent_group = kmeans_cluster_3)


# DESCRIBE CLUSTERS -------------------------------------------------------
source(here::here('src/02_analysis/e-describe-groups/visualize-profiles.R'))

## Rename the groups for interpretation
data <-
  data %>% 
  mutate(
    latent_group = 
      case_when(latent_group == 1 ~ 'Lower Identity',
                latent_group == 3 ~ 'Medium Identity',
                latent_group == 2 ~ 'Higher Identity')
  ) %>% 
  # refactor reference level
  mutate(latent_group = 
           factor(latent_group, 
                  levels = c('Medium Identity', 'Lower Identity', 'Higher Identity'))
         )


source(here::here('src/02_analysis/e-describe-groups/differences-identity.R'))
source(here::here('src/02_analysis/e-describe-groups/test-differences-identity.R'))

source(here::here('src/02_analysis/e-describe-groups/differences-military-experiences.R'))
source(here::here('src/02_analysis/e-describe-groups/differences-reintegration.R'))

# EXAMINE VARIABLES -------------------------------------------------------
## Descriptive Statistics
source(here::here('src/02_analysis/f-examine-variables/descriptive-continuous.R'))


## Visualizations
source(here::here('src/02_analysis/f-examine-variables/plot-pairs.R'))
source(here::here('src/02_analysis/f-examine-variables/plot-hypotheses.R'))


# SPECIFY MODELS ----------------------------------------------------
source(here::here('src/02_analysis/g-modelling/fit-models.R'))
source(here::here('src/02_analysis/g-modelling/model-diagnostics.R'))
source(here::here('src/02_analysis/g-modelling/calculate-robust-se.R'))


# INTERPRET MODELS --------------------------------------------------------
source(here::here('src/02_analysis/h-interpret-results/make-results-tables-bivariate.R'))
source(here::here('src/02_analysis/h-interpret-results/make-results-tables-full.R'))
source(here::here('src/02_analysis/h-interpret-results/make-results-tables-mcarm.R'))
source(here::here('src/02_analysis/h-interpret-results/visualize-coefficients.R'))
source(here::here('src/02_analysis/h-interpret-results/visualize-profiles-reintegration.R'))


# END ---------------------------------------------------------------------
# Save Session Info
source(here::here('src/01_config/session-info.R'))

message('
        
        
        
        Replication complete. Check the output folder for results. 
        
        To cite this research:
        
        Hodges, T.J. (2024, forthcoming). Is Military Identity Helpful or Hurtful in Civilian Life? Comparing Reintegration and Adjustment by Latent Groups of Military Identity.
        
        

        ')
