## Plot #2

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

## Plot data for second graph 
plot(data2$Global_active_power~data2$DateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="") 


## Save to png object 
dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off() 

