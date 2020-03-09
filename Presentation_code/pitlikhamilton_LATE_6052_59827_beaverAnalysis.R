library(ggplot2)
library(colorspace)
data(beavers)
# Ch 13 Wilke - Time series Data
# https://serialmentor.com/dataviz/time-series.html
# Different possibilities how to graph it with different emphasis
# What type of data they are and how they can be used
# 5-10 minutes
# Does the body temperative vary with time?
# Due monday

df <-beaver2
df1 <- beaver1
df1$idx <- c(1:114)
df$idx <- c(1:100)

df$beav <- "beaver2"
df1$beav <- "beaver1"
beavz<-rbind(df, df1)
beavz$activ = factor(beavz$activ)
beavz$day = factor(beavz$day)

# Regular ol' plot
ggplot(df, aes(idx, temp)) + geom_point()+
  ggtitle("Beaver 2 Temperature vs Time") +
  xlab("Time")+
  ylab("Temperature (C)")

ggplot(df1, aes(idx, temp)) + geom_point()+
  ggtitle("Beaver 1 Temperature vs Time") +
  xlab("Time")+
  ylab("Temperature (C)")
  
ggplot(beavz, aes(idx, temp,color = beav)) + geom_point()+
  facet_grid(beav~.)+
  geom_line()+
  xlab("Time")+
  ylab("Temperature (C)")

ggplot(beavz, aes(idx, temp,color = beav)) +
  geom_line()+
  facet_grid(beav~.)+
  xlab("Time")+
  ylab("Temperature (C)")

#Bad Examples
#both samples plotted on one graph with no legend
ggplot(beavz, aes(idx, temp)) +
  geom_point()

ggplot(beavz, aes(idx, temp, color = beav)) +
  scale_color_manual(values = c("black", "black")) +
  geom_line()

ggplot(beavz, aes(idx, temp, color = beav)) +
  geom_line()

ggplot(beavz, aes(beav))+
  geom_bar(aes(fill = activ))+
  scale_fill_manual(values = c('#57D7BF','#FEBDCF'))+
  ggtitle("Beaver Class by Activity")
  

save.image("temp_over_time.png")

# Color by activity
df$activ <- as.factor(df$activ)
ggplot(df, aes(idx, temp)) +
  geom_point(aes(fill=activ, color=activ)) +
  scale_color_manual(values=c("springgreen4", "orangered4")) +
  xlab("time (10 sec intervals)") +
  ggtitle("Temperature over time")
save.image("temp_by_activity.png")


ggplot(beavz, aes(idx, temp)) +
  geom_point(aes(fill=activ, color=activ)) +
  scale_color_manual(values=c("springgreen4", "orangered4")) +
  facet_grid(. ~ beav) +
  xlab("time (10 sec intervals)") +
  ggtitle("Temperature over time for two sets of beavers")
save.image("Temp_by_type_and_beaver.png")


# Adding trend line
ggplot(df, aes(idx, temp)) +
  geom_point(aes(fill=activ, color=activ)) +
  scale_color_manual(values=c("springgreen4", "orangered4")) +
  xlab("time (10 sec intervals)") +
  ggtitle("Temperature over time") + geom_smooth(method = "lm")


ggplot(beavz, aes(idx, temp)) +
  geom_point(aes(fill=activ, color=activ)) +
  scale_color_manual(values=c("springgreen4", "orangered4")) +
  facet_grid(. ~ beav) +
  xlab("time (10 sec intervals)") +
  ggtitle("Temperature over time for two sets of beavers") +
  geom_smooth(method = "lm")
save.image("Temp_by_type_and_beaver_trend.png")

# Active vs non active
ggplot(beavz[beavz$activ == 1,], aes(idx, temp)) +
  geom_point(aes(fill=activ, color=activ)) +
  scale_color_manual(values=c("springgreen4", "orangered4")) +
  facet_grid(. ~ beav) +
  xlab("time (10 sec intervals)") +
  ggtitle("Temperature over time for two sets of active beavers") +
  geom_smooth(method = "lm")

ggplot(beavs_inactive, aes(idx, temp)) +
  geom_point(aes(fill=activ, color=activ)) +
  scale_color_manual(values=c("springgreen4", "orangered4")) +
  facet_grid(. ~ beav) +
  xlab("time (10 sec intervals)") +
  ggtitle("Temperature over time for two sets of inactive beavers") +
  geom_smooth(method = "lm")