#Emily Daskas
#Chris Hoang
#Matthew Nwerem


library('ggplot2')

data(diamonds)

diamonds$average <- ave(diamonds$carat, diamonds$clarity)

newdiamonds <- diamonds[,c(4,11)]

newdiamonds <- unique(newdiamonds)

average <- newdiamonds$average

averageSizeOfPerfectDiamond <- subset(newdiamonds, clarity== "IF")$average

diamonds = subset(diamonds, clarity!="IF")


###Shows percent of diamonds that are greater than the average size of a perfect diamond
ggplot(data=diamonds, aes(x=clarity, fill = (carat>averageSizeOfPerfectDiamond))) +
  geom_bar(position = position_fill()) +
  scale_fill_brewer(labels = c("<= Flawless Diamond", "> Flawless Diamond")) +
  scale_y_continuous(breaks=seq(0,1,.1), labels = scales::percent) +
  labs(title="% of Diamonds Larger than Size of Perfect Diamond",
       x = "Clarity", y = "Percentage of Size", fill = "Diamond Size") + theme_minimal() 


###Shows count of diamonds in each clarity vs count that are greater than the average size of a perfect diamond
ggplot(data=diamonds, aes(x=clarity, fill = (carat>averageSizeOfPerfectDiamond))) +
  geom_bar() +
  scale_y_continuous(breaks=seq(0,15000,2500)) +
  scale_fill_brewer(palette = "Blues", labels = c("<= Flawless Diamond", "> Flawless Diamond")) +
  labs(title="Size of Diamonds Compared to Average Size a Perfect Diamond",
       x = "Clarity", y = "Diamond Count", fill = "Diamond Size (Carats)") + theme_minimal() 



dodge <- position_dodge(width = 1)
###Shows count of diamonds in each clarity vs count that are greater than the average size of a perfect diamond
ggplot(data=diamonds, aes(x=clarity, fill = (carat>averageSizeOfPerfectDiamond))) +
  geom_bar(position = dodge, color = "black")+
  scale_fill_brewer(palette = "Blues", labels = c("<= Flawless Diamond", "> Flawless Diamond")) +
  geom_text(position = dodge, stat='count', aes(label=..count..), vjust=-1, size = 2.5) +
  labs(title="Size of Diamond Compared to a Flawless Diamond",
       x = "Clarity", y = "Diamond Count", fill = "Diamond Size (Carats)") + theme_minimal() 



#bar plot showing average sizes of diamonds
ggplot(newdiamonds, aes(clarity, average)) + 
  geom_bar(stat = "identity", aes(fill = clarity), color = "black") +
  scale_fill_brewer(palette = "Blues", direction=-1) + 
  labs(title="Average Size (Carats) of Diamonds",
       x = "Clarity", y = "Carats") + theme_minimal()



### BAD GRAPH
ggplot(data=diamonds, aes(x=clarity)) +
  geom_bar(aes(fill = clarity), color = "black") +
  scale_fill_brewer(palette = "Blues", direction=-1)+
  geom_text(stat='count', aes(label=..count..), vjust=-.5) +
  labs(title="Diamonds Larger than Flawless Diamonds",
       x = "Clarity", y = "Diamond Count") + theme_minimal()




#Heatmaps are a bad graph to do w/ large data sets (R doesnt like them!!)
diamonds$volume = (diamonds$x*diamonds$y*diamonds$z)
heatmap = ggplot(diamonds, aes(carat, volume, color= clarity)) + 
  geom_point() +
  xlim(0.25,.80) +
  ylim(40,140)

heatmap


heatmap2 = ggplot(diamonds, aes(carat, volume, color= clarity)) + 
  geom_point() +
  xlim(0.7,.8) +
  ylim(120,140)

heatmap2

# Violin plots
rm(list=ls())
dataDiamonds <- diamonds
volume = dataDiamonds$x * dataDiamonds$y * dataDiamonds$z
dataDiamonds['volume']= volume

#Bad plot. Standard plotting of carat separated by inclusions
ggplot(dataDiamonds) + 
  geom_point(aes(x=clarity, y=carat), color='black')

#Still bad plot but bit better. Standard plotting of carat vs volume
ggplot(dataDiamonds) + 
  geom_point(aes(x=volume, y=carat), color='black')

#Not bad. Carat vs volume. Flawless diamonds are in red
Flawless <- filter(dataDiamonds, clarity == 'IF')
ggplot(dataDiamonds) + 
  geom_point(aes(x=volume, y=carat), color='black') + 
  geom_point(data = Flawless, aes(x=volume, y=carat), color='red')

#Violin plot of carat separated by inclusion. Red is mean, blue is median
ggplot(dataDiamonds, aes(x=clarity, y=carat)) + geom_violin() +
  stat_summary(fun.y = mean, geom="point", shape=23, size=3, color ='red') +
  stat_summary(fun.y = median, geom="point", shape=23, size=3, color = 'blue') + theme_minimal()


volume = dataDiamonds$x * dataDiamonds$y * dataDiamonds$z
dataDiamonds['volume']= volume

# Really BAD plot: Violin plot of diamond volume separated by inclusion. Outlier makes it hard to gain any meaning
ggplot(dataDiamonds, aes(x=clarity, y=volume)) + geom_violin() +
  stat_summary(fun.y = mean, geom="point", shape=23, size=3, color ='red') +
  stat_summary(fun.y = median, geom="point", shape=23, size=3, color = 'blue') + theme_minimal()

# A bit better: Violin plot of diamond volume separated by inclusion.
dataDiamonds = subset(dataDiamonds, volume<=1000)
ggplot(dataDiamonds, aes(x=clarity, y=volume)) + geom_violin() +
  stat_summary(fun.y = mean, geom="point", shape=23, size=3, color ='red') +
  stat_summary(fun.y = median, geom="point", shape=23, size=3, color = 'blue') + theme_minimal()