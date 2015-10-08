## Plot #3

setwd("C:/Users/Stephen Iaquaniello/Documents/R/Coursera/Class 4 Exp Data Anal/Proj 1")

data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", row.names = NULL, 
                   na.strings="?", comment.char="",quote='\"',stringsAsFactors=FALSE, dec=".") 

#Format date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subsetdata
data2 <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(data) 

## combine date and time
datetime <- paste(as.Date(data2$Date), data2$Time) 
data2$DateTime <- as.POSIXct(datetime) 

## Plot data for third graph 
plot(data2$Sub_metering_1~data2$DateTime,type="l", ylab="Energy sub metering", xlab="")
lines(data2$Sub_metering_2~data2$DateTime,col='Red') 
lines(data2$Sub_metering_3~data2$DateTime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,cex = 1,pt.cex=0.8,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 

## Saving to file 
dev.copy(png, file="plot3.png", height=480, width=480) 
dev.off() 

