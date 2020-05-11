getwd()
setwd('C:/Users/Tulio/Documents/Cursos/Udacity/Nanodegree_Data_Scientist/EDA_Course_Materials/')

pf <- read.csv('pseudo_facebook.tsv', sep = '\t')
str(pf)

pf <- transform(pf, prop_initiated = friendships_initiated / friend_count)

summary(pf$prop_initiated)

pf$year_joined <- floor(2014 - (pf$tenure / 365))
pf$year_joined.bucket <- cut(pf$year_joined, breaks = c(2004, 2009, 2011, 2012, 2014))

ggplot(aes(x = tenure, y = prop_initiated), data = pf)+
  geom_line(aes(color = year_joined.bucket), stat = 'summary', fun.y = median)


ggplot(aes(x = 25*round(tenure/25), y = prop_initiated), data = pf)+
  geom_line(aes(color = year_joined.bucket), stat = 'summary', fun.y = median)

ggplot(pf, aes(x=tenure, y=prop_initiated, color=year_joined.bucket)) +
  geom_smooth(na.rm=TRUE)

summary(subset(pf, year_joined.bucket == '(2012,2014]')$prop_initiated)


