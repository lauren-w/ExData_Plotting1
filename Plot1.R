##read in data
hpc_data <- read.csv("household_power_consumption.txt", na.strings="?", sep=";")
head(hpc_data)

##format dates
hpc_data$Date <- as.Date(hpc_data$Date, format="%d/%m/%Y")

##subset to specific dates
sub_hpc_data <- subset(hpc_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##create plot 1
hist(sub_hpc_data$Global_active_power, xlab="Global Active Power (kilowatts)", col="red",
          main="Global Active Power")

##save as png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
