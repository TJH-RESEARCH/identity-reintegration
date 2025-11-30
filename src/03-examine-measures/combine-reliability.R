
# Combine
reliability <- 
  bind_rows(
    reliability_mcarm,
    reliability_wis
  )

# Print to Console
reliability %>% print()

# Write to file
reliability %>% write_csv(here::here("output/reliability.csv"))
