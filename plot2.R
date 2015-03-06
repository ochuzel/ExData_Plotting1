############################################################
# Exploratory analysis
# Project #1
# Plot#2
# 05/03/2015
# ochuzel
############################################################

#Read the table
setwd("C:/Users/chuzel/perso/formations/coursera/ExData/project#1/exdata-data-household_power_consumption/")
filePath='./household_power_consumption.txt'
elecds<-read.table(file=filePath, sep = ";", na.strings="?")

#Subset the DS
dateMin<-as.Date("2007-02-01")
dateMax<-as.Date("2007-02-02")
elecds1<-elecds[-1,]
elecds2<-subset(elecds1, as.Date(strptime(elecds1$V1, "%d/%m/%Y"))>=dateMin & as.Date(strptime(elecds1$V1, "%d/%m/%Y"))<=dateMax)

#Date variables to Date class
dates<-as.Date(strptime(elecds2$V1, "%d/%m/%Y"))
#Aggregation of Date and Time in one variable
x <- paste(dates, elecds2$V2)
x2<-strptime(x, "%Y-%m-%d %H:%M:%S")

#Plot2:
plot(x2, elecds2$V3, pch=27, xlab="", ylab="Global Active Power (kilowatts)")
lines(x2, elecds2$V3)

#Dump the result to png image
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()

