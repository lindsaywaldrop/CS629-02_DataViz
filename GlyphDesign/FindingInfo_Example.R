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

