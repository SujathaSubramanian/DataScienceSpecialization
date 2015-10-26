library(plyr)
##
##Load the pollution data 
##
##setwd("C:\\Users\\Suja\\OneDrive\\Coursera\\DataScienceCoursera\\Exploratory Data Analysis\\Assignment 2\\exdata_data_NEI_data")
if(!exists("NEI"))
{
    NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC"))
{
    SCC <- readRDS("Source_Classification_Code.rds")
}

##
##subset the baltimore data i.e fips == "24510"
##
baltimoreNEIData <- subset(NEI,fips == "24510")

##
##Compute year wise SUM of the pollution data for baltimore
##
d0 <- ddply(baltimoreNEIData,.(year),summarize,sum= sum(Emissions,na.rm=T))

##
##Generate charts and Save the file as a png file
##
png(file = "Plot2.png",width=480,height=480)
par(mfrow=c(1,1))
plot(d0[,1],d0[,2],cex=2.0,xlab="Year(1999-2008)",ylab = "Emissions",col="red",main= " PM2.5 Emissions in Baltimore City")
lines(d0)
dev.off()
