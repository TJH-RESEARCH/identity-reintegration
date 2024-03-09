

# Packages ----------------------------------------------------------------
library(sandwich)
library(lmtest)


# MCARM Total ------------------------------------------------------------------------
(coeftest_mcarm_1 <-lmtest::coeftest(model_mcarm_1, sandwich::vcovHC(model_mcarm_1)))
(coeftest_mcarm_2 <-lmtest::coeftest(model_mcarm_2, sandwich::vcovHC(model_mcarm_2)))


# Help Seeking ------------------------------------------------------------
(coeftest_help_seeking_1 <-lmtest::coeftest(model_help_seeking_1, sandwich::vcovHC(model_help_seeking_1)))
(coeftest_help_seeking_2 <-lmtest::coeftest(model_help_seeking_2, sandwich::vcovHC(model_help_seeking_2)))


# Purpose & Connection ----------------------------------------------------
(coeftest_purpose_1 <-lmtest::coeftest(model_purpose_1, sandwich::vcovHC(model_purpose_1)))
(coeftest_purpose_2 <-lmtest::coeftest(model_purpose_2, sandwich::vcovHC(model_purpose_2)))


# Regimentation -----------------------------------------------------------
(coeftest_regiment_1 <-lmtest::coeftest(model_regiment_1, sandwich::vcovHC(model_regiment_1)))
(coeftest_regiment_2 <-lmtest::coeftest(model_regiment_2, sandwich::vcovHC(model_regiment_2)))


# Resentment --------------------------------------------------------------
(coeftest_resent_1 <-lmtest::coeftest(model_resent_1, sandwich::vcovHC(model_resent_1)))
(coeftest_resent_2 <-lmtest::coeftest(model_resent_2, sandwich::vcovHC(model_resent_2)))

# Beliefs About Civilians -------------------------------------------------
(coeftest_civilians_1 <-lmtest::coeftest(model_civilians_1, sandwich::vcovHC(model_civilians_1)))
(coeftest_civilians_2 <-lmtest::coeftest(model_civilians_2, sandwich::vcovHC(model_civilians_2)))



