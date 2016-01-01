
# set location to file path
file_path <- "./household_power_consumption.txt"

# read data from file
housing_data <- read.table(file_path, sep=";", header=TRUE)

# retrieve global active power data from selected dates
date_logical <- housing_data$Date == "1/2/2007" | housing_data$Date == "2/2/2007"
global_active_power <- as.numeric(as.character(housing_data[date_logical, "Global_active_power"]))

# plot histogram
png("plot1.png", width=480, height=480)
hist(global_active_power, 
     main   = "Global Active Power", 
     xlab   = "Global Active Power (kilowatts)", 
     col    = "red", 
     breaks = seq(0, 8, 0.5), 
     xaxt   = 'n')
axis(side=1, at=seq(0,6,2))
dev.off()

