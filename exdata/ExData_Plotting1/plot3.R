
# set location to file path
file_path <- "./household_power_consumption.txt"

# read data from file
housing_data <- read.table(file_path, sep=";", header=TRUE)

# retrieve global active power data from selected dates
date_logical <- housing_data$Date == "1/2/2007" | housing_data$Date == "2/2/2007"

date_data <- housing_data[date_logical, c("Date", "Time", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")]
datetime <- strptime(paste(date_data$Date, date_data$Time), "%d/%m/%Y %H:%M:%S")

sub_metering_1 <- as.numeric(as.character(date_data$Sub_metering_1))
sub_metering_2 <- as.numeric(as.character(date_data$Sub_metering_2))
sub_metering_3 <- as.numeric(as.character(date_data$Sub_metering_3))


png("plot3.png", width=480, height=480)
plot(datetime, sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(datetime, sub_metering_2, col="red")
lines(datetime, sub_metering_3, col="blue")
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black', 'red', 'blue')) 
dev.off()
