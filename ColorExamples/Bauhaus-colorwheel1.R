library(ggplot2)

colorpalette=c(
  "#FFFFFF","#FFFFAA","#FFFF55","#FFFF00", #yellow
  "#FFFFFF","#DDFFAA","#BBFF55","#ADFF2F", #yellow-green
  "#FFFFFF","#AAFFAA","#55FF55","#00FF00", #green
  "#FFFFFF","#B7FFFF","#55FEFE","#00FFFF", #blue-green
  "#FFFFFF","#AAAAFF","#5555FF","#0000FF", #blue
  "#FFFFFF","#DFC4F7","#B683E5","#8A2BE2", #blue-violet
  "#FFFFFF","#DBBAF0","#C47DF1","#A020F0", #purple
  "#FFFFFF","#F6D8EB","#EE95CE","#D02090", #red-violet
  "#FFFFFF","#FFAAAA","#FF5555","#FF0000", #red
  "#FFFFFF","#FEBBB0","#FF6B52","#FF2400", #red-orange
  "#FFFFFF","#FFD2A6","#FFA041","#FF7F00", #orange
  "#FFFFFF","#FEF0B6","#FFDB4A","#FFCC00" #yellow-orange
)

xvalues<-rep(seq(0, 2*pi-pi/6,by=(pi/6)), 4)
xvalues<-rep(seq(30, 360,by=30), 4)
xvalues<-xvalues[order(xvalues)]
yvalues<-rep(c(0.5,1.5,2.5,3.5),length=length(xvalues))
#yvalues<-yvalues[sort(yvalues)]
df <- data.frame(
  x = xvalues,
  y = yvalues,
  z = factor(1:length(xvalues))
  #w = rep(diff(c(0, 4, 6, 8, 10, 14)), 2)
)
ggplot(df, aes(x, y)) +
  geom_tile(aes(fill = z), colour = "grey50")+
  scale_fill_manual(values=colorpalette)+
  theme_void()+
  theme(legend.position = "none")+
  coord_polar()