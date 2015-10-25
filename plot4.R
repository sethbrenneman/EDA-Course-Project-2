library(data.table)
library(dplyr)
library(ggplot2)

NEI <- data.table(readRDS("summarySCC_PM25.rds"))
SCC <- data.table(readRDS("Source_Classification_Code.rds"))
nums <- SCC %>% filter(grep("*Coal", EI.Sector)) %>% select(SCC)
nums <- as.character(nums$SCC)
indeces <- match(nums, NEI$SCC)
coal <- NEI[indeces,]
coal <- coal[!is.na(coal$year),]
coal$year <- as.factor(coal$year)
coal <- group_by(coal, year)
c <- tapply(coal$Emissions, coal$year, FUN=sum)
png("plot4.png")
qplot(c(1999, 2002, 2005, 2008), c, ylab = "Total Coal Emissions", xlab = "Year") + geom_smooth()
dev.off()