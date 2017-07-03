plot3 <- function() {	
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

	#Plot graph
	png(filename = "plot3.png", width = 480, height = 480)
	plot(tidy_power_consumption$singledatetime,tidy_power_consumption$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
	lines(tidy_power_consumption$singledatetime,tidy_power_consumption$Sub_metering_2,col="red")
	lines(tidy_power_consumption$singledatetime,tidy_power_consumption$Sub_metering_3,col="blue")
	legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1, col=c("black","red","blue"))
	dev.off()
}