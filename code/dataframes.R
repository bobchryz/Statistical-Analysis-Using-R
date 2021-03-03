# data frames

df <- data.frame(slno = 1:1000, 
                 b = 1:100, 
                 x = rep(1:10, 10,each = 10), 
                 y = rep(LETTERS[1:10], 10, each = 1))

head(df)

dfab <- df[,c("slno","b")]

df1 <- subset(df, df$x ==1)
df2 <- df[df$x == 1, ]                 

library(dplyr)

df3 <- df %>% group_by(x) %>% summarise(sum(b))
