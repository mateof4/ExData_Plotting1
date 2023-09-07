power <- read.table('./household_power_consumption.txt', header=TRUE, sep=';')
head(power)

#Date columns to date format 
power$Date <- as.Date(power$Date, format='%d/%m/%Y')
power$Time <- as.POSIXct(power$Time, format='%H:%M:%S')
head(power)


png(file="plot4.png")
par(mfrow=c(2,2))

plot(power$Global_active_power, 
     xaxt='n',
     xlab='', ylab='Global Active Power',
     type='S') 
axis(1, at = c(which(!duplicated(power$Date)), length(power$Global_active_power)),
     labels = c(sapply(weekdays(unique(power$Date)), function(x) substr(x,1,3)), 'Sat'))
axis(2, at = c(0,2,4,6), labels = c('0','2','4','6'))


plot(power$Voltage, 
     xaxt='n',
     yaxt='n',
     xlab='datetime', ylab='Voltage',
     type='S') 
axis(1, at = c(which(!duplicated(power$Date)), length(power$Global_active_power)),
     labels = c(sapply(weekdays(unique(power$Date)), function(x) substr(x,1,3)), 'Sat'))
axis(2, at = c(seq(234,246,by=4)), labels = c('234','238','242','246'))


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
       col = c("black", "red", "blue"), lty = 1, cex=0.75)
axis(1, at = c(which(!duplicated(power$Date)), length(power$Global_active_power)),
     labels = c(sapply(weekdays(unique(power$Date)), function(x) substr(x,1,3)), 'Sat'))


plot(power$Global_reactive_power, 
     xaxt='n',
     yaxt='n',
     xlab='datetime', ylab='Voltage',
     type='S') 
axis(1, at = c(which(!duplicated(power$Date)), length(power$Global_active_power)),
     labels = c(sapply(weekdays(unique(power$Date)), function(x) substr(x,1,3)), 'Sat'))
axis(2, at = c(seq(0,0.5,by=0.1)), labels = c('0.0','0.1','0.2','0.3','0.4','0.5'))
dev.off()
