############################################################
# Exploratory analysis
# Project #1
# Plot#1
# 05/03/2015
# ochuzel
############################################################

#Read the table
filePath='./household_power_consumption.txt'
elecds<-read.table(file=filePath, sep = ";", na.strings="?")

#Subset the DS
dateMin<-as.Date("2007-02-01")
dateMax<-as.Date("2007-02-02")
elecds1<-elecds[-1,]
elecds2<-subset(elecds1, as.Date(strptime(elecds1$V1, "%d/%m/%Y"))>=dateMin & as.Date(strptime(elecds1$V1, "%d/%m/%Y"))<=dateMax)

#Conversion from factor to numeric using levels
gap<-as.numeric(levels(elecds2$V3))[elecds2$V3]
#Plot1:
hist(gap, xlab="Global Active Power (kilowatts)", ylab="Frequency",
     main="Global Active Power", col=c("red"), ylim=c(0, 1200))

#Dump the result to png image
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()

