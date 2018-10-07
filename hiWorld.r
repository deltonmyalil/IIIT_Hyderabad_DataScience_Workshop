a <- 2
b <- "myString"
print(b)
print(a)

string1 <- "Goodbye, cruel world!" ## This is a comment

# To know what datatype a var is, the function is class(var)
print(class(a)) # we get numeric
class(b) # we get character

# To list all vars
print(ls())

# Vectors
v2 <- c(1, 2, 3, 4, 5, 6)
v2
#length
length(v2)
#indexing
v2[1]

v4 <- c(2,3,4,5)
v2+v4
v2
v3 <- c(3,4,5)
v4+v3

# Slicing vector
v1 <- c(1,2,3,4,5,6,7)
v1[2:5] # Indexing multiple elements at once

v1[v1<5] # Selecting elements based on a condition

# Something similar to range
k <- seq(from=5, to=13, by=2)
k
# Unlike python, this thing includes all the bounds
# Also this thing can be written as
k <- seq(5,13, 3)
k

# LISTS
# combination of vectors is a list
v1 <- c(1, 2)
v2 <- c(4, 6)
myList <- list(v1, v2)
myList
myList[1]

# To index a single element say 2
myList[[1]][2]

v3 <- c("Del", "Amr", "Gar")
list2 <- list(v1, v2, v3)
list2

# To select unique elements in v4
v4 <- c(2,2,3,3,4,4,5,5,1,1)
unique(v4)
length((unique(v4)))
# Sorting
sort(v4, decreasing = TRUE)
sort(v4)

# Matrix
myMatrix = matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, ncol = 3, byrow = TRUE)
myMatrix

m2 = matrix(c(1,2,4,2,5,6), nrow = 2, ncol = 3, byrow = TRUE)
m2
m2 = matrix(c(1,2,4,2,5,6), nrow = 2, ncol = 3)
m2
m2+2
m2*m2
# It's evident that by default matrix() takes col major order
# R is weird

# if-else
a <- 8
if(a %% 2 == 0) {
  print("Even")
} else {
  print("Odd")
}

# for loop
for(i in 1:5) {
  print(i*i)
}

# FUNCTION
# Create a function with arguments
my <- function(a,b,c) {
  result <- a*b+c
  print(result)
}
# Calling a function
my(5, 3, 11)

# STRINGS
a <- "Hello"
b <- "How"
c <- "are you?"
nchar(c) # For the length of the string
length(c) # This will only return 1 as it is just one string
paste(a, b, c) # Contcatenation

# FUZZY STRING MATCH
# TO MATCH APPROXIMATELY SIMILAR STRINGS
# USES JACCARD ALGORITHM
# NEED PACKAGE stringdist
install.packages("stringdist")
library(stringdist) # call the library
q1 <- stringdist("Delton", "Dalton", method = "jaccard", q=1) # q means #letter match
q1 # if it is close to 0, the names are similar

# GET WORKING DIRECTORY
getwd()

# SET WORKING DIRECTORY
#setwd()

# DATAFRAME
data <- read.csv("iiitData.csv", sep=",", header = TRUE)
data
View(data) # view with a capital V
colnames(data)
colnames(data) <- c("Id", "Name", "Age", "Married")
View(data)
colnames(data)[2] <- "FullName" # Change a particular col name
colnames(data)[2] <- "Name"
#Indexing the rows and columns
data[1,2]
data[1,]
data[2, 3:4]
data[, 2]
data$Name
data$Name[4:6]
data$Name <- as.character(data$Name)
head(data, 5)
str(data) #shows the structure of the data
# If I want to know all the details og Ram
which(data$Name=="Ram") # This returns the index
# Now to knoe all details of Ram,
data[which(data$Name=="Ram"), ] # Directly index it using this
# To know who all are married and who alll are not
table(data$Married) # Gives a count of Y and N

# I want the records whose age is greater than 35
data4 <- subset(data, data$Age > 35)
# The following is the query my mom is gonna do once I get back home.
data4 <- subset(data, data$Age > 25 & data$Married == "N")

#ifelse lambda
a <- 2
ifelse(a>8, 1, 0) # This returns 0 as a<8

# BUCKETING
# Divide the people based on a fixed set of age groups
data$age2 <- ifelse(data$Age <= 20, "<=20", ifelse(data$Age<=40,"20-40", ifelse(data$Age<=60, "41-60", ">60")))
View(data)
# To see number of people in every age bucket
table(data$age2)

# AGGREGATE
# Find the average age of the people who got married and the avg age of those who did not marry
aggregate(Age~Married, data = data, mean)

# APPLY FUNCTION
# We can perform rowvise or colvise operations
data <- list(x=1:5, y=6:10, z=11:15)
lapply(data, mean)
sapply(data, FUN=median)

# Using the mtcars dataset
View(mtcars)
str(mtcars)
tapply(mtcars$wt, mtcars$cyl, mean)

# make a random matrix of 5x6 dim
x <- matrix(rnorm(30), nrow=5, ncol=6)
apply(x, 1, sum)

View(mtcars)
data <- data.frame(mtcars)
cor(data$mpg, data$hp) # This give you a negative correlation
cor(data$mpg, data$cy)
View(data.frame(cor(mtcars))) # we get a correlation matrix
View(summary(data))

# Checking for missing values
colSums(is.na(data)) #no missing values

# Scatterplot
plot(data$mpg, data$hp)
#Making it is bit more professional
plot(data$mpg, data$hp, xlab = "mileage", ylab = "horsepower", main = "Mileage v/s horsepower")

# Plotting some variables pairwise 
# Every var will be plotted against every other vars
pairs(~wt+mpg+disp+cyl, data = data)

# boxplot
boxplot(data$mpg, data = data, xlab = "mileage", ylab = "Range", main = "Mileage Box plot")

# Find how many unique values are there in the cylinder column in the mpcars dataset
unique(data$cyl) # we get three unique vals

# use same boxplot and introduce one more var ie cylinder
boxplot(mpg~cyl, data = data, xlab = "No of cyl", ylab = "Miles per gallon", main = "Boxplot for mileage with respect to the number of cylinders")
# From the boxplot we can infer that the 3 cylinder vehicles are having more mileage
# plotting the mileage for transmission type
boxplot(mpg~am, data = data, xlab = "No of cyl", ylab = "Transmission type", main = "Boxplot for mileage with respect automatic or manual transmission")
# We can see that the automatic vechicles are having lower mileage