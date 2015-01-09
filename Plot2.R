##read in data
hpc_data <- read.csv("household_power_consumption.txt", na.strings="?", sep=";")
head(hpc_data)

##format dates
hpc_data$Date <- as.Date(hpc_data$Date, format="%d/%m/%Y")

##subset to specific dates
sub_hpc_data <- subset(hpc_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(sub_hpc_data$Date), sub_hpc_data$Time)
sub_hpc_data$Datetime <- as.POSIXct(datetime)

##create plot 2
plot(sub_hpc_data$Global_active_power~sub_hpc_data$Datetime,
     type="l", ylab="Global Active Power (kilowatts)", xlab="")

##save as png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
