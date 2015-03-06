############################################################
# Exploratory analysis
# Project #1
# Plot#3
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

#Conversion from factor to numeric using levels
submet1<-as.numeric(levels(elecds2$V7))[elecds2$V7]
submet2<-as.numeric(levels(elecds2$V8))[elecds2$V8]
submet3<-as.numeric(levels(elecds2$V9))[elecds2$V9]

#Plot3:
par(mfrow=c(1, 1))
with(elecds3, {
plot(x2, V7, xlab="", ylab="Energy sub metering", type="n")
lines(x2, submet1, col="black")
lines(x2, submet2, col="red")
lines(x2, submet3, col="blue")
legend("topright", lty=c(1, 1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

#Dump the result to png image
dev.copy(png, "plot3.png", width=480, height=480)
dev.off()

