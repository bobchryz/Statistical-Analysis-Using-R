# data frames

df <- data.frame(slno = 1:1000, 
                 b = 1:100, 
                 x = rep(1:10, 10,each = 10), 
                 y = rep(LETTERS[1:10], 10, each = 1))

dim(df)
str(df)

df$x <- as.factor(df$x)
head(df)

df[1:6,1:3]

dfab <- df[,c("slno","b")]

df1 <- subset(df, df$x == 1 & df$y == "A")
df2 <- df[df$x == 1 & df$y == "A", ]                 

library(dplyr)

df3 <- df %>% group_by(x) %>% summarise(sum(b))
