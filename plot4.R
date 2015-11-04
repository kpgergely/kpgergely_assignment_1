#Data reading & formatting
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
npc_short <- subset(household_power_consumption, Date=="1/2/2007" | Date=="2/2/2007")
npc_short$newDate <- as.Date(npc_short$Date, format="%d/%m/%Y")
npc_short$datetime<- as.POSIXct(paste(npc_short$newDate, npc_short$Time))

#New device
dev.new(width=480, length=480)

#Setting up the parameters
par(mfcol=c(2,2))

#Plot1
with(npc_short, plot(datetime, Global_active_power, 
                     type = "l", 
                     xlab = "", ylab = "Global Active Power (kilowatts)"))

#Plot2
with(npc_short, plot(datetime, Sub_metering_1, type = "l", col="black", xlab="", ylab="Energy sub metering"))
with(npc_short, lines(datetime, Sub_metering_2, col="red"))
with(npc_short, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = c(1,1,1), col=c("black","red","blue"), bty = "n")

#Plot3
with(npc_short, plot(datetime, Voltage, type = "l"))

#Plot4
with(npc_short, plot(datetime, Global_reactive_power, type = "l"))

#Print
dev.copy(png, "plot4.png")
dev.off()