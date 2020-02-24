# Qualitative color examples with ggplot2
library(ggplot2)
library(reshape2)
library(colorspace)
library(RColorBrewer)
library(wesanderson)

#### Nominal info coding ####
phones<-melt(WorldPhones) # Melt WorldPhones data set into a data frame

# Nominal coding with ggplot2 default color palette
baseplot<-ggplot(phones,aes(x=Var1,y=value,fill=Var2)) +  # Sets aesthetics 
  geom_point(aes(fill=Var2),color="black",size=4,shape=21) +  # specifies mapping
  xlab("Year") + ylab("No. of phones") + labs(fill="Regions") +
  theme_bw()   # Sets background to white and lines to black

# Nominal coding with custom color palette
mypalette<-rainbow_hcl(7, start = 270, end = 150) # Define your color palette
mypalette<-palette()
mypalette<-c("red","yellow","green","darkblue","orange","purple","white")

baseplot + scale_fill_manual(values=mypalette)

# with RColorBrewer
baseplot + scale_fill_brewer(palette = "Dark2")

# with wesanderson
baseplot + scale_fill_manual(values=wes_palette(name="BottleRocket1"))


# Change background to dark and add high-contrast border around points
ggplot(phones,aes(x=Var1,y=value,fill==Var2)) +  
  geom_point(aes(fill=Var2),color="white",size=4,shape=21) +  
  scale_fill_manual(values=mypalette) +
  theme(panel.background = element_rect(fill="black",color="black"),
        panel.grid.major = element_line(color="gray30"),
        panel.grid.minor = element_line(color="gray20"))

# Nominal coding where one code stands out
mypalette<-c(rainbow_hcl(5, start = 270, end = 150),"red") # cool color palette with red

ggplot(mtcars,aes(x=disp,y=mpg,fill=factor(carb))) +  # Sets aesthetics 
  geom_point(aes(fill=factor(carb),color=factor(carb)),size=4,shape=21) +  # specifies mapping
  theme_bw() + # Sets background to white and lines to black
  scale_fill_manual(values=mypalette) + scale_color_manual(values=mypalette)




