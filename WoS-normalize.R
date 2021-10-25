#### Running this script ####
# set the fileIn and fileOut objects to the name of the file to be read in and the file name to be saved out respectively. The file to be read in should be the full compiled data set for the year, which you can create with WoS-download.R if you had to download the citation data in multiple chunks.
#Once you've set the fileIn and fileOut objects to the correct file path, select all and run the entire script. This should read in the file, create a new column (NPU) with normalized publisher names, normalize the publisher names, and save out a data file that you can send to WoS-combine.R to combine with the other years of data into a file that's ready for analysis and visualization.

#If you need to alter or create new preferred publisher names, there's a commented out template you can use in the Normalize Publisher Names section. For the sake of your future self, add the new name alphabetically in the list so you can find it later.

#### Load Libraries ####
require(tidyverse)
require(plyr)

#Set these to the files names of the file to be read IN and the file to be saved OUT; then run the whole script
fileIn <- "data/Pub2020.csv"
fileOut <- "data/normPub2020.csv"

#### Read in new year of citation data ####
publications <- read_csv(fileIn, col_names = TRUE)

####Normalize Publisher Names####
#get publisher names to create authority file: publishers<- unique(publications$Publisher)

#create a NPU column for the normalized publisher names
#by default all names are the same as Publisher column
publications %>% mutate(NPU = publications$PU) -> publications

##Set preferred publisher names
# "prefName" -> publications$NPU[publications$NPU == "variant name1" | publications$NPU == "variant name2"]
"A. Phytopath. S." -> publications$NPU[publications$NPU =="AMER PHYTOPATHOLOGICAL SOC"]
"A.S. Animal Science" -> publications$NPU[publications$NPU =="AMER SOC ANIMAL SCIENCE"]
"AAAS" -> publications$NPU[publications$NPU == "AMER ASSOC ADVANCEMENT SCIENCE"]
"ACM" -> publications$NPU[publications$NPU == "ASSOC COMPUTING MACHINERY"]
"ACS" -> publications$NPU[publications$NPU == "AMER CHEMICAL SOC"]
"AIP" -> publications$NPU[publications$NPU == "AMER INST PHYSICS" | 
                        publications$NPU == "A V S AMER INST PHYSICS"]
"AMER PSYCHOLOGICAL ASSOC" -> publications$NPU[publications$NPU == "EDUCATIONAL PUBLISHING FOUNDATION-AMERICAN PSYCHOLOGICAL ASSOC"]
"APS" -> publications$NPU[publications$NPU == "AMER PHYSICAL SOC"]
"ASCE" -> publications$NPU[publications$NPU == "ASCE-AMER SOC CIVIL ENGINEERS"]
"ASHS" -> publications$NPU[publications$NPU == "AMER SOC HORTICULTURAL SCIENCE"]
"ASME" -> publications$NPU[publications$NPU == "AMER SOC MECHANICAL ENGINEERS"]
"ASTM" -> publications$NPU[publications$NPU == "AMER SOC TESTING MATERIALS"]
"Bentham" -> publications$NPU[publications$NPU == "BENTHAM SCIENCE PUBL LTD" | 
                            publications$NPU == "BENTHAM SCIENCE PUBL"]
"BMJ" -> publications$NPU[publications$NPU == "BMJ PUBLISHING GROUP"]
"CUP" -> publications$NPU[publications$NPU == "CAMBRIDGE UNIV PRESS"]
"DeGruyter" -> publications$NPU[publications$NPU == "WALTER DE GRUYTER GMBH"]
"Electrochemical Society" -> publications$NPU[publications$NPU == "ELECTROCHEMICAL SOC INC"]
"Elsevier" -> publications$NPU[publications$NPU == "ELSEVIER SCIENCE SA" | 
                             publications$NPU == "CELL PRESS" |
                             publications$NPU == "ELSEVIER SCIENCE INC" |
                             publications$NPU == "ELSEVIER" |
                             publications$NPU == "PERGAMON-ELSEVIER SCIENCE LTD" |
                             publications$NPU == "ACADEMIC PRESS INC ELSEVIER SCIENCE" |
                             publications$NPU == "ELSEVIER SCI LTD" |
                             publications$NPU == "ELSEVIER IRELAND LTD" |
                             publications$NPU == "ACADEMIC PRESS LTD- ELSEVIER SCIENCE LTD" |
                             publications$NPU == "ELSEVIER ADVANCED TECHNOLOGY" |
                             publications$NPU == "CURRENT BIOLOGY LTD" |
                             publications$NPU == "W B SAUNDERS CO-ELSEVIER INC" |
                             publications$NPU == "ELSEVIER GMBH" |
                             publications$NPU == "ELSEVIER SCIENCE LONDON" |
                             publications$NPU == "MOSBY-ELSEVIER" |
                             publications$NPU == "ELSEVIER FRANCE-EDITIONS SCIENTIFIQUES MEDICALES ELSEVIER" |
                             publications$NPU == "HANLEY & BELFUS-ELSEVIER INC" |
                             publications$NPU == "ACADEMIC PRESS LTD-ELSEVIER SCIENCE LTD" |
                             publications$NPU == "ELSEVIER ACADEMIC PRESS INC" |
                             publications$NPU == "WOODHEAD PUBL LTD" |
                             publications$NPU == "ELSEVIER INC" |
                             publications$NPU == "ELSEVIER SCIENCE BV"]
"Emerald" -> publications$NPU[publications$NPU == "EMERALD GROUP PUBLISHING LTD"]
"Frontiers" -> publications$NPU[publications$NPU == "FRONTIERS MEDIA SA"]
"Hindawi" -> publications$NPU[publications$NPU == "HINDAWI LTD" | publications$NPU == "WILEY-HINDAWI"]
"IEEE" -> publications$NPU[publications$NPU == "IEEE-INST ELECTRICAL ELECTRONICS ENGINEERS INC" | 
                         publications$NPU == "IEEE COMPUTER SOC"]
