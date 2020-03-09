#Group: Raul, Charlie, Iris
#Q2) What is the distribution of price per carat of the diamonds in this set? Ch 7
dia = data(diamonds)
summary(diamonds)
diamonds$pricepercarat <- diamonds$price/diamonds$carat
ggplot(data=diamonds, aes(diamonds$pricepercarat)) + geom_histogram()
ggplot(data=diamonds, aes(diamonds$pricepercarat)) + geom_histogram(bins="5") 
ggplot(data=diamonds, aes(diamonds$pricepercarat)) + geom_histogram(bins="10") 
ggplot(data=diamonds, aes(diamonds$pricepercarat)) + geom_histogram(bins="40") 
ggplot(data=diamonds, aes(diamonds$pricepercarat)) + geom_density()
ggplot(data=diamonds, aes(diamonds$pricepercarat)) + geom_density(bw=5)
ggplot(data=diamonds, aes(diamonds$pricepercarat)) + geom_density(bw=1)
ggplot(data=diamonds, aes(diamonds$pricepercarat)) + geom_density(bw=100)
ggplot(data=diamonds, aes(diamonds$pricepercarat)) + geom_density(bw=500)
ggplot(data=diamonds, aes(x=diamonds$pricepercarat, fill=diamonds$cut)) + geom_histogram()
ggplot(data=diamonds, aes(x=diamonds$pricepercarat, fill=diamonds$cut)) + geom_density(alpha=0.2)
ggplot(data=diamonds, aes(x=pricepercarat, group=cut, full=cut)) + geom_density(adjust=1.5,position="fill")
