# Getting data.
data <- read.table("./household_power_consumption.txt",
                   header = T, sep = ';', na.strings = "?")

# Formatting date.
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subsetting data.
data <- subset(data, Date == '2007-02-01' | Date == '2007-02-02')

# Creating DateTime.
data$DateTime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

# Converting Global_active_power to numeric.
data$Global_active_power <- as.numeric(data$Global_active_power)

# Drawing the plot.
png('plot1.png', width = 480, height = 480)
hist(data$Global_active_power, col = 'red',
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')
dev.off()
