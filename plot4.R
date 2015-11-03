library(data.table)

#Place script in folder containing 'household_power_consumption.txt
full_df <- fread('household_power_consumption.txt', na.strings = '?')

full_df$Date <- as.Date(full_df$Date, format = "%d/%m/%Y")

subset_df <- subset(full_df, Date == as.Date('2007-02-01')
                    | Date == as.Date('2007-02-02'))

subset_df$Datetime <- as.POSIXct(paste(subset_df$Date, subset_df$Time), 
                                 format = "%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480, units='px')

par(mfrow=c(2,2))

plot(subset_df$Datetime, subset_df$Global_active_power, 
     type='l', xlab='', ylab='Global Active Power')

plot(subset_df$Datetime, subset_df$Voltage, 
     type='l', xlab='datetime', ylab='Voltage')

plot(subset_df$Datetime, subset_df$Sub_metering_1, type="l", col="black", ylab='Energy sub metering', xlab = '')
lines(subset_df$Datetime, subset_df$Sub_metering_2, col="red")
lines(subset_df$Datetime, subset_df$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c('black', 'red', 'blue'), bty='n', cex=.75)

plot(subset_df$Datetime, subset_df$Global_reactive_power, 
     type='l', xlab='datetime', ylab='Global_reactive_power')

dev.off()