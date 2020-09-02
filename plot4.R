data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subsetdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
datetime <- paste(subsetdata$Date, subsetdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
data1$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subsetdata, {
  plot(Global_active_power~Datetime, type = "1", ylab = "Global Active Power (kW)", xlab = "")
  plot(Voltage~Datetime, type = "1", ylab = "Voltage (volt)", xlab = "")
  plot(Sub_metering_1~Datetime, type = "1", ylab = "Global Active Power (kW)", xlab = "")
  lines(Sub_metering_2~Datetime, col = "red")
  lines(Sub_metering_3_Datetime, col = "blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type = "1", ylab = "Global Reactive Power (kW)", xlab = "")
  
})
# saving file 
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
