####load libraries####
require(tidyverse)
require(plyr)
require(readxl)

####Load data####
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

#combine
pub2020<- rbind(data, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10)

#save backup: write_csv(pub2020, "data/ncsuPub2020.csv")
####load backup: ####
pub2020 <- read_csv("data/Pub2020.csv", col_names = TRUE)


####Normalize Publisher Names####
#get publisher names to create authority file: publishers<- unique(pub2020$Publisher)

#create a NPU column for the normalized publisher names
  #by default all names are the same as Publisher column
tpub2020 <- mutate(pub2020, NPU = pub2020$Publisher)

##Set preferred publisher names
# "prefName" -> tpub2020$NPU[tpub2020$NPU == "variant" | tpub2020$NPU == "variant"]
"AAAS" -> tpub2020$NPU[tpub2020$NPU == "AMER ASSOC ADVANCEMENT SCIENCE"]
"ACM" -> tpub2020$NPU[tpub2020$NPU == "ASSOC COMPUTING MACHINERY"]
"ACS" -> tpub2020$NPU[tpub2020$NPU == "AMER CHEMICAL SOC"]
"AIP" -> tpub2020$NPU[tpub2020$NPU == "AMER INST PHYSICS" | 
                        tpub2020$NPU == "A V S AMER INST PHYSICS"]
"AMER PSYCHOLOGICAL ASSOC" -> tpub2020$NPU[tpub2020$NPU == "EDUCATIONAL PUBLISHING FOUNDATION-AMERICAN PSYCHOLOGICAL ASSOC"]
"APS" -> tpub2020$NPU[tpub2020$NPU == "AMER PHYSICAL SOC"]
"AMER PHYTOPATHOLOGICAL SOC" -> tpub2020$NPU[tpub2020$NPU =="A. PHYTOPATH. S."]
"ASCE" -> tpub2020$NPU[tpub2020$NPU == "ASCE-AMER SOC CIVIL ENGINEERS"]
"ASHS" -> tpub2020$NPU[tpub2020$NPU == "AMER SOC HORTICULTURAL SCIENCE"]
"ASME" -> tpub2020$NPU[tpub2020$NPU == "AMER SOC MECHANICAL ENGINEERS"]
"ASTM" -> tpub2020$NPU[tpub2020$NPU == "AMER SOC TESTING MATERIALS"]
"Bentham" -> tpub2020$NPU[tpub2020$NPU == "BENTHAM SCIENCE PUBL LTD" | 
                            tpub2020$NPU == "BENTHAM SCIENCE PUBL"]
"BMJ" -> tpub2020$NPU[tpub2020$NPU == "BMJ PUBLISHING GROUP"]
"CUP" -> tpub2020$NPU[tpub2020$NPU == "CAMBRIDGE UNIV PRESS"]
"DeGruyter" -> tpub2020$NPU[tpub2020$NPU == "WALTER DE GRUYTER GMBH"]
"Electrochemical Society" -> tpub2020$NPU[tpub2020$NPU == "ELECTROCHEMICAL SOC INC"]
"Elsevier" -> tpub2020$NPU[tpub2020$NPU == "ELSEVIER SCIENCE SA" | 
                             tpub2020$NPU == "CELL PRESS" |
                             tpub2020$NPU == "ELSEVIER SCIENCE INC" |
                             tpub2020$NPU == "ELSEVIER" |
                             tpub2020$NPU == "PERGAMON-ELSEVIER SCIENCE LTD" |
                             tpub2020$NPU == "ACADEMIC PRESS INC ELSEVIER SCIENCE" |
                             tpub2020$NPU == "ELSEVIER SCI LTD" |
                             tpub2020$NPU == "ELSEVIER IRELAND LTD" |
                             tpub2020$NPU == "ACADEMIC PRESS LTD- ELSEVIER SCIENCE LTD" |
                             tpub2020$NPU == "ELSEVIER ADVANCED TECHNOLOGY" |
                             tpub2020$NPU == "CURRENT BIOLOGY LTD" |
                             tpub2020$NPU == "W B SAUNDERS CO-ELSEVIER INC" |
                             tpub2020$NPU == "ELSEVIER GMBH" |
                             tpub2020$NPU == "ELSEVIER SCIENCE LONDON" |
                             tpub2020$NPU == "MOSBY-ELSEVIER" |
                             tpub2020$NPU == "ELSEVIER FRANCE-EDITIONS SCIENTIFIQUES MEDICALES ELSEVIER" |
                             tpub2020$NPU == "HANLEY & BELFUS-ELSEVIER INC" |
                             tpub2020$NPU == "ACADEMIC PRESS LTD-ELSEVIER SCIENCE LTD" |
                             tpub2020$NPU == "ELSEVIER ACADEMIC PRESS INC" |
                             tpub2020$NPU == "WOODHEAD PUBL LTD" |
                             tpub2020$NPU == "ELSEVIER INC" |
                             tpub2020$NPU == "ELSEVIER SCIENCE BV"]
