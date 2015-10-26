setwd("C:\\Users\\Suja\\OneDrive\\Coursera\\DataScienceCoursera\\Exploratory Data Analysis\\Assignment 2\\exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
str(NEI)
SCC <- readRDS("Source_Classification_Code.rds")
head(SCC)


head(NEI)
unique(NEI$year)
yearWwith(NEI,tapply(NEI$Emissions,NEI$year,sum,na.rm=T))
