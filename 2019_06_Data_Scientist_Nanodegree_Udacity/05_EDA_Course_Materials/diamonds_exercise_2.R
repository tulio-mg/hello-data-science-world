
library(ggplot2)

data(diamonds)

str(diamonds)

ggplot(aes(x = x, y = price), data = diamonds) +
  geom_point()

with(diamonds, cor.test(x, price, method = 'pearson'))

with(diamonds, cor.test(y, price, method = 'pearson'))

with(diamonds, cor.test(z, price, method = 'pearson'))



ggplot(aes(x = depth, y = price), data = diamonds) +
  geom_point(alpha = 1/100)+
  scale_x_continuous(breaks = seq(43,79,2))

summary(diamonds$depth)

with(diamonds, cor.test(depth, price, method = 'pearson'))

ggplot(aes(x = carat, y = price), data = diamonds) +
  geom_point() +
  scale_x_continuous(limits = c(min(diamonds$carat[diamonds$carat > 0]), quantile(diamonds$carat, 0.99)))+
  scale_y_continuous(limits = c(min(diamonds$price[diamonds$price > 0]), quantile(diamonds$price, 0.99)))

diamonds$volume <- diamonds$x * diamonds$y * diamonds$z

ggplot(aes(x = volume, y = price), data = diamonds)+
  geom_point()+
  scale_x_continuous(limits = c(min(diamonds$volume[diamonds$volume > 0]), quantile(diamonds$volume, 0.99)))

diamonds_volume <- subset(diamonds, volume !=0 & volume < 800)

with(diamonds_volume, cor.test(volume, price, method = 'pearson'))

ggplot(aes(x = volume, y = price), data = diamonds_volume)+
  geom_point(alpha = 1/100)+
  geom_smooth()

summary(diamonds_volume$volume)
                       
library(dplyr)
diamondsByClarity <- diamonds %>% group_by(clarity) %>% summarise(mean_price = mean(price),
                                                                  median_price = median(price),
                                                                  min_price = min(price),
                                                                  max_price = max(price),
                                                                  n = n())

head(diamondsByClarity)
library(dplyr)
library(gridExtra)

diamonds_by_clarity <- group_by(diamonds, clarity)
diamonds_mp_by_clarity <- summarise(diamonds_by_clarity, mean_price = mean(price))
diamonds_by_color <- group_by(diamonds, color)
diamonds_mp_by_color <- summarise(diamonds_by_color, mean_price = mean(price))

p1 <- ggplot(aes(x = reorder(clarity, -mean_price), y = mean_price), data = diamonds_mp_by_clarity)+
  geom_col()
p2 <- ggplot(aes(x = reorder(color, -mean_price), y = mean_price), data = diamonds_mp_by_color)+
  geom_col()
grid.arrange(p1,p2,ncol =1)

?geom_bar
?reorder
diamonds_mp_by_clarity <- arrange(diamonds_mp_by_clarity, desc(mean_price))






