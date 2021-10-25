#### Running this script ####
#this script starts with the full, multi-year citation data file created at the end of WoS-combine.R
#unless you changed the name, the file should be "data/Publications.csv"
#this script will generate but not save plots

#### Load Libraries ####
require(tidyverse)
require(plyr)

#### Read in Data ####
data <- read_csv("data/Publications.csv", col_names = TRUE)

#subset each year
data17 <- filter(data, year == "2017")
data18 <- filter(data, year == "2018")
data19 <- filter(data, year == "2019")
data20 <- filter(data, year == "2020")

#create frequency table to use in graphs
pub17 <- count(data17, 'NPU') 
pub18 <- count(data18, 'NPU') 
pub19 <- count(data19, 'NPU') 
pub20 <- count(data20, 'NPU') 

#### Basic Graph top 20 publishers by frequency ####
#2017
top_n(pub17, n=20, freq) %>% 
  ggplot(., aes(x=reorder(NPU, -freq), 
                y=freq)) ->top17

top17 + geom_bar(stat = "identity", show.legend = T)+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))+
  labs(x = "",
       y = "Articles",
       title = "NCSU Publications in 2017")

#2018
top_n(pub18, n=20, freq) %>% 
  ggplot(., aes(x=reorder(NPU, -freq), 
                y=freq)) ->top18

top18 + geom_bar(stat = "identity", show.legend = T)+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))+
  labs(x = "",
       y = "Articles",
       title = "NCSU Publications in 2018")

#2019
top_n(pub19, n=20, freq) %>% 
  ggplot(., aes(x=reorder(NPU, -freq), 
                y=freq)) ->top19

top19 + geom_bar(stat = "identity", show.legend = T)+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))+
  labs(x = "",
       y = "Articles",
       title = "NCSU Publications in 2019")

#2020
top_n(pub20, n=20, freq) %>% 
  ggplot(., aes(x=reorder(NPU, -freq), 
                y=freq)) ->top20

top20 + geom_bar(stat = "identity", show.legend = T)+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))+
  labs(x = "",
       y = "Articles",
       title = "NCSU Publications in 2020")

#### Graph with OA publisher deals highlighted ####
#2017
top_n(pub17, n=20, freq) %>% 
  ggplot(., aes(x=reorder(NPU, -freq), 
                y=freq, 
                fill=factor(ifelse(NPU=="MDPI"|NPU=="PLoS","Highlighted","Normal")))) ->h17

h17 + geom_bar(stat = "identity", show.legend = F)+
  theme_bw()+
  scale_fill_manual(name = "area", values=c("red","grey50"))+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))+
  labs(x = "Publisher",
       y = "Articles",
       title = "NCSU Publications in 2017",
       subtitle = "Transformative Deals Highlighted")

#2018
top_n(pub18, n=20, freq) %>% 
  ggplot(., aes(x=reorder(NPU, -freq), 
                y=freq, 
                fill=factor(ifelse(NPU=="MDPI"|NPU=="PLoS","Highlighted","Normal")))) ->h18

h18 + geom_bar(stat = "identity", show.legend = F)+
  theme_bw()+
  scale_fill_manual(name = "area", values=c("red","grey50"))+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))+
  labs(x = "Publisher",
       y = "Articles",
       title = "NCSU Publications in 2018",
       subtitle = "Transformative Deals Highlighted")

#2019
top_n(pub19, n=20, freq) %>% 
  ggplot(., aes(x=reorder(NPU, -freq), 
                y=freq, 
                fill=factor(ifelse(NPU=="MDPI"|NPU=="PLoS","Highlighted","Normal")))) ->h19

h19 + geom_bar(stat = "identity", show.legend = F)+
  theme_bw()+
  scale_fill_manual(name = "area", values=c("red","grey50"))+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))+
  labs(x = "Publisher",
       y = "Articles",
       title = "NCSU Publications in 2019",
       subtitle = "Transformative Deals Highlighted")

#2020
top_n(pub20, n=20, freq) %>% 
  ggplot(., aes(x=reorder(NPU, -freq), 
                y=freq, 
                fill=factor(ifelse(NPU=="MDPI"|NPU=="PLoS","Highlighted","Normal")))) ->h20

h20 + geom_bar(stat = "identity", show.legend = F)+
  theme_bw()+
  scale_fill_manual(name = "area", values=c("red","grey50"))+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))+
  labs(x = "Publisher",
       y = "Articles",
       title = "NCSU Publications in 2020",
       subtitle = "Transformative Deals Highlighted")

#### Graph All Years ####
pubAll <- count(data, 'NPU') 

#Basic Graph top 20 publishers by frequency
top_n(pubAll, n=20, freq) %>% 
  ggplot(., aes(x=reorder(NPU, -freq), 
                y=freq)) ->topAll

topAll + geom_bar(stat = "identity", show.legend = T)+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))+
  labs(x = "",
       y = "Articles",
       title = "NCSU Publications 2017-2020")

#Graph with OA publisher deals highlighted
top_n(pubAll, n=20, freq) %>% 
  ggplot(., aes(x=reorder(NPU, -freq), 
                y=freq, 
                fill=factor(ifelse(NPU=="MDPI"|NPU=="PLoS","Highlighted","Normal")))) ->hAll

hAll + geom_bar(stat = "identity", show.legend = F)+
  theme_bw()+
  scale_fill_manual(name = "area", values=c("red","grey50"))+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))+
  labs(x = "Publisher",
       y = "Articles",
       title = "NCSU Publications 2017-2020",
       subtitle = "Transformative Deals Highlighted")
