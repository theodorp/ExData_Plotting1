library(data.table)

#Place script in folder containing 'household_power_consumption.txt
full_df <- fread('household_power_consumption.txt', na.strings = '?')

full_df$Date <- as.Date(full_df$Date, format = "%d/%m/%Y")

subset_df <- subset(full_df, Date == as.Date('2007-02-01')
                      | Date == as.Date('2007-02-02')
                    , select=Global_active_power)

png("plot1.png", width=480, height=480, units='px')

hist(subset_df$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     col="red")

dev.off()