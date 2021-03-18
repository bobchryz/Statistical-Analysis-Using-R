#----------------------------------------------------
# Script for introduction to R
# Author: Sreekanth V K
# Statistical Analysis using R
#----------------------------------------------------
# this is a comment. 

# Select and then Ctrl + Enter
# to know the working directory
getwd()

# Select it and Ctrl + Enter

# setting working directory
setwd("D:/Learning/Statistical Analysis Using R")

# To list all the files and folders in the working directory
dir()

# to list the variables
ls()

3 + 2 

# Ctrl + L

# vector 

#numeric
variable = 1
variable <- 2

#Strings/Characters
variable = "ABC"
variable = "ABC"
variable = 'DEF'
variable <- 'GHI'

#date
variable <- as.Date('2021-01-01')
class(variable)
typeof(variable)

#Date operations
variable1 <- as.Date('2021-01-03')
variable2 <- as.Date('2021-01-02')
variable1 - variable2
variable3 <- variable1 + 1
variable3

# Arithematic operations

variable3 = 1
variable4 <- 2
result  <- variable3 / variable4

1:100
list.var <- 1:10
list.var <- c(1,2,3,4,6,7,8,9,10)
list.var <- seq(1,10, 2)

vect <- c("A", "B", "C", 1)

# function to check if the number is of numeric or integer class
is.numeric(1)
is.integer(1)
is.double(1)
is.numeric(1L)
is.integer(1L)
is.character("A")

#list function

LETTERS
letters 
list_var <- list(1:10, LETTERS)
names(list_var) <- c("numbers", "alphabets")
list_var$numbers
list_var["alphabets"]
list_var
list_var[[1]][6]
list_var[[1]]
list_var[[1]][1]

# matrices
mat <- matrix(1:12,  ncol = 4, nrow = 3)
mat
mat <- matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
mat
class(mat)
typeof(mat)


#dataframe
df <- data.frame(x=1:10, y = letters[1:10], LETTERS[1:10])
class(df)
typeof(df)

sum(1:10)
sum <- sum(1:10)

class(sum)
rm("sum")
class(sum)


#functions
#some useful builtin functions
sum.of.1.10 <- sum(1:10)
mean(1:10)
median(1:10)
rep("UGC-NET",10)
rep(1:10,10)
rep(1:10,each= 10)

sum.of.numbers <- function(num1 = 10, num2){
  print("HEre")
  return(num1 + num2)
  
}

sum <- function(num1, num2)
{
  num1 - num2
}
sum(1,2)
rm("sum")
sum(1,2)

sum.of.numbers( num2 = 20)

fun.name <- function() {
  1 + 2 }

# function for finding mode

# Create the function.
getmode <- function(list.of.values) {
  uniqv <- unique(list.of.values)
  uniqv[which.max(tabulate(match(list.of.values, uniqv)))]
}


# Create the vector with numbers.
list.of.nums <- c(2,1,2,2,1,2,3,4,1,5,5,3,2,3)

# Calculate the mode using the user function.
result <- getmode(list.of.nums)
print(result)

num <- readline("Enter a number:")
num <- as.integer(num)

# conditional

if (num > 0)
{
  print("positive")
} else if (num < 0)
{
  print("negative")
} else
{
  print("Zero")
}
  
# switch statement
n <- as.integer(readline("Enter choice:"))
switch(n,sum(1:10), mean(1:10), median(1:10))

#for loop
for (i in 1:10) {
  print(i)
}
letters
for (i in LETTERS) {
  print(i)
}

# while 
i = 1
while (i < 10) {
  print(i)
  i = i + 1
}

# apply
mat <- matrix(1:100,20,5, byrow = F)
row.sum <- apply(mat, 1,FUN = sum)
col.sum <- apply(mat, 2,FUN = sum)


x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
lapply(x, mean)
sapply(x, mean)
vapply(x, mean, 1)
vapply(x, mean, "a")   # it will throw error

# range
(r.x <- range(stats::rnorm(100)))
diff(r.x) # the SAMPLE range

installed.packages()
install.packages(c("ggplot2", "gganimate"))
installed.packages()

library(ggplot2)
require(ggplot2)

library(crantastic)
require(crantastic)

install.packages("swirl")

ggplot(iris, aes(Petal.Length, Petal.Width)) + geom_point()

# file handling
sample.data <- read.csv("data/sample.csv")
sample.data <- read.table("data/sample.csv", sep = ",", header = TRUE)
sample.data <- read.delim("data/sample.csv", sep = ",", header = T)

help("read.csv")
library(readxl)
sample.datax <- read_excel("data/sample.xlsx")

write.csv(sample.data, file = "data/sample.csv")
write.csv(sample.datax, "data/sample.csv")

read.csv
read.csv2

# install.packages(c("sp", "rgdal"))
library(sp)
library(rgdal)

neighborhood <- readOGR("data/nynta_20d")
plot(neighborhood)

help("datasets")
?datasets
?read.csv

library(help = "datasets")
library(help = "ISLR")

help("read.csv")

?read.csv

citation()
citation("forecast")

cat("A")
cat("\014")  # \014 = Ctrl + L 
ls()
rm(list = ls())
rm("sample.data")

attach(sample.data)
detach(sample.data)

# Distribitions
?rnorm
rnorm(100)
qnorm(.9)

population <- seq(1,1000)
sample(population,100 )

dim(sample.data)
nrow(sample.data)
ncol(sample.data)

sample.data[sample(1:100,10),]

