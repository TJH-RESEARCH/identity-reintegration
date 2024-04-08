
# ANALYZE REGRESSION DIAGNOSTICS
## Check residuals of individual regressions.


# Load functions ----------------------------------------------------------
source(here::here('src/01_config/functions/function-plot-lm.R'))

# Diagnostics -------------------------------------------------------------
plot_lm(model_mcarm_1)
ggsave(filename = paste0('output/figures/diagnostic-plots/diagnostics-mcarm-1.jpg'))

plot_lm(model_mcarm_2)
ggsave(filename = paste0('output/figures/diagnostic-plots/diagnostics-mcarm-2.jpg'))

plot_lm(model_civilians_1)
ggsave(filename = paste0('output/figures/diagnostic-plots/diagnostics-civilians-1.jpg'))

plot_lm(model_civilians_2)
ggsave(filename = paste0('output/figures/diagnostic-plots/diagnostics-civilians-2.jpg'))

plot_lm(model_purpose_1)
ggsave(filename = paste0('output/figures/diagnostic-plots/diagnostics-purpose-1.jpg'))

plot_lm(model_purpose_2)
ggsave(filename = paste0('output/figures/diagnostic-plots/diagnostics-purpose-2.jpg'))

plot_lm(model_resent_1)
ggsave(filename = paste0('output/figures/diagnostic-plots/diagnostics-resent-1.jpg'))

plot_lm(model_resent_2) 
ggsave(filename = paste0('output/figures/diagnostic-plots/diagnostics-resent-2.jpg'))

plot_lm(model_regiment_1) 
ggsave(filename = paste0('output/figures/diagnostic-plots/diagnostics-regiment-1.jpg'))

plot_lm(model_regiment_2)
ggsave(filename = paste0('output/figures/diagnostic-plots/diagnostics-regiment-2.jpg'))

plot_lm(model_help_seeking_1)
ggsave(filename = paste0('output/figures/diagnostic-plots/diagnostics-help-seeking-1.jpg'))

plot_lm(model_help_seeking_2)
ggsave(filename = paste0('output/figures/diagnostic-plots/diagnostics-help-seeking-2.jpg'))

# Clean up
rm(plot_lm)

