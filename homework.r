a <- c(8,14,18,19,25,9,8)
b <- c(6,10,13,19,31,11,11)
c <- c(2,4,4,11,39,18,21)
summary(a)
summary(b)
summary(c)

attributeNames <- c("0-5","5-8","8-9","9-12","12-13","13-16",">16")
# Now to create a dataframe
d <- data.frame(cbind(attributeNames, a, b, c))
# Now d is the dataframe
colnames(d) <- c("EducationLevel", "1960", "1970", "1991")

# Draw the histogram of 1991 data
hist(as.numeric(as.character(d$"1991"))) # I used numeric values in the col names so, I have to mention the thing in quotes as d$"1991"
barplot(c, main="barplot of 1991 data", xlab = "Ages", ylab = "Ed. Level", names.arg = c("0-5","5-8","8-9","9-12","12-13","13-16",">16"))
