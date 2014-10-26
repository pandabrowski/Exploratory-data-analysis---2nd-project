#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission 
#from all sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


maxs <- aggregate( Emissions ~ year , data = NEI , FUN = sum)

png("plot1.png")
barplot(maxs$Emissions, names.arg = maxs$year , col = c("lightblue", "mistyrose", "lightcyan", "lavender") , 
        ylim=c(0,10000000) , yaxt='n'  , xlab="Year" , ylab = 'Emissions [tons]') 
axis(2,at=marks,labels=marks)

dev.off()

