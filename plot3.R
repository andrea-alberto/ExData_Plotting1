# read data
zipfile <- unz('../exdata%2Fdata%2Fhousehold_power_consumption.zip', 'household_power_consumption.txt')
classes <- c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric')
data <- read.csv(zipfile, na.strings = '?', sep = ';', colClasses = classes)

# create a data frame for the desired dates
data2 <- data[(data$Date == '1/2/2007') | (data$Date == '2/2/2007'),]

# delete the orignal data frame
rm(data)

# add a datetime column
data2$datetime <- as.POSIXct(paste(data2$Date,data2$Time),format='%d/%m/%Y %H:%M:%S')

# set time locale to english to get english weekdays
Sys.setlocale("LC_TIME", "English")
par(mfrow = c(1,1))

# plot the sub meetering values
plot(data2$datetime, data2$Sub_metering_1, type = 'l', 
     ylab = 'Energy sub meetering', xlab = '', col='black', 
     ylim = range(c(data2$Sub_metering_1, data2$Sub_metering_2, data2$Sub_metering_3)))
lines(data2$datetime, data2$Sub_metering_2, type = 'l', col = 'red')
lines(data2$datetime, data2$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', col=c('black','red','blue'), lwd=1,
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

# copy to png device
dev.copy(device = png, file = 'plot3.png')
dev.off()


