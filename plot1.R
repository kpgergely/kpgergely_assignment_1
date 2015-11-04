#Data reading & formatting
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
npc_short <- subset(household_power_consumption, Date=="1/2/2007" | Date=="2/2/2007")
npc_short$newDate <- as.Date(npc_short$Date, format="%d/%m/%Y")
npc_short$datetime<- as.POSIXct(paste(npc_short$newDate, npc_short$Time))

#New device
dev.new(width=480, length=480)

#Plot
with(npc_short, hist(Global_active_power, 
                     col="red", xlab = "Global Active Power (kilowatts)", 
                     main="Global Active Power"))

#Print
dev.copy(png, "plot1.png")
dev.off()