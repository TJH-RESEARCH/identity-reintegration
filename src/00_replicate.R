# Load Packages ----------------------------------------------------------------
library(tidyverse)


# Import Data ------------------------------------------------------------------
data_1 <- read_csv(here::here('data/data_main_replicate_identity_reintegration.csv'))
data_2 <- read_csv(here::here('data/data-first-year-scholars-cleaned.csv'))


# Graphic Modelling ------------------------------------------------------------
source(here::here("src/draw-dags.R"))


# Describe the Sample ----------------------------------------------------------
## Sample Size
source(here::here("src/01_analysis/a-describe-sample/sample-size.R"))

## Demographics
source(here::here("src/01_analysis/a-describe-sample/helper-functions.R"))
source(here::here("src/01_analysis/a-describe-sample/demographics-1.R"))
source(here::here("src/01_analysis/a-describe-sample/demographics-2.R"))
source(here::here("src/01_analysis/a-describe-sample/create-demographic-table.R"))


# Examine Measures -------------------------------------------------------------
source(here::here("src/01_analysis/c-examine-measures/cfa-mcarm.R"))
source(here::here("src/01_analysis/c-examine-measures/cfa-wis.R"))
source(here::here("src/01_analysis/c-examine-measures/combine-reliability.R"))


# Create Latent Groups ---------------------------------------------------------
source(here::here("src/01_analysis/d-create-groups/kmeans.R"))
source(here::here("src/01_analysis/d-create-groups/compare-solutions.R"))
source(here::here("src/01_analysis/d-create-groups/label-clusters.R"))




