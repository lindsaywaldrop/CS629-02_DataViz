# Color for Maps 
library(ggplot2)
library(reshape2)
library(dplyr)  # required for arrange()
library(colorspace)
library(viridis)
library(maps) # for the state map data

#### Contour maps ####
# Filled contour maps for ggplot2
boom<-melt(volcano)
range(boom$value) # Check out the range of values to pick scale breaks

boom$levels<-cut(boom$value,breaks=c(90,100,125,150,175,200)) # create breaks in values
boom$levels<-cut(boom$value,breaks=seq(90,200,by=10))

colors_surface<-terrain_hcl(nlevels(boom$levels), c = c(65, 0), l = c(45, 90), power = c(1/2, 1.5)) # Create color
#colors_surface<-sequential_hcl(nlevels(boom$levels), c = 0, l=c(30,90), power = 2.0)
colors_surface<-viridis(nlevels(boom$levels))

ggplot(boom,aes(Var1,Var2)) + xlab(" ") + ylab(" ") +
  geom_tile(aes(fill=levels)) + 
  scale_fill_manual("surface",values=colors_surface)


# required packages

states_map<-map_data("state") #extracts data from the states map

# Make a data set of US crime data from the USArrests data set
crimes<-data.frame(state=tolower(rownames(USArrests)),USArrests)
crime_map<-merge(states_map,crimes,by.x="region",by.y="state")
crime_map<-arrange(crime_map,group,order)
head(crime_map)

# Plot make of murder rate. You can select any column in that 
basemap<-ggplot(crime_map,aes(x=long,y=lat,group=group,fill=Murder)) +
  geom_polygon() + coord_map("polyconic") 

# Color map sequential increasing with colorspace
basemap + scale_fill_continuous_sequential(palette="Peach")

# Color map diverging from the midpoint (mean murder rate) with colorspace 
basemap + scale_fill_continuous_diverging(palette="Blue-Red",mid=mean(crime_map$Murder))
