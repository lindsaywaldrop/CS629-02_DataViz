# Some color palettes available in R

# Base R color palette
palette()

#### RColorBrewer package ####
#install.packages("RColorBrewer",dependencies=TRUE)
library(RColorBrewer)

display.brewer.all() # Displays a plot of color palettes available in RColorBrewer
display.brewer.pal(name="BrBG",n=11) # Displays a specific palette by name and specifying a number of colors with n
brewer.pal(name="BrBG",n=11)  # Displays HEX RGB colors of a specific palette

#### colorspace package ####
#install.packages("colorspace",dependencies=TRUE)
library(colorspace)

## Code from the Vignette ##
pal <- function(col, border = "light gray", ...){
  n <- length(col)
  plot(0, 0, type="n", xlim = c(0, 1), ylim = c(0, 1),
       axes = FALSE, xlab = "", ylab = "", ...)
  rect(0:(n-1)/n, 0, 1:n/n, 1, col = col, border = border)
}

# Qualitative Color Palettes
pal(rainbow_hcl(14, start = 30, end = 300), main = "dynamic")
pal(rainbow_hcl(14, start = 60, end = 240), main = "harmonic")
pal(rainbow_hcl(4, start = 270, end = 150), main = "cold")
pal(rainbow_hcl(14, start = 90, end = -30), main = "warm")

# Sequential Color Palettes
pal(sequential_hcl(12, c = 0, power = 2.2))
pal(sequential_hcl(12, power = 2.2))
pal(heat_hcl(12, c = c(80, 30), l = c(30, 90), power = c(1/5, 2)))
pal(terrain_hcl(12, c = c(65, 0), l = c(45, 90), power = c(1/2, 1.5)))
pal(rev(heat_hcl(12, h = c(0, -100), c = c(40, 80), l = c(75, 40),power = 1)))

# Diverging Color Palettes 
pal(diverging_hcl(7))
pal(diverging_hcl(7, c = 100, l = c(50, 90), power = 1))
pal(diverging_hcl(7, h = c(130, 43), c = 100, l = c(70, 90)))
pal(diverging_hcl(7, h = c(180, 330), c = 59, l = c(75, 95)))

# Colorspace's color-vision deficiency simulators
pal(protan(diverging_hcl(7)))  #protan() protanomaly, red-green (missing/defective L cones)
pal(deutan(diverging_hcl(7)))  #deutan() deutanomaly, green-blind/weak (missing/defective M cones)
pal(tritan(diverging_hcl(7)))  #tritan() tritanomaly, blue-yellow (missing/defective S)

# Pick a color palette: 
hcl_palettes(plot = TRUE)

# Use colorspace palettes with ggplot2
ggplot(iris, aes(x = Sepal.Length, fill = Species)) + geom_density(alpha = 0.6) +
  scale_fill_discrete_qualitative(palette = "Dynamic")

#### viridis package ####
#install.packages("viridis",dependencies=TRUE)
library(viridis)

viridis(10,option="D") # Produces HEX values for the viridis color palettes

pal(viridis(10,option="D"))  #viridis palette. All others can be specified thoruhg the option argument.
pal(viridis(10))
pal(magma(10))
pal(inferno(10))
pal(plasma(10))
pal(cividis(10))  

#### wesanderson package ####
#install.packages("wesanderson")
library(wesanderson)

pal(wes_palette("Zissou1", 21, type = "continuous"))  #Based on The Life Aquatic
pal(wes_palette("Darjeeling2", 21, type = "continuous")) # Based on The Darjeeling Limited
pal(wes_palette("FantasticFox1", 21, type = "continuous")) # Based on The Fantastic Mr. Fox


#### tanagR package ####
#install.packages("devtools")
#devtools::install_github("cdanielcadena/tanagR")
# Note: after installation, you might need to restart R! 
library(tanagR)
names(tanagr_palettes)

# Code from tanagR Github ReadMe
pal = tanagr_palette("chrysothlypis_salmoni")
data(iris)
plot(iris$Sepal.Width,
     iris$Sepal.Length,
     col = pal[as.numeric(iris$Species)],
     pch = 19,
     cex = 2)
viz_palette("bangsia_edwardsi")



