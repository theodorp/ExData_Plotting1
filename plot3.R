library(data.table)

#Place script in folder containing 'household_power_consumption.txt
full_df <- fread('household_power_consumption.txt', na.strings = '?')

full_df$Date <- as.Date(full_df$Date, format = "%d/%m/%Y")

subset_df <- subset(full_df, Date == as.Date('2007-02-01')
                    | Date == as.Date('2007-02-02'),
                    select=c(Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3))

subset_df$Datetime <- as.POSIXct(paste(subset_df$Date, subset_df$Time), 
                                 format = "%Y-%m-%d %H:%M:%S")

png("plot3.png", width=480, height=480, units='px')

plot(subset_df$Datetime, subset_df$Sub_metering_1, type="l", col="black", ylab='Energy sub metering', xlab = '')
lines(subset_df$Datetime, subset_df$Sub_metering_2, col="red")
lines(subset_df$Datetime, subset_df$Sub_metering_3, col="blue")
legend("topright", names(subset_df)[3:5], lty=1, col=c('black', 'red', 'blue'))

dev.off()