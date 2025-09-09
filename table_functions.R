rm(list=ls())
library(dplyr)
library(magrittr)

showCars <- function(carpicks,bracket){
  # match-up decision
  pick_df <- tibble(
    Pool = c('Captain', 'Vice Captain', paste('Pool', 3:(npools))),
    Car  = carpicks) %>%
    cbind(teams[,bracket])
  
  knitr::kable(pick_df, caption = "Top Bracket") %>%
    kable_styling(bootstrap_options = c("striped", "condensed")) %>%
    column_spec(2, bold = TRUE, color = "white", background = "navy")
}

showResults <- function(df){
  knitr::kable(df, align = c("r", "l")) %>%
    kable_styling(bootstrap_options = c("striped", "condensed"), 
                  full_width = F) %>%
    column_spec(2, width='3cm',  bold = TRUE, color = "white", background = "red3")
}

indivResults <- function(carpicks, positions, bracket){
  tibble(Car  = carpicks) %>%
    cbind(positions[,bracket]) %>%
    kable() %>%
    kable_styling(
      bootstrap_options = c("striped", "condensed"),
      full_width = FALSE,
      position = "left"
    ) %>%
    column_spec(
      1, width = "100px", bold = TRUE, color = "white", background = "red3"
    ) %>%
    column_spec(
      2:4,
      width = "50px",
    )
}

dailyResults <- function(df){
  knitr::kable(df, align = c("r", "l")) %>%
    kable_styling(bootstrap_options = c("striped", "condensed"), 
                  full_width = F) %>%
    column_spec(2, width='3cm',  bold = TRUE, color = "white", background = "red3")
}

save.image(file='table_functions.RData')