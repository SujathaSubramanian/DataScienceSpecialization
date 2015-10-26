library(ggplot2)
library(plyr)

##
##Load the pollution data 
##

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
if(!exists("baltimoreNEIData"))
{
    baltimoreNEIData <- subset(NEI,fips == "24510")
}

##
##Compute year wise SUM of the pollution data for baltimore
##
d <- ddply(baltimoreNEIData,.(year,type),summarize,sum= sum(Emissions,na.rm=T))

##
##Generate charts and Save the file as a png file
##
png(file = "Plot3.png",width=480,height=480)
qplot(year,sum,data=d,geom =c("point","smooth"),xlab="Year(1999-2008)",ylab="Emissions",color=type,main= "Emissions in Baltimore City by Type")
dev.off()
