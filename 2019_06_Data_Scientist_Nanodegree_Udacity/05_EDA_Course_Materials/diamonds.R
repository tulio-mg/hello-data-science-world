
library(ggplot2)
data(diamonds)
summary(diamonds)
by(diamonds$cut, diamonds$color, summary)

diamonds$color

?diamonds
?subset
subset(diamonds, diamonds$color == 'D')

library(gridExtra)
p1 <- ggplot(aes(x = subset(diamonds, diamonds$color == 'D')$cut), data = subset(diamonds, diamonds$color == 'D')) +
  ge)om_bar()
p2 <- ggplot(aes(x = subset(diamonds, diamonds$color == 'E')$cut), data = subset(diamonds, diamonds$color == 'E')) +
  geom_bar()
grid.arrange(p1, p2, ncol=2)
p3 <- ggplot(aes(x = subset(diamonds, diamonds$color == 'F')$cut), data = subset(diamonds, diamonds$color == 'F')) +
  geom_bar()
grid.arrange(p1, p2, ncol=2)
p4 <- ggplot(aes(x = subset(diamonds, diamonds$color == 'G')$cut), data = subset(diamonds, diamonds$color == 'G')) +
  geom_bar()
grid.arrange(p1, p2, ncol=2)
p5 <- ggplot(aes(x = subset(diamonds, diamonds$color == 'H')$cut), data = subset(diamonds, diamonds$color == 'H')) +
  geom_bar()
grid.arrange(p1, p2, ncol=2)
p6 <- ggplot(aes(x = subset(diamonds, diamonds$color == 'I')$cut), data = subset(diamonds, diamonds$color == 'I')) +
  geom_bar()
grid.arrange(p1, p2, ncol=2)
p7 <- ggplot(aes(x = subset(diamonds, diamonds$color == 'J')$cut), data = subset(diamonds, diamonds$color == 'J')) +
  geom_bar()
grid.arrange(p1, p2,p3, p4, p5, p6, p7, ncol=3)


ggplot(aes(x = diamonds$price), data = diamonds) +
  geom_histogram()

summary(diamonds$price)


length(diamonds[diamonds$price < 500, ]$price)

length(subset(diamonds$price, diamonds$price < 500))
length(subset(diamonds$price, diamonds$price < 250))
length(subset(diamonds$price, diamonds$price >= 15000))

ggplot(aes(x = diamonds$price), data = diamonds) +
  geom_histogram(binwidth = 1, color = 'black', fill = '#F79420') +
  scale_x_continuous(limits = c(0, 2000), breaks = seq(0, 2000, 50))

?geom_histogram

qplot(x = price, y = price, 
      data = subset(diamonds, diamonds$price < 2000),
      geom = 'boxplot')+
  coord_cartesian(ylim = c(0,2000))


summary(diamonds$cut)
p1 <- ggplot(aes(x = price), data = subset(diamonds, diamonds$cut == 'Fair')) +
  geom_histogram(binwidth = 50, color = 'blue', fill = '#F79420') +
  scale_x_continuous(limits = c(0,2000), breaks = seq(0,2000, 100)) +
  xlab('Fair')
p2 <- ggplot(aes(x = price), data = subset(diamonds, diamonds$cut == 'Good')) +
  geom_histogram(binwidth = 50, color = 'blue', fill = '#F79420') +
  scale_x_continuous(limits = c(0,2000), breaks = seq(0,2000, 100)) +
  xlab('Good')
p3 <- ggplot(aes(x = price), data = subset(diamonds, diamonds$cut == 'Very Good')) +
  geom_histogram(binwidth = 50, color = 'blue', fill = '#F79420') +
  scale_x_continuous(limits = c(0,2000), breaks = seq(0,2000, 100)) +
  xlab('Very Good')
p4 <- ggplot(aes(x = price), data = subset(diamonds, diamonds$cut == 'Premium')) +
  geom_histogram(binwidth = 50, color = 'blue', fill = '#F79420') +
  scale_x_continuous(limits = c(0,2000), breaks = seq(0,2000, 100)) +
  xlab('Premium')
p5 <- ggplot(aes(x = price), data = subset(diamonds, diamonds$cut == 'Ideal')) +
  geom_histogram(binwidth = 50, color = 'blue', fill = '#F79420') +
  scale_x_continuous(limits = c(0,2000), breaks = seq(0,2000, 100)) +
  xlab('Ideal')
grid.arrange(p1,p2,p3,p4,p5, ncol = 2)

by(diamonds$price, diamonds$cut, summary)

ggplot(aes(x = diamonds$price), data = diamonds) +
  geom_histogram(binwidth = 50, color = 'blue', fill = '#F79420') +
  scale_x_continuous(limits = c(0, 2000), breaks = seq(0, 2000, 100))+
  facet_wrap(~cut, ncol = 2, scales = 'free_y')

?face_wrap
qplot(x = price, data = diamonds) + facet_wrap(~cut)

ggplot(aes(x = price/carat), data = diamonds) +
  geom_histogram(color = 'blue', fill = '#F79420') +
  scale_x_log10()+
  facet_wrap(~cut, ncol = 5, scales = 'free_y')


diamonds$pricecarat <- diamonds$price / diamonds$carat

qplot(x = cut, y = price, data = diamonds,
      geom = 'boxplot')

qplot(x = clarity, y = price, data = diamonds,
      geom = 'boxplot')

qplot(x = color, y = pricecarat, data = diamonds,
      geom = 'boxplot')
ggsave('teste.png')

by(diamonds$price, diamonds$color, summary)

4214-911

7695-1860

IQR(subset(diamonds, price <1000)$price)
  
rm(Boxplot_color_pricecarat)


ggplot(aes(x = carat, y = count.fields()), data = diamonds)) +
  geom_freqpoly() + 
  ##scale_x_continuous() + 
  ##scale_x_log10() +
  xlab('Carat') + 
  ylab('Count')

ggplot(aes(price, colour = cut), data = diamonds) +
  geom_freqpoly(binwidth = 500)

ggplot(aes(carat), data = diamonds) +
  geom_freqpoly(binwidth = .05)+
  scale_x_continuous(breaks = seq(0,2,0.1))+
    coord_cartesian(ylim = c(2000,20000))

table(diamonds$carat)

ggplot(aes(x = price), data = diamonds) +
  geom_histogram(aes(color = cut))+
  scale_x_log10()+
  facet_wrap(~color)


ggplot(aes(x = table, y = price), data = diamonds)+
  geom_point(aes(color = cut))+
  scale_x_continuous(limits = c(50,80), breaks = seq(50,80,1))

diamonds <- transform(diamonds, volume = x * y * z)

ggplot(aes(x = volume, y = price), data = subset(diamonds, volume < quantile(volume, 0.99)))+
  geom_point(aes(color = clarity), alpha = 0.25)+
  scale_color_brewer(type='div')+
  scale_y_log10()


ggplot(aes(x = cut, y = price/carat), data = diamonds)+
  geom_point(aes(color = color), alpha = 0.25, position = position_jitter(h = 2))+
  scale_color_brewer(type='div')+
  facet_wrap(~clarity)







