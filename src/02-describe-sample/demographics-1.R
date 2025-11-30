demographics_1 <-
  bind_rows( 
    
    # Age ---------------------------------------------------------------------
    data_1 %>% 
      mutate(category = 
               cut(data_1$years_of_age, 
                   breaks = c(18, 34.5, 54.5, 64.5, 74.5, 100))) %>% 
      count(category) %>% 
      mutate(perc = n / sum(n) * 100, 
             category = c("18 to 34",
                          "35 to 54",
                          "55 to 64",
                          "65 to 74",
                          "75 and older"),
             variable = "Age"),
    
    
    # Branch ------------------------------------------------------------------
    data_1 %>% 
      group_by(branch) %>% 
      count_perc(FALSE) %>% 
      mutate(variable = "Branch"),
    
    
    # Discharge Reason --------------------------------------------------------
    data_1 %>% 
      group_by(discharge_reason) %>% 
      count_perc(TRUE) %>% 
      mutate(variable = "Discharge Reason"),
    
    
    # Education ----------------------------------------------------------------
    data_1 %>% 
      transmute(education = factor(education, 
                                   ordered = TRUE, 
                                   levels = c("High school diploma or equivalent", "Some college", "Associates degree", "Bachelors degree", "Masters degree", "Applied or professional doctorate", "Doctorate"), 
                                   labels = c("High school diploma or equivalent", "Some college", "Associates degree", "Bachelors degree", "Masters degree", "Applied or professional doctorate", "Doctorate"))
                ) %>% 
      count(education) %>% 
      mutate(perc = n / sum(n) * 100) %>% 
      rename(category = 1) %>% 
      mutate(variable = "Education Level"),
    
    
    # Military Experiences ----------------------------------------------------
    data_1 %>% 
      select(starts_with('military_exp') & !ends_with('total')) %>% 
      create_percentage_table() %>% 
      slice(c(2,3,5,6,1,4)) %>% 
      mutate(variable = "Military Experiences",
             category = c("Combat Depoloyment",
                          "Non-combat Deployment",
                          "Peacekeeping or Humanitarian Deployment",
                          "Combat Support",
                          "Any of the above",
                          "None of the above")),
    
    # Race ----------------------------------------------------------------------
    data_1 %>% 
      group_by(race) %>% 
      count_perc(FALSE) %>% 
      mutate(variable = "Race/Ethnicity"),
    
    
    # Highest Paygrade Achieved ------------------------------------------------
    data_1 %>% 
      select(starts_with('rank')) %>% 
      create_percentage_table() %>% 
      slice(c(1,2,3,6,4,5)) %>%
      mutate(variable = "Highest Paygrade Achieved",
             category = c("E-1 to E-3",
                          "E-4 to E-6",
                          "E-7 to E-9",
                          "W-1 to CW-5",
                          "O-1 to O-3",
                          "O-4 to O-6")),
    
    
    # Service Era -------------------------------------------------------------
    data_1 %>% 
      transmute(service_era_init = factor(service_era_init, 
                                       levels = c("Korea", "Cold War (Pre-Vietnam)", "Vietnam", "Cold War (Post-Vietnam)", "Persian Gulf", "Post 9-11"),
                                       ordered = TRUE)
      ) %>% 
      count(service_era_init) %>% 
      mutate(perc = n/sum(n) * 100) %>% 
      rename(category = 1) %>% 
      mutate(variable = "Initial Service Era"),
    
    # Gender ----------------------------------------------------------------------
    data_1 %>% 
      group_by(sex) %>% 
      count_perc(sort = TRUE) %>% 
      mutate(variable = "Gender", 
             category = case_when(category == "male" ~ "Male",
                                  category == "female" ~ "Female",
                                  .default = category
             )),
    
    
    # Years of Service --------------------------------------------------------
    data_1 %>% 
      select(years_service) %>% 
      mutate(group = 
               cut(data_1$years_service, 
                   breaks = c(0, 4.9, 9.9, 14.9, 19.9, 40))) %>% 
      count(group) %>% 
      ungroup() %>% 
      mutate(perc = n / sum(n) * 100,
             category = c("0 to 4",
                          "5 to 9",
                          "10 to 14",
                          "15 to 20",
                          "20 or more"),
             variable = "Years of Service") %>% 
      select(category, !group),
    
    
    # Years since separation --------------------------------------------------
    data_1 %>% 
      select(years_separation) %>% 
      mutate(group = 
               cut(data_1$years_separation, 
                   breaks = c(-1, 9.9, 19.9, 29.9, 39.9, 49.9, 100))) %>% 
      count(group) %>% 
      ungroup() %>% 
      mutate(perc = n / sum(n) * 100,
             category = c("0 to 9",
                          "10 to 19",
                          "20 to 29",
                          "30 to 39",
                          "40 to 50",
                          "50 or more"),
             variable = "Years since Separation") %>% 
      select(category, !group)
    
    
  ) %>% 
  #mutate(perc = paste0(round(perc, 1), "%")) %>% 
  select(variable, everything())



# Print -------------------------------------------------------------------
demographics_1 %>% print(n = 100)

