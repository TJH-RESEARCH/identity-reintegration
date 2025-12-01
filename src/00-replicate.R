# Load Packages ----------------------------------------------------------------
library(tidyverse)


# Import Data ------------------------------------------------------------------
data_1 <- read_csv(here::here('data/data_main_replicate_identity_reintegration.csv'))
data_2 <- read_csv(here::here('data/data-first-year-scholars-cleaned.csv'))


# Graphic Modelling ------------------------------------------------------------
source(here::here("src/01-draw-dags.R"))


# Describe the Sample ----------------------------------------------------------
## Sample Size
source(here::here("src/02-describe-sample/sample-size.R"))

## Demographics
source(here::here("src/02-describe-sample/helper-functions.R"))
source(here::here("src/02-describe-sample/demographics-1.R"))
source(here::here("src/02-describe-sample/demographics-2.R"))
source(here::here("src/02-describe-sample/create-demographic-table.R"))


# Examine Measures -------------------------------------------------------------
source(here::here("src/03-examine-measures/cfa-mcarm.R"))
source(here::here("src/03-examine-measures/cfa-wis.R"))
source(here::here("src/03-examine-measures/combine-reliability.R"))


# Examine Variables -------------------------------------------------------



# Modelling ---------------------------------------------------------------



# Save session info -------------------------------------------------------
source(here::here("src/session-info.R"))



