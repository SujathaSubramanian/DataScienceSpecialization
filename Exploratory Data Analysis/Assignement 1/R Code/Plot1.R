##
## Check if the data exists in the environment. Load if not already exists.
## Set the data type of the columns before reading the data into a data frame.
## Convert the date and time column as Date object
##
if(!exists("powerData"))
{
    colClasses<- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
    powerData <- read.table("data\\household_power_consumption.txt", sep=";",header=T, colClasses=colClasses,na.strings=c("?"))
    powerData$Time <- strptime(paste0(powerData$Date,powerData$Time), "%d/%m/%Y %H:%M:%S")
    powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
}

##
##Filter the data frame for the 2 dates in February 2007
##
date1 <- as.Date(c('2007-02-01'),"%Y-%m-%d")
date2 <- as.Date(c('2007-02-02'),"%Y-%m-%d")
filteredPowerData <- powerData[powerData$Date >= date1 & powerData$Date <= date2 ,]

##
##Generate charts and Save the file as a png file
##
png(file = "Plot1.png",width=480,height=480)
hist(filteredPowerData$Global_active_power,main = "Global Active Power",xlab = "Global Active Power(kilowatts)",col="red")
dev.off()

