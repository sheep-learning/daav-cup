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
                  full_width = T) %>%
    column_spec(2, width='3cm',  bold = TRUE, color = "white", background = "red3")
}

indivResults <- function(carpicks, positions, bracket){
  df <- tibble(Car = carpicks) %>%
    bind_cols(positions[,bracket]) 
  
  tab <- df %>%
    kable(escape='FALSE',format='html') %>%
    kable_styling(
      bootstrap_options = c("striped", "condensed"),
      full_width = T,
      position = "left"
    ) %>%
    column_spec(
      1, width="100px", bold = TRUE, color = "white", background = "red3"
      ) 
    
  for(i in 2:ncol(df)){
    tab <- tab %>% 
      column_spec(i, width="50px", background = column_colours(df[[i]]))
  }
  
  return(tab)
}

dailyResults <- function(df){
  knitr::kable(df, align = c("r", "l")) %>%
    kable_styling(bootstrap_options = c("striped", "condensed"), 
                  full_width = T) %>%
    column_spec(2, width='3cm',  bold = TRUE, color = "white", background = "red3")
}

save.image(file='utils/functions/table_functions.RData')