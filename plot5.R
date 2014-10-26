#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
library('ggplot2')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#pick only mobile sources codes
SCC_mobile_vehicles <- SCC[grep( "Mobile Sources", SCC$SCC.Level.One), 1]

#narrow dataset to specific codes
dataset_5 <-   NEI[which(NEI$SCC %in%  SCC_mobile_vehicles),]

#pick only data from Baltimore City using code and only vehicles
dataset_5 <- subset(dataset_5, fips == "24510" & type=="ON-ROAD" )


maxs_5 <- aggregate( Emissions ~ year , data = dataset_5 , FUN = sum)



image <-  qplot( year , Emissions , data = maxs_5 , geom = c("point" , "smooth") ) + xlab('Years') + ylab("Emissions [tons]")
  
ggsave(file="plot5.png", plot=image)