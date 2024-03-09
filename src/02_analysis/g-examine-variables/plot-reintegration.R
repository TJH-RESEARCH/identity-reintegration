# HISTOGRAM MORAL INJURY SYMPTOMS


ifelse(!exists('theme_fonts'), source(here::here('src/01_config/themes.R')), library(ggplot2))


plot_reintegration <-
  data %>% 
  ggplot(aes(mcarm_total)) +
  labs(x = 'Reintegration',
       y = 'Count', 
       title = 'Reintegration in a Sample of Veterans',
       subtitle = "",
       caption = 
         "Veterans were surveyed using the 21-item Military-Civilian Adjustment and Reintegration Measure.") +
  geom_histogram(
    fill = 'grey',
                 bins = 18, 
                 color = 'black',
                 linewidth = .3,
                 alpha = .2
                 #binwidth = ,
                 #center = 1
               ) +
  theme_classic() +
  theme_fonts +
  theme(
    legend.justification = c(1, 1),
    legend.background = element_blank(),
    legend.box.background = element_rect(colour = "black"))

plot_reintegration

ggsave(filename = 
      here::here('output/figures/reintegration-histogram.jpg'),
       plot_reintegration)

rm(plot_reintegration)




