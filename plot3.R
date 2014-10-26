#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
#which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
#Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot answer this question.
library('ggplot2')

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


maxs_3 <- aggregate( Emissions ~ year + type, data = dataset_2 , FUN = sum)
image = qplot(year, Emissions , color = type , data=df3  , geom = c("point", "smooth")  ) +
  xlab('Years') + ylab("Emissions [tons]")
ggsave(file="plot3.png", plot=image)