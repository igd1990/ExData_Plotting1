library(data.table)

data <- fread('data/household_power_consumption.txt')
usefulData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- as.POSIXct(strptime(paste(usefulData$Date, usefulData$Time, sep=" "), "%d/%m/%Y %H:%M:%S"))


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 


# generating plot 1
with(usefulData, {
  plot(Global_active_power~datetime, type="l",
       ylab="Global Active Powe", xlab="datetime")
})


# generating plot 2
with(usefulData, {
  plot(Voltage~datetime, type="l",
       ylab="Voltage", xlab="datetime")
})


#generating plot 3
with(usefulData, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Energy Submetering", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty= "o")


#generating plot 4
with(usefulData, {
  plot(Global_reactive_power~datetime, type="l",
       ylab="Global_reactive_power", xlab="datetime")
})

dev.off()