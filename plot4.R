#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library('ggplot2')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#limit codes to fuel coal combustion related data  
coal_compustion_codes <- SCC[grep( "^Fuel Comb.*Coal$", SCC$EI.Sector ) , 1 ]
#filter using specific codes
matches_scc  <- which(NEI$SCC %in%  coal_compustion_codes  )

dataset_4 <- NEI[matches_scc,]
maxs_4 <- aggregate( Emissions ~ year , data = dataset_4 , FUN = sum)

image <- qplot( maxs_4$year , maxs_4$Emissions ,  data = df_4 , geom = c("point", "smooth")) +  xlab('Years') + ylab("Emissions [tons]")
ggsave(file="plot4.png", plot=image)