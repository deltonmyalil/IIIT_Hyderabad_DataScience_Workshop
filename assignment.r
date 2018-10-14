data<-read.csv('Flight.csv')
View(data)

#1.number of delayed flights on week days
nrow(data[data$delay=='delayed' & data$dayweek<6,]) #1

#2a.sum of distances for delayed fligthts on Friday
sum(data[data$delay=='delayed' & data$dayweek==5,5]) 

#2b.count for delayed fligthts on Friday
nrow(data[data$delay=='delayed' & data$dayweek==5,]) 

#2c.average of distances for delayed fligthts on Friday
mean(data[data$delay=='delayed' & data$dayweek==5,5]) 

#3a.number of flights on time on week days
nrow(data[data$delay=='ontime' & data$dayweek<=5,]) 

#3b.number of flights on time on weekends
nrow(data[data$delay=='ontime' & (data$dayweek==6 |data$dayweek==6),]) 

#4.number of flights for each destination across all weekdays 
by_dest<-group_by(df,data$destination)
dest<-unique(data$destination)
dest
d<-summarise(by_dest,
             flights1=nrow(data[data$dayweek<6,]),
             flights2=nrow(data[data$dayweek<6,]),
             flights3=nrow(data[data$dayweek<6,]),
             )
#5.number of times weather was bad across all weekdays
nrow(data[data$weather==1 & data$dayweek<6,])

View(CO2)
data2<-data.frame(CO2)
View(data2)
View(cor(CO2[,c(4,5)]))

View(airquality)
data3<-data.frame(airquality)
View(data3)
summary(data3)
mean(data3$Ozone,na.rm=TRUE)
cor(data3$Ozone,data3$Temp,na.rm=TRUE)

for(i in 2:nrow(data3))
{
  data3[i,7]=ifelse(data3[i-1,6]==)
}
