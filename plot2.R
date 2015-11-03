library(data.table)

#Place script in folder containing 'household_power_consumption.txt
full_df <- fread('household_power_consumption.txt', na.strings = '?')

full_df$Date <- as.Date(full_df$Date, format = "%d/%m/%Y")

subset_df <- subset(full_df, Date == as.Date('2007-02-01')
                    | Date == as.Date('2007-02-02')
                    , select=c(Date, Time, Global_active_power))

subset_df$Datetime <- as.POSIXct(paste(subset_df$Date, subset_df$Time), 
                                 format = "%Y-%m-%d %H:%M:%S")

png("plot2.png", width=480, height=480, units='px')

plot(subset_df$Datetime, subset_df$Global_active_power, 
     type='l', xlab='', ylab='Global Active Power (kilowatts)')

dev.off()