#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
#Use the base plotting system to make a plot answering this question.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")



dataset_2 <- NEI[NEI$fips == "24510",]
maxs_2 <- aggregate( Emissions ~ year , data = dataset_2 , FUN = sum)

png("plot2.png")

barplot(maxs_2$Emissions, names.arg = maxs_2$year , 
        col = c("lightblue", "mistyrose", "lightcyan", "lavender"), 
        ylim=c(0,4000) , xlab= 'year' , ylab = 'Emissions [tons]')

dev.off()