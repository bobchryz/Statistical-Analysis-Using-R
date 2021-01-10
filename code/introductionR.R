#----------------------------------------------------
# Script for introduction to R
# Author: Sreekanth V K
# Statistical Analysis using R
#----------------------------------------------------
# this is a comment. 

#to know the working directory
getwd()

#setting working directory
setwd("D:/Learning/Statistical Analysis Using R")

# To list all the files and folders in the working directory
dir()

# to list the variables
ls()

#numeric
variable = 1
variable <- 2

#Strings/Characters
variable = "ABC"
variable = 'DEF'
variable <- 'GHI'

#date
variable <- as.Date('2021-01-01')
class(variable)
typeof(variable)

#Date operations
variable1 <- as.Date('2021-01-01')
variable2 <- as.Date('2021-01-02')
variable2 - variable1
variable1 + 1

# Arithematic operations
variable3 = 1
variable4 <- 2
result  <- variable3 + variable4

list.var <- 1:10
list.var <- c(1:10)
list.var <- seq(1,10,2)

# function to check if the number is of numeric or integer class
is.numeric(1)
is.integer(1)
is.numeric(1L)
is.integer(1L)

#list function
list_var <- list(1:10)
names(list_var) <- "x"
list_var$x
list_var["x"]
list_var
list_var[1]
list_var[[1]]
list_var[[1]][1]

# matrices
mat <- matrix(1:12, nrow = 3, ncol = 4)
mat
mat <- matrix(1:12, nrow = 3, ncol = 4, byrow = T)
mat
class(mat)
typeof(mat)

#dataframe
df <- data.frame(x=1:10, y = letters[1:10], LETTERS[1:10])
class(df)
typeof(df)

sum<- sum(1:10)
?sum
class(sum)
rm("sum")
class(sum)


#functions
#some useful builtin functions
sum.of.1.10 <- sum(1:10)
mean(1:10)
median(1:10)
rep(1,10)
rep(1:10,10)
rep(1:10,each= 10)


# function for finding mode

# Create the function.
getmode <- function(value) {
  uniqv <- unique(value)
  uniqv[which.max(tabulate(match(value, uniqv)))]
}

# Create the vector with numbers.
list.of.nums <- c(2,1,2,3,1,2,3,4,1,5,5,3,2,3)

# Calculate the mode using the user function.
result <- getmode(v)
print(result)

num <- readline("Enter a number:")
num <- as.integer(num)

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
switch(1,sum(1:10), mean(1:10), median(1:10))

#for loop
for (i in 1:10) {
  print(i)
}

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
vapply(x, mean, 0)
vapply(x, mean, "a")   # it will throw error

# range
(r.x <- range(stats::rnorm(100)))
diff(r.x) # the SAMPLE range

install.packages("ggplot2")

library(ggplot2)
require(ggplot2)

library(crantastic)
require(crantastic)


# file handling
sample.data <- read.csv("data/sample.csv")
sample.data <- read.table("data/sample.csv", sep = ",", header = T)
sample.data <- read.delim("data/sample.csv", sep = ",", header = T)
library(readxl)
sample.datax <- read_excel("data/sample.xlsx")

write.csv(sample.data, "data/sample.csv")
read.csv
read.csv2

install.packages(c("sp", "rgdal"))
library(sp)
library(rgdal)

neighborhood <- readOGR("data/nynta_20d")
plot(neighborhood)

help("datasets")
library(help = "datasets")
library(help = "ISLR")