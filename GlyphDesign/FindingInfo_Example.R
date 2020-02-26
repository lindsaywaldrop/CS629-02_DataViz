library(ggplot2)

# Example for group work #1, highlighting only versicolor with color (red vs black for others)
ggplot(iris, aes(Sepal.Width,Sepal.Length,color=Species,fill=Species)) + 
  geom_point(aes(color=Species,fill=Species),shape=21) + 
  scale_fill_manual(values=c("black","red","black")) + 
  scale_color_manual(values=c("black","red","black"))

# Example for group work #2, highlighting versicolor with color and shape 
# among other two with unique shapes and same color
ggplot(iris, aes(Sepal.Width,Sepal.Length,color=Species,fill=Species,shape=Species)) + 
  geom_point(aes(color=Species,fill=Species,shape=Species)) + 
  scale_fill_manual(values=c("gray10","red","black")) + 
  scale_color_manual(values=c("black","red","black"))

# Example of a graph with integral display dimensions
library(ggforce)

iris$x<-c(seq(1,sum(iris$Species=="setosa")),
          seq(1,sum(iris$Species=="versicolor")),
          seq(1,sum(iris$Species=="virginica")))

iris$y<-c(rep(1,sum(iris$Species=="setosa")),
          rep(2,sum(iris$Species=="versicolor")),
          rep(3,sum(iris$Species=="virginica")))

scale<-function(data){
  data_scaled=(data-min(data))/(max(data)-min(data))
  return(data_scaled)
}

# Graphs species on y axis and individual on x axis. 
# Sepal length is x axis of ellipse, sepal width is y axis of ellipse. 
ggplot(iris,aes(x0=x,y0=y,a=scale(Sepal.Length)/2,b=scale(Sepal.Width)/2,angle=0)) + 
  geom_ellipse(fill="black") + coord_fixed()

