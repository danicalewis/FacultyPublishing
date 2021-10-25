#### Running this Script ####
# This script loads in the yearly publication data and merges it into a single file, and prepares it for easier visualization and analysis. Add the new year of publication data at the bottom of the Load Data and Merge All Years of Data sections.
#This script will then save the combined data as its own file, potentially overwriting the file created last year if you don't move or rename it.
#The next script is WoS-visualize.R

#### Load Libraries ###
require(tidyverse)
require(plyr)

#### Load Data ####
pub2017 <- read_csv("data/normPub2017.csv", col_names = TRUE)
pub2018 <- read_csv("data/normPub2018.csv", col_names = TRUE)
pub2019 <- read_csv("data/normPub2019.csv", col_names = TRUE)
pub2020 <- read_csv("data/normPub2020.csv", col_names = TRUE)
# NEW DATA FROM WOS-DOWNLOAD HERE

#### Merge All Years of Data ####

# Make year column and a "Publication Year" column for visualization
pub2017 %>% mutate(year = "2017") -> pub2017
pub2017$"Publication Year" <- as.Date(paste(pub2017$year, 1, 1), '%Y %m %d')

pub2018 %>% mutate(year = "2018") -> pub2018
pub2018$"Publication Year" <- as.Date(paste(pub2018$year, 1, 1), '%Y %m %d')

pub2019 %>% mutate(year = "2019") -> pub2019
pub2019$"Publication Year" <- as.Date(paste(pub2019$year, 1, 1), '%Y %m %d')

pub2020 %>% mutate(year = "2020") -> pub2020
pub2020$"Publication Year" <- as.Date(paste(pub2020$year, 1, 1), '%Y %m %d')

#NEW YEAR HERE

#Merge; add new data to the rbind function
rbind(pub2017, pub2018, pub2019, pub2020) -> data # ADD NEW YEAR OF DATA

#Save full data
write_csv(data, "data/Publications.csv")
