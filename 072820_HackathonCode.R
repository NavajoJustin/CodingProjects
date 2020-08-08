install.packages("rlang")
library(rlang)
library(tidyverse)
library(dplyr)
library(tidyr)

#Importing the data of the Pizza Prices from the MTA stations and renaming as MTA variable
library(readxl)
X072020NYCMTAJuly2014 <- read_excel("~/College/Summer_2020/Data Science with Dr Valencia/Hackathon Materials/072020NYCMTAJuly2014.xlsx")
View(X072020NYCMTAJuly2014)
MTA <- (X072020NYCMTAJuly2014)
View(MTA)

#Importing the data of the Pizza Prices from the MTA stations and renaming as P3 variable
library(readxl)
X072020_PizzaPricePlaces_Hackathon <- read_excel("~/College/Summer_2020/Data Science with Dr Valencia/Hackathon Materials/072020_PizzaPricePlaces_Hackathon.xlsx")
View(X072020_PizzaPricePlaces_Hackathon)
P3 <- (X072020_PizzaPricePlaces_Hackathon)
View(P3)

#Isolating the places where Pizza Principle hold true with a fare ticket at exactly $2.50 for the mean prices
PizzaPrincipleTrue <- {P3 %>%
    filter(Mean == "2.5")}
View(PizzaPrincipleTrue)

#Isolating the places where Pizza Principle does not hold true with a fare ticket at exactly $2.50 for the mean prices
PizzaPrincipleFalse <- {P3 %>%
    filter(Mean != "2.5")}
View(PizzaPrincipleFalse)

MTA_Summarized <- summary(MTA)
MTA_Summary <- head(MTA_Summarized)
View(MTA_Summary)

is.na(MTA)

#We need to count the number of days missing
MTA %>%
  #group_by() %>%
  select(everything()) %>%
  summarise_all(funs(sum(is.na(.)))) %>%
  pivot_longer(cols = 1:13, names_to = 'columns', values_to = 'NA_count') %>%
  arrange(desc(NA_count)) %>%
  ggplot(aes(y = columns, x = NA_count)) + geom_col(fill = '#F0E442') +
  geom_label(aes(label = NA_count)) +
  #   scale_fill_manual(values = c("darkorange","purple","cyan4")) +
  theme_minimal() +
  labs(title = 'MTA Stations W/ The Missing Days of Ticket Sales',
       x = "Number of Days Missing Ticket Sales",
       y = "MTA Station")

#Boxplot of Ticket Sales
boxplot(MTA[,1:13],las=2)
  

#Transforming Data into CVS files (optional for means)
write_csv(MTA, "MTA_csv.csv")
MTA_cvs <- read.csv(file = "MTA_csv.csv")
View(MTA_cvs)

#Standardizing the difference in days across the stations by using a ticket sold per day approach. 
#Code Explanation: 'colMeans' is function to calculate the column means, need to redefine the 'MTA' as 'x', 'na.rm = TRUE' removes NA values from calculation)
x <- (MTA)
MTA_TicketAvgPerDay <- colMeans(x, na.rm = TRUE, dims = 1)
View(MTA_TicketAvgPerDay)

