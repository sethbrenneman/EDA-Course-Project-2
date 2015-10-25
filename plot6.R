library(data.table)
library(ggplot2)

NEI <- data.table(readRDS("summarySCC_PM25.rds"))
SCC <- data.table(readRDS("Source_Classification_Code.rds"))
baltimore <- NEI[fips == "24510"]
la <- NEI[fips == "06037"]

b <- baltimore[baltimore$type == "ON-ROAD"]
l <- la[la$type == "ON-ROAD"]
#nums <- SCC %>% filter(grep("*Vehicle", EI.Sector)) %>% select(SCC)
#nums <- as.character(nums$SCC)

#indeces_balt <- match(nums, baltimore$SCC)
#indeces_balt <- indeces_balt[!is.na(indeces_balt)]
#b <- baltimore[indeces_balt,]
#b <- group_by(b, year)
#l <- group_by(l, year)

#indeces_la <- match(nums, la$SCC)
#indeces_la <- indeces_la[!is.na(indeces_la)]
#l <- la[indeces_la,]
#l <- group_by(l, year)

#sums_balt <- tapply(b$Emissions, b$year, FUN = sum)
#sums_la <- tapply(l$Emissions, l$year, FUN = sum)

sums_balt <- b[, sum(Emissions), by = year]
sums_la <- l[, sum(Emissions), by = year]

png("plot6.png", width = 960)
par(mfrow = c(1,2))
plot(sums_la, ylab = "Vehicle Emissions")
title(main = "LA")
plot(sums_balt, ylab = "Vehicle Emissions")
title(main = "Baltimore")
dev.off()