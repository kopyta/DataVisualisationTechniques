library(dplyr)
library(ggplot2)
library(forcats)

df <- read.table(file = "clipboard", sep = "\t", header = TRUE)
saveRDS(df, "ramkapd3")

df <- readRDS("ramkapd3")

odp1 <- data.frame(c("2007 i 2012","2008 i 2012", "2009 i 2014","2010 i 2015","2011 i 2016", "Takie pary nie istnieją"), c(13,14,7,2,12,2))
colnames(odp1) <- c("Odp", "Wskazania")
odp1 %>% 
  ggplot(aes(y=reorder(Odp, -Wskazania), x = Wskazania))+
  labs(x= "Liczba wskazań", y ="", title="Podsumowanie pytania 1 dla wykresu 1")+
  geom_col()

odp4 <- data.frame(c("30", "2","50","40", "ok.1,1", "<1","4"), c(2,7,2,1,7,2,1))

colnames(odp4) <- c("Odp", "Wskazania")
odp4 %>% 
  ggplot(aes(y=reorder(Odp, -Wskazania), x = Wskazania))+
  labs(x= "Liczba wskazań", y ="", title="Podsumowanie pytania 3")+
  geom_col()





#kolejnosc slupkow- szukanie rownych wartosci

p1 <- df %>% 
  ggplot(aes(x=Names, y = Values))+
  theme_minimal()+
  theme(panel.grid.minor.x = element_blank(), 
        panel.grid.minor.y = element_blank())+
  scale_y_continuous(limits = c(0,400),
                     breaks = seq(0,400,100),expand = c(0,0))+
  scale_x_continuous(breaks = seq(2007,2016,1))+
  labs(x="Rok", y="")+
  geom_col(fill="#D98880")

p1

p2 <- df %>%
  ggplot(aes(x=reorder(Names,-Values), y = Values))+
  theme_minimal()+
  theme(panel.grid.minor.x = element_blank(), 
        panel.grid.minor.y = element_blank())+
  scale_y_continuous(limits = c(0,400),
                     breaks = seq(0,400,100),expand = c(0,0))+
  labs(x="Rok", y="")+
  geom_col(fill="#D98880")
  
p2
#kolejnosc slupkow - szukanie zmiany w czasie



#skok wartości
p3 <- df %>% 
  ggplot(aes(x=Names, y = Values))+
  theme_minimal()+
  theme(panel.grid.minor.x = element_blank(), 
        panel.grid.minor.y = element_blank())+
  scale_y_continuous(breaks = seq(300,400,100), expand = c(0,0))+
  scale_x_continuous(breaks = seq(2007,2016,1))+
  labs(x="Rok", y="")+
  geom_col(fill="#D98880",position = "dodge")+
  coord_cartesian(ylim = c(300, 375))
p3