"Emerald" -> tpub2020$NPU[tpub2020$NPU == "EMERALD GROUP PUBLISHING LTD"]
"Frontiers" -> tpub2020$NPU[tpub2020$NPU == "FRONTIERS MEDIA SA"]
"Hindawi" -> tpub2020$NPU[tpub2020$NPU == "HINDAWI LTD" | tpub2020$NPU == "WILEY-HINDAWI"]
"IEEE" -> tpub2020$NPU[tpub2020$NPU == "IEEE-INST ELECTRICAL ELECTRONICS ENGINEERS INC" | 
                         tpub2020$NPU == "IEEE COMPUTER SOC"]
"IET" -> tpub2020$NPU[tpub2020$NPU == "INST ENGINEERING TECHNOLOGY-IET"]
"IMS" -> tpub2020$NPU[tpub2020$NPU == "INST MATHEMATICAL STATISTICS-IMS"]
"IOP" -> tpub2020$NPU[tpub2020$NPU == "IOP PUBLISHING LTD"]
"IWA" -> tpub2020$NPU[tpub2020$NPU == "IWA PUBLISHING"]
"JoVE" -> tpub2020$NPU[tpub2020$NPU == "JOURNAL OF VISUALIZED EXPERIMENTS"]
"Karger" -> tpub2020$NPU[tpub2020$NPU == "KARGER"]
"LWW" -> tpub2020$NPU[tpub2020$NPU == "LIPPINCOTT WILLIAMS & WILKINS"]
"Mary Ann Liebert	" -> tpub2020$NPU[tpub2020$NPU == "MARY ANN LIEBERT, INC"]
"NAS" -> tpub2020$NPU[tpub2020$NPU == "NATL ACAD SCIENCES"]
"Nature" -> tpub2020$NPU[tpub2020$NPU == "NATURE RESEARCH" | 
                           tpub2020$NPU == "NATURE PUBLISHING GROUP"]
"NCSU WPS" -> tpub2020$NPU[tpub2020$NPU == "NORTH CAROLINA STATE UNIV DEPT WOOD & PAPER SCI"]
"OUP" -> tpub2020$NPU[tpub2020$NPU == "OXFORD UNIV PRESS" |
                        tpub2020$NPU == "OXFORD UNIV PRESS INC"]
"PeerJ" -> tpub2020$NPU[tpub2020$NPU == "PEERJ INC"]
"PLoS" -> tpub2020$NPU[tpub2020$NPU == "PUBLIC LIBRARY SCIENCE"]
"Routledge" -> tpub2020$NPU[tpub2020$NPU == "ROUTLEDGE"]
"Royal Society" -> tpub2020$NPU[tpub2020$NPU == "ROYAL SOC"]
"RSC" -> tpub2020$NPU[tpub2020$NPU == "ROYAL SOC CHEMISTRY"]
"Sage" -> tpub2020$NPU[tpub2020$NPU == "SAGE PUBLICATIONS INC" |
                         tpub2020$NPU == "SAGE PUBLICATIONS LTD"]
"Schweizerbart Science Publishers" -> tpub2020$NPU[tpub2020$NPU == "E SCHWEIZERBARTSCHE VERLAGSBUCHHANDLUNG"]
"SIAM Publishing" -> tpub2020$NPU[tpub2020$NPU == "SAMI PUBLISHING CO-SPC" |
                                    tpub2020$NPU == "SIAM PUBLICATIONS"]
"SPIE" -> tpub2020$NPU[tpub2020$NPU == "SPIE-SOC PHOTO-OPTICAL INSTRUMENTATION ENGINEERS" |
                         tpub2020$NPU == "SPIE-INT SOC OPTICAL ENGINEERING"]
