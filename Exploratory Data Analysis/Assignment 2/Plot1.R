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
##Compute year wise SUM of the pollution data 
##
d <- ddply(NEI,.(year),summarize,sum= sum(Emissions,na.rm=T))

##
##Generate charts and Save the file as a png file
##
png(file = "Plot1.png",width=480,height=480)
par(mfrow=c(1,1))
plot(d[,1],d[,2],cex=2.0,col="red",type="b",xlab= "Year(1999-2008)",ylab = "Emissions",main = "PM2.5 emissions in USA from 1999 to 2008")
dev.off()
