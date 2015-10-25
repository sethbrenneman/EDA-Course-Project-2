library(data.table)

NEI <- data.table(readRDS("summarySCC_PM25.rds"))
SCC <- data.table(readRDS("Source_Classification_Code.rds"))
sums <- NEI[, sum(Emissions), by = year]

png("plot1.png")
plot(sums, ylab = "Total Emissions")
title(main = "Annual Total PM2.5 Emissions")
dev.off()