"Springer" -> tpub2020$NPU[tpub2020$NPU == "BMC" | 
                             tpub2020$NPU == "SPRINGER"|
                             tpub2020$NPU == "ADIS INT LTD"|
                             tpub2020$NPU == "SPRINGER LONDON LTD"|
                             tpub2020$NPU == "SPRINGER HEIDELBERG"|
                             tpub2020$NPU == "SPRINGER/PLENUM PUBLISHERS"|
                             tpub2020$NPU == "SPRINGERNATURE"|
                             tpub2020$NPU == "SPRINGER WIEN"|
                             tpub2020$NPU == "SPRINGER INTERNATIONAL PUBLISHING AG"|
                             tpub2020$NPU == "SPRINGER BASEL AG"|
                             tpub2020$NPU == "SPRINGER JAPAN KK"|
                             tpub2020$NPU == "SPRINGER SINGAPORE PTE LTD"|
                             tpub2020$NPU == "PALGRAVE MACMILLAN LTD"|
                             tpub2020$NPU == "PLEIADES PUBLISHING INC"|
                             tpub2020$NPU == "HUMANA PRESS INC"|
                             tpub2020$NPU == "SPEKTRUM AKADEMISCHER VERLAG-SPRINGER-VERLAG GMBH"|
                             tpub2020$NPU == "SPRINGER-VERLAG SINGAPORE PTE LTD"|
                             tpub2020$NPU == "SPRINGER NATURE SWITZERLAND AG"]
"T&F" -> tpub2020$NPU[tpub2020$NPU == "TAYLOR & FRANCIS INC" |
                        tpub2020$NPU == "ROUTLEDGE JOURNALS, TAYLOR & FRANCIS LTD" |
                        tpub2020$NPU == "TAYLOR & FRANCIS LTD" |
                        tpub2020$NPU == "TAYLOR & FRANCIS AS" |
                        tpub2020$NPU == "TAYLOR & FRANCIS AUSTRALIA" |
                        tpub2020$NPU == "CRC PRESS-TAYLOR & FRANCIS GROUP"]
"Thieme" -> tpub2020$NPU[tpub2020$NPU == "GEORG THIEME VERLAG KG" |
                           tpub2020$NPU == "THIEME MEDICAL PUBL INC"]
"UNIV CALIFORNIA PRESS" -> tpub2020$NPU[tpub2020$NPU == "UNIV CALIFORNIA PRESS, JOURNALS DIV"]
"Wiley" -> tpub2020$NPU[tpub2020$NPU == "WILEY" | 
                          tpub2020$NPU == "WILEY-V C H VERLAG GMBH"|
                          tpub2020$NPU == "JOHN WILEY & SONS LTD"|
                          tpub2020$NPU == "AMER GEOPHYSICAL UNION"|
                          tpub2020$NPU == "WILEY PERIODICALS, INC"|
                          tpub2020$NPU == "WILEY PERIODICALS"]
"World Scientific" -> tpub2020$NPU[tpub2020$NPU == "WORLD SCIENTIFIC PUBL CO PTE LTD"]

#check journal titles associated with a publisher variation
test <- filter(pub2020, pub2020$Publisher == "ROUTLEDGE JOURNALS, TAYLOR & FRANCIS LTD")
unique(test$`Source Title`)

test <- filter(npub2020, npub2020$NPU == "Wiley")
unique(test$`Source Title`)

### Save/Load Normalized Data ####
#write_csv(tpub2020, "data/ncsuPub2020_clean.csv")
npub2020 <- read_csv("data/ncsuPub2020_clean.csv", col_names = T)

### Graph ###
pub <- count(npub2020, 'NPU') #create frequency table to use in graphs

#Basic Graph
top_n(pub, n=20, freq) %>% 
  ggplot(., aes(x=reorder(NPU, -freq), 
                y=freq)) ->bPlot

bPlot + geom_bar(stat = "identity", show.legend = T)+
  theme_bw()+
  scale_fill_manual(name = "area", values=c("MDPI"= "red",
                                            "PLoS"= "red"))+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))+
  labs(x = "Publisher",
       y = "Articles",
       title = "NCSU Publications in 2020")

#Graph with publisher highlighted
top_n(pub, n=20, freq) %>% 
  ggplot(., aes(x=reorder(NPU, -freq), 
                y=freq, 
                fill=factor(ifelse(NPU=="MDPI"|NPU=="PLoS","Highlighted","Normal")))) ->hPlot
  
hPlot + geom_bar(stat = "identity", show.legend = F)+
  theme_bw()+
  scale_fill_manual(name = "area", values=c("red","grey50"))+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))+
  labs(x = "Publisher",
       y = "Articles",
       title = "NCSU Publications in 2020",
       subtitle = "Transformative Deals Highlighted")





