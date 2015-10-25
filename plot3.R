library(data.table)
library(dplyr)
library(ggplot2)

NEI <- data.table(readRDS("summarySCC_PM25.rds"))
SCC <- data.table(readRDS("Source_Classification_Code.rds"))
baltimore <- NEI[fips == "24510"]
baltimore <- summarize(group_by(baltimore, year, type), sum(Emissions))
baltimore$type <- as.factor(baltimore$type)
baltimore$em <- baltimore$`sum(Emissions)`

png("plot3.png")
qplot(year, em, data = baltimore, color = type) + geom_smooth()
dev.off()