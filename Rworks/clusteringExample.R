data<-read.csv("customr.csv")
data<-data[, 3:8]
dim(data)
k.max<-20
scaledData<-scale(data)

m1<-kmeans(scaledData, 5, iter.max = 20)

m1$centers

table(m1$cluster)

wss<- sapply(1:k.max, 
              function(k) {kmeans(scaledData,k, iter.max = 20)$tot.withinss})

plot(1:k.max, wss, type="b", xlab="Number of clusters", ylab="Sum of squares")

m<- kmeans(scaledData, 5, iter.max = 20)
m$centers
