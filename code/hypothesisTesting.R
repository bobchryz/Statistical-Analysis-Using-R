# Using the Student’s T-test in R
# Two-Sample T-test with Unequal Variance
x = rnorm(100,mean = 0, sd = 1)
y = rnorm(100,mean = 0, sd = 1)
t.test(x,y)

x = rnorm(100,mean = 0, sd = 1)
y = rnorm(100,mean = 20, sd = 20)
t.test(x,y)

# Using the Student’s T-test in R
x = rnorm(100,mean = 0, sd = 1)
y = rnorm(100,mean = 0, sd = 10)
t.test(x,y, var.equal = T)

#One-Sample T-testing in R
x = rnorm(100,mean = 0, sd = 1)
t.test(x, mu = 0)

csv.data <- read.csv("data/grass.csv")
t.test(rich ~ graze, data = csv.data)

t.test(rich ~ graze, data = csv.data, subset = graze %in% c('mow', 'unmow'))

wilcox.test(x, y)
wilcox.test(y, exact = FALSE)

# Simple Correlation in R
count = c(9,25,15,2,14,25,24,47)
speed = c(2,3,5,9,14,24,29,34)
cor(count, speed)
cor(count, speed, method = 'spearman')
cor(count, speed, method = 'sp')

set.seed(5)
x <- rnorm(30, sd=runif(30, 2, 50))
mat <- matrix(x,10)
V <- cov(mat)
cov2cor(V)

plot(iris$Petal.Length, iris$Petal.Width, col = "red", pch = 20, psize = 2)
cor.test(iris$Petal.Length, iris$Petal.Width)
cor.test( ~ Petal.Length + Petal.Width, data = iris)


x = rpois(100,lambda = 10)
avg = mean(x)
y = rpois(100,lambda = avg)

chisq.test(x,y)


x = rnorm(100)
y = rnorm(100)
ks.test(x,y)
?ks.test
