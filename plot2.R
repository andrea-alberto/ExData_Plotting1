# read data
zipfile <- unz('../exdata%2Fdata%2Fhousehold_power_consumption.zip', 'household_power_consumption.txt')
classes <- c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric')
data <- read.csv(zipfile, na.strings = '?', sep = ';', colClasses = classes)

# create a data frame for the desired dates
data2 <- data[(data$Date == '1/2/2007') | (data$Date == '2/2/2007'),]

# delete the orignal data frame
rm(data)

# set time locale to english to get english weekdays
Sys.setlocale("LC_TIME", "English")
par(mfrow = c(1,1))

# add a datetime column
data2$datetime <- as.POSIXct(paste(data2$Date,data2$Time),format='%d/%m/%Y %H:%M:%S')

# plot the histogram of Global Active Power
plot(data2$datetime, data2$Global_active_power, type = 'l', 
     ylab = 'Global Active Power (kilowatts)', xlab = '')
# copy the plot to a png file
dev.copy(device = png, file = 'plot2.png')
dev.off()

