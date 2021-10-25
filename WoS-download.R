### Running this script ###
# Don't rename the WoS download files, keep the default "savedrec" convention
#I've written out instructions for 11 downloads in Excel or csv format, select and run as many as you need for the format of your download
#Run the combine and save sections once the citations are read in
#the "save compiled file" section needs to have the file name updated to reflect the year of the data downloaded
#the next script in the chain is the WoS-normalize.R


####load libraries####
require(tidyverse)
require(plyr)
require(readxl)

#### Load data files (Excel) ####
data <- read_xls("data/savedrecs.xls", col_names = TRUE)
data1 <- read_xls("data/savedrecs (1).xls", col_names = TRUE)
data2 <- read_xls("data/savedrecs (2).xls", col_names = TRUE)
data3 <- read_xls("data/savedrecs (3).xls", col_names = TRUE)
data4 <- read_xls("data/savedrecs (4).xls", col_names = TRUE)
data5 <- read_xls("data/savedrecs (5).xls", col_names = TRUE)
data6 <- read_xls("data/savedrecs (6).xls", col_names = TRUE)
data7 <- read_xls("data/savedrecs (7).xls", col_names = TRUE)
data8 <- read_xls("data/savedrecs (8).xls", col_names = TRUE)
data9 <- read_xls("data/savedrecs (9).xls", col_names = TRUE)
data10 <- read_xls("data/savedrecs (10).xls", col_names = TRUE)

### Load data files (CSV) ###
data <- read_csv("data/savedrecs.xls", col_names = TRUE)
data1 <- read_csv("data/savedrecs (1).xls", col_names = TRUE)
data2 <- read_csv("data/savedrecs (2).xls", col_names = TRUE)
data3 <- read_csv("data/savedrecs (3).xls", col_names = TRUE)
data4 <- read_csv("data/savedrecs (4).xls", col_names = TRUE)
data5 <- read_csv("data/savedrecs (5).xls", col_names = TRUE)
data6 <- read_csv("data/savedrecs (6).xls", col_names = TRUE)
data7 <- read_csv("data/savedrecs (7).xls", col_names = TRUE)
data8 <- read_csv("data/savedrecs (8).xls", col_names = TRUE)
data9 <- read_csv("data/savedrecs (9).xls", col_names = TRUE)
data10 <- read_csv("data/savedrecs (10).xls", col_names = TRUE)


### Combine data frames ###
pub<- rbind(data, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10)

#### save compiled file ### 
write_csv(pub, "data/Pub2020.csv")