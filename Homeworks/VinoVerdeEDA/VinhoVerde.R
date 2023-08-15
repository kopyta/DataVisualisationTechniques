library(dplyr)
library(dlookr)
library(visdat)

df <- read.csv("winequality-red.csv")

vis_dat(df)

description <- df %>% describe() %>%
  select(variable, na, mean, sd) %>% 
  cbind(as.data.frame(apply(df,2,min))) %>% 
  cbind(as.data.frame(apply(df,2,max))) %>% 
  cbind(as.data.frame(apply(df, 2, function(x) length(unique(x)))))
colnames(description) <- c("Zmienna","Liczba NA", "Średnia","Odchylenie standardowe",
                           "Wartość minimalna", "Wartość maksymalna", "Unikalne wartości")
rownames(description) <- NULL

vis_dat(df)
vis_miss(df)
vis_cor(df)
