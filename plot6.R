#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources
#in Los Angeles County, California (fips == "06037").
#Which city has seen greater changes over time in motor vehicle emissions?

library('ggplot2')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#pick only mobile sources codes
SCC_mobile_vehicles <- SCC[grep( "Mobile Sources", SCC$SCC.Level.One), 1]

#narrow dataset to specific codes
dataset_6_intermediate <-   NEI[which(NEI$SCC %in%  SCC_mobile_vehicles),]

#pick only data from LA using code and only vehicles
dataset_6 <- subset(dataset_6_intermediate, fips == "06037"  & type=="ON-ROAD") 


#add Baltimore data to the dataset
dataset_6 <- rbind(dataset_6,  subset(dataset_6_intermediate, fips == "24510"  & type=="ON-ROAD")  )

maxs_6 <- aggregate( Emissions ~ year + fips, data = dataset_6 , FUN = sum)

#change fips field name and descriptions tothe city names
names(maxs_6)[2] = 'City'
maxs_6[,2][maxs_6[,2] == "06037"] <- "Los Angeles"
maxs_6[,2][maxs_6[,2] == "24510" ] <- "Baltimore" 

image <-qplot( year , Emissions , color= City , data = maxs_6 , geom = c("point" , "smooth") ) + xlab('Years') + ylab("Emissions [tons]")

ggsave(file="plot6.png", plot=image)