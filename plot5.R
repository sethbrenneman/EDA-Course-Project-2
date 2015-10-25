library(data.table)
library(ggplot2)

NEI <- data.table(readRDS("summarySCC_PM25.rds"))
SCC <- data.table(readRDS("Source_Classification_Code.rds"))
baltimore <- NEI[fips == "24510"]

b <- baltimore[baltimore$type == "ON-ROAD"]
#b <- group_by(b, year)
sums <- b[, sum(Emissions), by = year]
png("plot5.png")
qplot(sums$year, sums$V1, ylab = "Vehicle Emissions", xlab = "Year") + geom_smooth()
dev.off()