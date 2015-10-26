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
##Select the baltimore and Los Angeles data
##
NEIData <- subset(NEI,fips == "24510" | fips == "06037")

##
##Identify all the SCC code matching for Motor Vehicle Data
##
id <- as.integer(grep("*Vehicles", SCC[,4]))
matchingSCC <- SCC[id,1]

##
##Filter the NEI data for the matching SCC Codes
##
mvPollutionData <- subset(NEIData,SCC %in% matchingSCC)


##
##Compute year wise SUM of the pollution data for baltimore
##
d <- ddply(mvPollutionData,.(year,fips),summarize,sum= sum(Emissions,na.rm=T))

##
##Generate charts and Save the file as a png file
##
png(file = "Plot6.png",width=480,height=480)
par(mfrow=c(1,2),oma = c(0, 0, 3, 0))
barplot(d[d$fips=="24510",3],cex.axis = .55,cex.names=.55,names.arg=d[d$fips=="24510",1],xlab= "Year",ylab="Emissions",,main="Baltimore City",col="blue")
barplot(d[d$fips=="06037",3],cex.axis = .55,cex.names=.55,names.arg=d[d$fips=="06037",1],xlab= "Year",ylab="Emissions",main="Los Angeles County",col="red")
mtext("Motor Vehicles Emissions", outer = TRUE, cex = 1.5)
dev.off()




# sample plot taken from the evaluation during the course create plot
##ggplot(data=totalEmissionsMotorYearCounty, aes(x=year, y=Emissions)) + geom_bar(stat='identity', aes(fill=year)) + 
  ##  scale_x_continuous(breaks = seq(1999, 2008, 3)) +
##    guides(fill=F) +
 ##   ggtitle(expression("Motor Vehicle Related " * PM[2.5] * " Emissions in Baltimore vs. Los Angeles")) +
    ##ylab(expression("Motor Vehicle Related " * PM[2.5] * " Emissions (tons)")) + 
    ##xlab("Year") + 
    ##theme(legend.position='none') + 
    ##facet_grid(. ~ county) +
    ##geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=-1))




