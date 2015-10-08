## Plot #4

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

## Plot data for fourth graph 
par(mfcol=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) 

plot(data2$Global_active_power~data2$DateTime, type="l",ylab="Global Active Power", xlab="") 

plot(data2$Sub_metering_1~data2$DateTime,type="l", ylab="Energy sub metering", xlab="")
lines(data2$Sub_metering_2~data2$DateTime,col='Red') 
lines(data2$Sub_metering_3~data2$DateTime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,cex = 1,pt.cex=0.8,bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 

plot(data2$Voltage~data2$DateTime, type="l",col='black',ylab="Voltage", xlab="datetime") 

plot(data2$Global_reactive_power~data2$DateTime, type="l",col='black',ylab="Global_reactive_power", xlab="datetime") 

## Saving to file 
dev.copy(png, file="plot4.png", height=480, width=480) 
dev.off() 



