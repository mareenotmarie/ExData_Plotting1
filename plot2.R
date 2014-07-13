temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.csv(unz(temp, "household_power_consumption.txt"), header=FALSE, skip=66637,nrow=2880,col.names=c('Date', 'Time', 'Global_active_power', 'Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3'), sep=';',na.strings=c("?"))
unlink(temp)
data$Datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

png('plot2.png', width=480, height=480)
with(data, plot(Datetime, Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()