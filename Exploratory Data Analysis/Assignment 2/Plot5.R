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
baltimoreNEIData <- subset(NEI,fips == "24510")

##
##Identify all the SCC code matching for Motor Vehicle Data
##
id <- as.integer(grep("*Vehicles", SCC[,4]))
matchingSCC <- SCC[id,1]

##
##Filter the NEI data for the matching SCC Codes
##
mvPollutionData <- subset(baltimoreNEIData,SCC %in% matchingSCC)


##
##Compute year wise SUM of the pollution data for baltimore
##
d <- ddply(mvPollutionData,.(year),summarize,sum= sum(Emissions,na.rm=T))

##
##Generate charts and Save the file as a png file
##
png(file = "Plot5.png",width=480,height=480)
qplot(year,sum,data=d,geom =c("point","smooth"),xlab="Year(1999-2008)",ylab="Emissions",main="Emissions from Motor Vehicle in Baltimore City")
dev.off()