"IET" -> publications$NPU[publications$NPU == "INST ENGINEERING TECHNOLOGY-IET"]
"IMS" -> publications$NPU[publications$NPU == "INST MATHEMATICAL STATISTICS-IMS"]
"IOP" -> publications$NPU[publications$NPU == "IOP PUBLISHING LTD"]
"IWA" -> publications$NPU[publications$NPU == "IWA PUBLISHING"]
"JoVE" -> publications$NPU[publications$NPU == "JOURNAL OF VISUALIZED EXPERIMENTS"]
"Karger" -> publications$NPU[publications$NPU == "KARGER"]
"LWW" -> publications$NPU[publications$NPU == "LIPPINCOTT WILLIAMS & WILKINS"]
"Mary Ann Liebert	" -> publications$NPU[publications$NPU == "MARY ANN LIEBERT, INC"]
"NAS" -> publications$NPU[publications$NPU == "NATL ACAD SCIENCES"]
"Nature" -> publications$NPU[publications$NPU == "NATURE RESEARCH" | 
                           publications$NPU == "NATURE PUBLISHING GROUP"]
"NCSU WPS" -> publications$NPU[publications$NPU == "NORTH CAROLINA STATE UNIV DEPT WOOD & PAPER SCI"]
"OUP" -> publications$NPU[publications$NPU == "OXFORD UNIV PRESS" |
                        publications$NPU == "OXFORD UNIV PRESS INC"]
"PeerJ" -> publications$NPU[publications$NPU == "PEERJ INC"]
"PLoS" -> publications$NPU[publications$NPU == "PUBLIC LIBRARY SCIENCE"]
"Routledge" -> publications$NPU[publications$NPU == "ROUTLEDGE"]
"Royal Society" -> publications$NPU[publications$NPU == "ROYAL SOC"]
"RSC" -> publications$NPU[publications$NPU == "ROYAL SOC CHEMISTRY"]
"Sage" -> publications$NPU[publications$NPU == "SAGE PUBLICATIONS INC" |
                         publications$NPU == "SAGE PUBLICATIONS LTD"]
"Schweizerbart Science Publishers" -> publications$NPU[publications$NPU == "E SCHWEIZERBARTSCHE VERLAGSBUCHHANDLUNG"]
"SIAM Publishing" -> publications$NPU[publications$NPU == "SAMI PUBLISHING CO-SPC" |
                                    publications$NPU == "SIAM PUBLICATIONS"]
"SPIE" -> publications$NPU[publications$NPU == "SPIE-SOC PHOTO-OPTICAL INSTRUMENTATION ENGINEERS" |
                         publications$NPU == "SPIE-INT SOC OPTICAL ENGINEERING"]
"Springer" -> publications$NPU[publications$NPU == "BMC" | 
                             publications$NPU == "SPRINGER"|
                             publications$NPU == "ADIS INT LTD"|
                             publications$NPU == "SPRINGER LONDON LTD"|
                             publications$NPU == "SPRINGER HEIDELBERG"|
                             publications$NPU == "SPRINGER/PLENUM PUBLISHERS"|
                             publications$NPU == "SPRINGERNATURE"|
                             publications$NPU == "SPRINGER WIEN"|
                             publications$NPU == "SPRINGER INTERNATIONAL PUBLISHING AG"|
                             publications$NPU == "SPRINGER BASEL AG"|
                             publications$NPU == "SPRINGER JAPAN KK"|
                             publications$NPU == "SPRINGER SINGAPORE PTE LTD"|
                             publications$NPU == "PALGRAVE MACMILLAN LTD"|
                             publications$NPU == "PLEIADES PUBLISHING INC"|
                             publications$NPU == "HUMANA PRESS INC"|
                             publications$NPU == "SPEKTRUM AKADEMISCHER VERLAG-SPRINGER-VERLAG GMBH"|
                             publications$NPU == "SPRINGER-VERLAG SINGAPORE PTE LTD"|
                             publications$NPU == "SPRINGER NATURE SWITZERLAND AG"]
"T&F" -> publications$NPU[publications$NPU == "TAYLOR & FRANCIS INC" |
                        publications$NPU == "ROUTLEDGE JOURNALS, TAYLOR & FRANCIS LTD" |
                        publications$NPU == "TAYLOR & FRANCIS LTD" |
                        publications$NPU == "TAYLOR & FRANCIS AS" |
                        publications$NPU == "TAYLOR & FRANCIS AUSTRALIA" |
                        publications$NPU == "CRC PRESS-TAYLOR & FRANCIS GROUP"]
"Thieme" -> publications$NPU[publications$NPU == "GEORG THIEME VERLAG KG" |
                           publications$NPU == "THIEME MEDICAL PUBL INC"]
"UNIV CALIFORNIA PRESS" -> publications$NPU[publications$NPU == "UNIV CALIFORNIA PRESS, JOURNALS DIV"]
"Wiley" -> publications$NPU[publications$NPU == "WILEY" | 
                          publications$NPU == "WILEY-V C H VERLAG GMBH"|
                          publications$NPU == "JOHN WILEY & SONS LTD"|
                          publications$NPU == "AMER GEOPHYSICAL UNION"|
                          publications$NPU == "WILEY PERIODICALS, INC"|
                          publications$NPU == "WILEY PERIODICALS"]
"World Scientific" -> publications$NPU[publications$NPU == "WORLD SCIENTIFIC PUBL CO PTE LTD"]


### Save Normalized Data ####
write_csv(publications, fileOut)
