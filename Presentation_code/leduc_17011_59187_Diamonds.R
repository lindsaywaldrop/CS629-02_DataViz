library(datasets)
library(ggplot2)
library(reshape2)
library(tidyverse)
library(RColorBrewer)
library(corrgram)

data(diamonds)
attach(diamonds)
names(diamonds)
melt(diamonds)

# x = length. y = width. z = depth.
summary(diamonds)
cor = c()
cat = c("carat","depth","table","x","y","z")
n = seq(0,7,1)

for (i in cat){
  c = cor(diamonds[i],price)
  cor = append(cor,c,after=length(cor))
}

plot1 = ggplot(diamonds, aes(x = carat, y = price)) + 
  geom_point(alpha = 0.5, size = 1, position = 'jitter',aes(color=color)) +
  geom_smooth() +
  scale_color_brewer(type = 'div',
                     guide = guide_legend(title = 'Color', reverse = F,
                                          override.aes = list(alpha = 1, size = 2)))

plot2 = ggplot(diamonds, aes(x = log(carat), y = log(price))) +
  geom_point(alpha = 0.5, size = 1, position = 'jitter', aes(color = clarity))+
  geom_smooth() +
  scale_color_brewer(type = 'div')

plot3 = ggplot(diamonds, aes(x = depth, y = price)) + 
  geom_point(alpha = 0.5, size = 1, position = 'jitter',aes(color=color)) +
  geom_smooth() +
  scale_color_brewer(type = 'div',
                     guide = guide_legend(title = 'Color', reverse = F,
                                          override.aes = list(alpha = 1, size = 2)))
plot4 = ggplot(diamonds, aes(x = table, y = price)) + 
  geom_point(alpha = 0.5, size = 1, position = 'jitter',aes(color=clarity)) +
  geom_smooth() +
  scale_color_brewer(type = 'div',
                     guide = guide_legend(title = 'Color', reverse = F,
                                          override.aes = list(alpha = 1, size = 2)))
plot5 = ggplot(diamonds, aes(x = z, y = price)) + 
  geom_point(alpha = 0.5, size = 1, position = 'jitter',aes(color=color)) +
  geom_smooth() +
  scale_color_brewer(type = 'div',
                     guide = guide_legend(title = 'Color', reverse = F,
                                          override.aes = list(alpha = 1, size = 2)))