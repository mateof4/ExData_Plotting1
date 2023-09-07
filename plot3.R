power <- read.table('./household_power_consumption.txt', header=TRUE, sep=';')
head(power)

#Date columns to date format 
power$Date <- as.Date(power$Date, format='%d/%m/%Y')
power$Time <- as.POSIXct(power$Time, format='%H:%M:%S')
head(power)

png(file="plot3.png")
plot(power$Sub_metering_1,
     col='black',
     xaxt='n',
     xlab='', ylab='Energy sub metering',
     type='S') 
lines(power$Sub_metering_2,
      col='red'
      )
lines(power$Sub_metering_3,
      col='blue'
      )
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, cex=0.8)
axis(1, at = c(which(!duplicated(power$Date)), length(power$Global_active_power)),
     labels = c(sapply(weekdays(unique(power$Date)), function(x) substr(x,1,3)), 'Sat'))
dev.off()
