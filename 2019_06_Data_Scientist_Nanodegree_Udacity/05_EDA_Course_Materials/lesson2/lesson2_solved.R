reddit <- read.csv('reddit.csv')

table(reddit$employment.status)
summary(reddit)

str(reddit)
levels(reddit$age.range)

library(ggplot2)
qplot(data = reddit, x = age.range)

qplot(data = reddit, x = income.range)

?factor
reddit$age.range <- factor(x = reddit$age.range, levels = c('Under 18', '18-24', '25-34', '35-44', '45-54', '55-64', '65 or Above', 'NA'), ordered = TRUE)
reddit$age.range <- ordered(reddit$age.range, levels = c('Under 18', '18-24', '25-34', '35-44', '45-54', '55-64', '65 or Above', 'NA'))
