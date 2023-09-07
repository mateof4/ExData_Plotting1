power <- read.table('./household_power_consumption.txt', header=TRUE, sep=';')
head(power)

library('plyr')
power_frecs <- count(power$Global_active_power)
head(power_frecs)

breaks <- seq(0, 7.5, by = 0.5)
power_frecs$xRange <- cut(power_frecs$x, breaks = breaks)
head(power_frecs)

agg_df <- aggregate(freq ~ xRange, data = power_frecs, sum)
agg_df

png(file="plot1.png")
barplot(agg_df$freq, 
        main='Global Active Power', xlab='Global Active Power (kilowatts)', ylab='Frequency',
        col='red') 
axis(1, at = c(0,5,10,15), labels = c('0','2','4','6'))
axis(2, at = c(0,200,400,600,800,1200), labels = c('0','200','400','600','800','1200'))
dev.off()
