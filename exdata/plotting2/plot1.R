library(ggplot2)

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")


#PLOT 2 
#balt <- NEI[NEI$fips == "24510",]
#
#total <- tapply(balt$Emissions, balt$year, FUN=sum)
#
#png('plot2.png')
#
#plot(levels(factor(NEI$year)),
#
#     total,
#
#     xlab="Year",
#
#     ylab="Total Emissions (tons)",
#
#     main="Total SCC Emissions By Year For Baltimore City",
#
#     type="l",
#
#     col="blue")
#
#dev.off()


#balt <- NEI[NEI$fips == "24510",]
#
#total <- as.data.frame(as.table(tapply(balt$Emissions, list(balt$year, balt$type), FUN=sum)))
#
#names(total) <- c("Year", "type", "Emissions")
#
#png('plot3.png')
#
#p <- qplot(Year,
#
#           Emissions,
#
#           data=total,
#
#           color=type,
#
#           group=type,
#
#           geom="line",
#
#           main="Total Emissions By Year in Baltimore")
#
#print(p)
#
#dev.off()


#vehicles <- SCC[grepl("vehicle", SCC$EI.Sector, ignore.case=TRUE),]
#
#emissions <- NEI[(NEI$SCC %in% vehicles$SCC) & (NEI$fips == "24510"),]
#
#total <- tapply(emissions$Emissions, emissions$year, FUN=sum)
#
#png('plot5.png')
#
#plot(levels(factor(NEI$year)),
#
#           total,
#
#           type="l",
#
#           col="blue",
#
#           xlab="Year",
#
#           ylab="Total Emissions (ton)",
#
#           main="Total Emissions For Vehicle Related Emissions in Baltimore")
#
#dev.off()

# PLOT 6
vehicles <- SCC[grepl("vehicle", SCC$EI.Sector, ignore.case=TRUE),]
emissions <- NEI[(NEI$SCC %in% vehicles$SCC) & (NEI$fips == "24510" | NEI$fips == "06037"),]
total <- as.data.frame(as.table(tapply(emissions$Emissions, list(emissions$year, emissions$fips), FUN=sum)))
names(total) <- c("Year", "fips", "Emissions")

total$fips <- sapply(total$fips, FUN = function(x) if(x == "24510") "BALTIMORE" else "LOS ANGELES")

png('plot6.png')

p<-qplot(Year,
      Emissions,
      color=fips,
      group=fips,
      data=total,
      geom="line",
      xlab="Year",
      ylab="Total Emissions (ton)",
      main="Total Emissions For Vehicle Related Emissions in Baltimore")
print(p)
dev.off()



