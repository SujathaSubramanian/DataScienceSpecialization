##
##Set the working directory to the right location
##
setwd("C:\\Users\\Suja\\OneDrive\\Coursera\\DataScienceCoursera\\Exploratory Data Analysis\\Assignement 1\\")

##
## Set the data type of the columns before calling reading the data into a data frame.
##
colClasses<- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
system.time(powerData <- read.table("data\\household_power_consumption.txt", sep=";",header=T, colClasses=colClasses,na.strings=c("?")))


##Convert the Date and Time column to the appropriate Date object

##powerData$Date <- strptime(paste0(powerData$Date,powerData$Time), "%d/%m/%Y %H:%M:%S")
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
##head(powerData)
##date1 <- as.Date(c('2007-02-01 0:0:0'),"%Y-%m-%d %H:%M:%S")
date1 <- as.Date(c('2007-02-01'),"%Y-%m-%d")
date1
date2 <- as.Date(c('2007-02-02'),"%Y-%m-%d")
date2

##Filter the data frame for the 2 dates in February 2007
filteredPowerData <- powerData[powerData$Date >= date1 & powerData$Date <= date2 ,]

x<- filteredPowerData$Global_active_power
##x
hist(x)


       
##system.time(spending <- read.delim2("data\\household_power_consumption.txt", sep=";",header=T, colClasses="character"))
##system.time(spending <- read.table("data\\household_power_consumption.txt", sep=";",header=T, colClasses="character"))

##system.time(spending <- read.delim2("data\\household_power_consumption.txt", sep=";",header=T, colClasses=classes))
##system.time(spending <- read.table("data\\household_power_consumption.txt", sep=";",header=T))
##head(spending)
##print(object.size(spending), units="Mb")
##x<- spending$Global_active_power
##hist(x)
