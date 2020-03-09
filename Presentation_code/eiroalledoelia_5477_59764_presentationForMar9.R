#what propotion of diamons in the set are of each cut, does this change with clarity?

#bring several graphs with you fo a week from monday to present in class, Be prepared to present:
# examples of graphs 
# explain graphing choices 
# how does it follow OCAR
# provide code to the rest of the class

---
title: "Presentation for March 9th"
author: "Lily Foster & Elia Eiroa"
date: "3/9/2020"
output: html_document
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


# Use the diamonds data set to answer the following questions:
#   3. What proportion of diamonds in the set are each cut? Does this change with clarity? (Ch. 10)
# 
# Bring several graphs with you for a week from today (Mon 3/9) to present in class. Be prepared to present:
#   a) Examples of your graphics answering each question.
# b) Explain the graphing choices you made for each (how does it follow OCAR?).
# c) Provide code to the rest of the class reproducing your graphs.
# 

```{r}
#https://www.kaggle.com/shivam2503/diamonds

# price price in US dollars (\$326--\$18,823)
# carat weight of the diamond (0.2--5.01)
# cut quality of the cut (Fair, Good, Very Good, Premium, Ideal)
# color diamond colour, from J (worst) to D (best)
# clarity a measurement of how clear the diamond is (I1 (worst), SI2, SI1, VS2, VS1, VVS2, VVS1, IF (best))
# x length in mm (0--10.74)
# y width in mm (0--58.9)
# z depth in mm (0--31.8)
# depth total depth percentage = z / mean(x, y) = 2 * z / (x + y) (43--79)\
# table width of top of diamond relative to widest point (43--95)
```

```{r}
library(ggplot2)
library(dplyr) 

data(diamonds)
summary(diamonds)
count.diamonds$cut
```

```{r}
# Creating new DF showing proportions of each cut type
cutProp <- diamonds %>% 
  count(cut) %>%            # group_by() & summarise(n = n()) are implicit
  mutate(prop = prop.table(n))    # prop = n/sum(n) works too=

dfCut <- as.data.frame(cutProp)
dfCut$prop <- round(dfCut$prop, 3)

# Creating new DF showing both proprtions of each cut type and clarity type
clarityProp <- diamonds %>% 
  count(cut, clarity) %>%            # group_by() & summarise(n = n()) are implicit
  mutate(prop = prop.table(n))    # prop = n/sum(n) works too

dfCutClar <- as.data.frame(clarityProp)
dfCutClar$prop <- round(dfCutClar$prop, 3)

```


```{r}
# Pie Chart
# Bad: No labels, doesn't tell us much
mycols <- c("#E69F00", "#56B4E9", "#0072B2", "#D55E00", "#CC79A7")

ggplot(dfCut, aes(x = "", y = prop, fill = cut)) +
  geom_bar(width = 1, stat = "identity", color = "white") +
  coord_polar("y", start = 0) +
  #geom_text(aes(y = prop, label = prop), color = "white")+
  scale_fill_manual(values = mycols) +
  theme_void()
```

```{r}
# barplot(as.matrix(dfCut))
# ggplot(dfCutClar, aes(x = clarity, y = cut, fill = prop)) + 
#   geom_bar(stat = "identity") +
#   xlab("\nCut") +
#   ylab("Clarity\n") +
#   guides(fill = FALSE) +
#   theme_bw()

#----

# Bad: Too many variables inside variables to actually read and understand
ggplot(dfCutClar, aes(x = cut, y = n, fill = clarity)) + 
  geom_bar(stat = "identity") +
  xlab("\nCut") +
  ylab("Count\n") +
  #guides(fill = FALSE) +
  theme_bw()

# Same but variables (cut & clarity) flipped:
ggplot(dfCutClar, aes(x = clarity, y = n, fill = cut)) + 
  geom_bar(stat = "identity") +
  xlab("\nClarity") +
  ylab("Count\n") +
  #guides(fill = FALSE) +
  theme_bw()

```



```{r}
# Ugly colors but couldn't figure out how to change:

ggplot(dfCutClar,aes(x=cut,y=prop,fill=factor(clarity)))+
  geom_bar(stat="identity",position="dodge")+
  scale_fill_discrete(name="Clarity",
                      breaks = c("I1 (worst)", "SI2", "SI1", "VS2", "VS1", "VVS2", "VVS1", "IF (best)"),
                      values = c("I1 (worst)"= "black", "SI2"= "red", "SI1"= "brown", "VS2"= "orange", "VS1"="pink", "VVS2"= "grey", "VVS1"= "magenta", "IF (best)"= "purple")) +
  
  
  
  
  scale_fill_manual("legend", values = c("A" = "black", "B" = "orange", "C" = "blue"))

theme_bw() +
  xlab("Cut")+ylab("Proportion of Diamonds") 

#(I1 (worst), SI2, SI1, VS2, VS1, VVS2, VVS1, IF (best))
#+ scale_colour_manual(values = cols)
```


```{r}
ggplot(dfCutClar, aes(x = clarity, y = n, fill = cut)) + 
  geom_bar(position="fill", stat="identity")


```


```{r}
# density

p <- ggplot(data=diamonds, aes(x=clarity, group=cut, fill=cut)) +
  geom_density(adjust=1.5, position="fill") 
p

```{r}

ggplot(data=diamonds, aes(x=clarity, group=cut, fill=cut)) +
  geom_density(adjust=1.5) +
  facet_wrap(~cut) +
  theme(
    legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    axis.ticks.x=element_blank()
  )

```


