# install.packages(c("ggplot2" , "gganimate", "tidyverse"))
library(ggplot2)
?ggplot
head(iris)

p <- ggplot(data = iris,mapping = aes(Petal.Length, Petal.Width,
                                      colour = factor(Sepal.Length))) + 
  geom_point()
p

ggplot(data = iris) + 
  geom_bar(aes(Sepal.Length))

geom
?geom_point

plot(iris$Petal.Length, iris$Petal.Width)

library(help = "datasets")
