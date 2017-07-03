plot4 <- function() {	
	#Load libraries
	library(tidyr)
	library(dplyr)

	#Read Data: Goes to first row minus 1 to start reading, then selects 2 days worth of data from then onwards
	power_consumption = read.table("household_power_consumption.txt",skip=66637,nrows=2880)

	#Split data set into separate columns using tidyr library
	tidy_power_consumption = power_consumption %>% 	separate(V1,into=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",	"Sub_metering_3"),sep = ";")

	#Convert date into date format, numbers into numeric. Create single datetime variable.
	tidy_power_consumption$Date = as.Date(tidy_power_consumption$Date,format="%d/%m/%Y")
	tidy_power_consumption$Global_active_power = as.numeric(tidy_power_consumption$Global_active_power)
	tidy_power_consumption$singledatetime <- as.POSIXct(paste(tidy_power_consumption$Date,tidy_power_consumption$Time),tz="UCT") 

	#Setup png and rows/columns for grid
	png(filename = "plot4.png", width = 480, height = 480)
	par(mfrow = c(2, 2))
	
	#Plot graph 1
	plot(tidy_power_consumption$singledatetime,tidy_power_consumption$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
	
	#Plot graph 2
	plot(tidy_power_consumption$singledatetime,tidy_power_consumption$Voltage,type="l",ylab="Voltage",xlab="datetime")
	
	#Plot graph 3 (Legend border is removed here)
	plot(tidy_power_consumption$singledatetime,tidy_power_consumption$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
	lines(tidy_power_consumption$singledatetime,tidy_power_consumption$Sub_metering_2,col="red")
	lines(tidy_power_consumption$singledatetime,tidy_power_consumption$Sub_metering_3,col="blue")
	legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1, bty = "n", col=c("black","red","blue"))
	
	#Plot graph 4
	plot(tidy_power_consumption$singledatetime,tidy_power_consumption$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
	dev.off()
}