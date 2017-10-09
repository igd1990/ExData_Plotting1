library(data.table)

# reading the data
data <- fread('data/household_power_consumption.txt')

# subsetting the data based on the dates required for this assignment
usefulData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- as.POSIXct(strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S"))

#Generating plot 3 and saving it as png
png("plot3.png", width=480, height=480)
with(usefulData, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()