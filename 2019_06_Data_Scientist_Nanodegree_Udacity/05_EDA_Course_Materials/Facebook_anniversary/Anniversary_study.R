getwd()
setwd("C:/Users/Tulio/Documents/Cursos/Udacity/Nanodegree_Data_Scientist/EDA_Course_Materials/Facebook_anniversary")

calendar1 <- read.csv('1.csv')
calendar2 <- read.csv('2.csv')
calendar3<-read.csv('3.csv')
calendar4<-read.csv('4.csv')
calendar5<-read.csv('5.csv')
calendar6<-read.csv('6.csv')
calendar7<-read.csv('7.csv')
calendar8<-read.csv('8.csv')

library(dplyr)

calendar <- bind_rows(calendar1,calendar2,calendar4,calendar5,calendar6,calendar7,calendar8)

calendar <- filter(calendar, End != 'Total:')

calendar$date <- as.Date(calendar$Start, format = '%m/%d/%Y')

calendar <- calendar[1:4]

calendar <- select(calendar, Title, date)

calendar <- calendar[grep('Aniv', calendar$Title),]

calendar <- arrange(calendar, date)

subset(calendar, date == '2019-08-08')

calendar$month <- format(calendar$date, '%m')

monthsum <- calendar %>% group_by(month) %>%  summarise(n = n())

daysum <- calendar %>% group_by(date) %>% summarise(n = n())
