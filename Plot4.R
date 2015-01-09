##read in data
hpc_data <- read.csv("household_power_consumption.txt", na.strings="?", sep=";")
head(hpc_data)

##format dates
hpc_data$Date <- as.Date(hpc_data$Date, format="%d/%m/%Y")

##subset to specific dates
sub_hpc_data <- subset(hpc_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(sub_hpc_data$Date), sub_hpc_data$Time)
sub_hpc_data$Datetime <- as.POSIXct(datetime)

##create plot 4 and save as png
png(file="plot4.png", height=480, width=480)
par(mfrow=c(2,2), mar=c(4,4,2,4), oma=c(0,0,2,0))
with(sub_hpc_data, {
     plot(sub_hpc_data$Global_active_power~sub_hpc_data$Datetime,
          type="l", ylab="Global Active Power", xlab="")
     
     plot(sub_hpc_data$Voltage~sub_hpc_data$Datetime,
          type="l", ylab="Voltage", xlab="datetime")
     
     plot(sub_hpc_data$Sub_metering_1~sub_hpc_data$Datetime,
          type="l", ylab="Energy sub metering", xlab="")
     lines(sub_hpc_data$Sub_metering_2~sub_hpc_data$Datetime, col="Red")
     lines(sub_hpc_data$Sub_metering_3~sub_hpc_data$Datetime, col="Blue")
     legend("topright", col=c("Black","Red","Blue"), lty=1, lwd=2, bty="n",
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     
     plot(sub_hpc_data$Global_reactive_power~sub_hpc_data$Datetime,
          type="l", ylab="Global_reactive_power", xlab="datetime")
     
})

dev.off()
