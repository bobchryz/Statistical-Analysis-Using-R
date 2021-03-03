# Write a function to get two arguements - compare
# arg1 and arg2 
# compare arg1 and arg2
# print - Arg1 is big
# print Arg2 is big 
# print both are equal
# get two inputs from user 
# call compare and get result

compare <- function(arg1 = 100, arg2){
  if (arg1 > arg2){
    print(paste(arg1, "greater than", arg2))
  }else if (arg1 < arg2){
    print(paste(arg2, "greater than", arg1))
  }else {
    print("Both are equal")
  }
}

x <- readline("Enter the first number: ")
x1 <- as.integer(x)
arg2 <- as.integer(readline("Enter the second number: "))
compare(arg2 = arg1, arg1 = arg2)
compare(arg1, arg2)

compare(arg2=10)
