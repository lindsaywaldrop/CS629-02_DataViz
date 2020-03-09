#Riley Kendall, Ryan Richardson, Goldie Malamud
#Scroll to bottom for graph examples

library(ggplot2)
library(ggforce)

# Beaver Processing
b1 = beaver1
b2 = beaver2
b1$activ = factor(b1$activ)
b2$activ = factor(b2$activ)

# changes time to be more meaningful measure of how many hours since start of mesaurement
b1$hours <- b1$time %/% 100 + 24 * (b1$day - b1$day[1]) + (b1$time %% 100) / 60
b2$hours <- b2$time %/% 100 + 24 * (b2$day - b2$day[1]) + (b2$time %% 100) / 60

# identifies beaver prior to appending data
b1$beaver = 1
b2$beaver = 2

# converts day to factor for easier comparisons
b1$day = factor(b1$day, labels = c("Day 1", "Day 2"))
b2$day = factor(b2$day, labels = c("Day 1", "Day 2"))

# combines into single beaver dataframe and makes beaver a factor
beavers = rbind(b1, b2)
beavers$beaver = factor(beavers$beaver)

# prints beaver head
head(beavers)

beavers$activ = factor(beavers$activ)
fit = glm(temp ~ hours + activ, data = beavers)
summary(fit)



#GRAPHS



#misleading graph
badGraph = ggplot(beavers, aes(x = hours, y = temp, fill = activ, color = 'black', shape = beaver)) +
    geom_point(aes(fill = activ, color = 'black', size = 0.1, shape = beaver)) +
    scale_shape_manual(values = c(24, 22)) +
    scale_fill_manual(values = c('coral1', 'coral2')) +
    scale_color_manual(values = c('black', 'black')) +
    guides(size = FALSE, color = FALSE) +
      ggtitle("Temp vs Time - BAD ") +
      xlab("Time") +
      ylab("Temp") +
      theme(plot.title = element_text(hjust = 0.5)) +
      labs(shape = "Beaver", fill = 'Activity')

badGraph

#Complicated graph
ComplicatedGraph = ggplot(beavers, aes(x = hours, y = temp, fill = activ, color = 'black', shape = beaver)) +
    geom_point(aes(fill = activ, color = 'black', size = 0.1, shape = beaver)) +
    scale_shape_manual(values = c(24, 22)) +
    scale_fill_manual(values = c('coral1', 'cyan3')) +
    scale_color_manual(values = c('black', 'black')) +
    guides(size = FALSE) +
    guides(color = FALSE) +
    stat_smooth(method = 'glm') +
      ggtitle("Temp vs Time - Ugly") +
      xlab("Time") +
      ylab("Temp") +
      theme(plot.title = element_text(hjust = 0.5)) +
      labs(shape = "Beaver", fill = "Activity")

ComplicatedGraph


fit1 = glm(temp ~ hours + activ, data = b1)
summary(fit1)

goodGraph1 = ggplot(b1, aes(x = hours, y = temp, fill = activ)) +
    geom_point(aes(fill = activ, size = 0.1)) +
    scale_fill_manual(values = c('coral1', 'cyan3')) +
    stat_smooth(method = 'glm') +
      ggtitle("Temp vs Time - Beaver 1") +
      guides(size = FALSE) +
      xlab("Time") +
      ylab("Temp") +
      theme(plot.title = element_text(hjust = 0.5)) +
      labs(fill = "Activity")

goodGraph1


fit2 = glm(temp ~ hours + activ, data = b1)
summary(fit2)

goodGraph2 = ggplot(b2, aes(x = hours, y = temp, fill = activ)) +
    geom_point(aes(fill = activ, size = 0.1)) +
    scale_fill_manual(values = c('coral1', 'cyan3')) +
    stat_smooth(method = 'glm') +
      ggtitle("Temp vs Time - Beaver 2") +
      guides(size = FALSE) +
      xlab("Time") +
      ylab("Temp") +
      theme(plot.title = element_text(hjust = 0.5)) +
      labs(fill = "Activity")

goodGraph2