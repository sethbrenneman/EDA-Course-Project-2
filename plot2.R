library(data.table)

NEI <- data.table(readRDS("summarySCC_PM25.rds"))
SCC <- data.table(readRDS("Source_Classification_Code.rds"))
baltimore_sums <- NEI[fips == "24510"][, sum(Emissions), by = year]

png("plot2.png")
plot(baltimore_sums, ylab = "Total Emissions")
title(main = "Annual Total PM2.5 Emissions in Baltimore")
dev.off()