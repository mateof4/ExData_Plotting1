power <- read.table('./household_power_consumption.txt', header=TRUE, sep=';')
head(power)
 
#Date columns to date format 
power$Date <- as.Date(power$Date, format='%d/%m/%Y')
power$Time <- as.POSIXct(power$Time, format='%H:%M:%S')
head(power)

png(file="plot2.png")
plot(power$Global_active_power, 
      xaxt='n',
      xlab='', ylab='Global Active Power (kilowatts)',
      type='S') 
axis(1, at = c(which(!duplicated(power$Date)), length(power$Global_active_power)),
     labels = c(sapply(weekdays(unique(power$Date)), function(x) substr(x,1,3)), 'Sat'))
axis(2, at = c(0,2,4,6), labels = c('0','2','4','6'))
dev.off()

