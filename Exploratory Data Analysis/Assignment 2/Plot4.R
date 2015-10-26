library(ggplot2)
library(plyr)
library(reshape2)

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
##Identify all the SCC code matching with "Coal Combusttion"
##
ids <- as.integer(grep("*Coal", SCC[,4]))
matchingSCC <- unique(SCC[ids,1])

##
##Filter the NEI data for the matching SCC Codes
##
coalCombustionData <- subset(NEI,SCC %in% matchingSCC)

##
##Compute year wise SUM of the pollution data 
##
d <- ddply(coalCombustionData,.(year),summarize,sum= sum(Emissions,na.rm=T))

##
##Generate charts and Save the file as a png file
##
png(file = "Plot4.png",width=480,height=480)
qplot(year,sum,data=d,geom =c("point","smooth"),xlab="Year(1999-2008)",ylab="Emissions",main ="Emissions from Coal Combustion-related sources")
dev.off()


