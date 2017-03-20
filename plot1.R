zipfile <- unz('../exdata%2Fdata%2Fhousehold_power_consumption.zip', 'household_power_consumption.txt')
classes <- c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric')
data <- read.csv(zipfile, na.strings = '?', sep = ';', colClasses = classes)
## as.POSIXct(paste(data$Date,data$Time),format='%d/%m/%Y %H:%M:%S')
data2 <- data[(data$Date == '1/2/2007') | (data$Date == '2/2/2007'),]
rm(data)

# set time locale to english to get english weekdays
Sys.setlocale("LC_TIME", "English")
par(mfrow = c(1,1))

# plot the histogram of Global Active Power
hist(data2$Global_active_power, col = 'red', main='Global Active Power', 
     xlab = 'Global Active Power (kilowatts)')
dev.copy(device = png, file = 'plot1.png')
dev.off()

