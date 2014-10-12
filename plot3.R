# Getting data.
data <- read.table("./household_power_consumption.txt",
                   header = T, sep = ';', na.strings = '?')

# Formatting date.
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subsetting data.
data <- subset(data, Date == '2007-02-01' | Date == '2007-02-02')

# Creating DateTime.
data$DateTime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

# Converting Global_active_power to numeric.
data$Global_active_power <- as.numeric(data$Global_active_power)

# Drawing the plot.
png('plot3.png', width = 480, height = 480)
plot(data$Sub_metering_1 ~ data$DateTime,
     type = 'n',
     ylab = 'Energy sub metering', xlab = '')
lines(data$Sub_metering_1 ~ data$DateTime,
      type = 'l', col = 'black')
lines(data$Sub_metering_2 ~ data$DateTime,
      type = 'l', col = 'red')
lines(data$Sub_metering_3 ~ data$DateTime,
      type = 'l', col = 'blue')
legend("topright", lty = 1, col = c('black', 'red', 'blue'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()
