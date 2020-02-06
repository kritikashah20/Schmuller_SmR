library(MASS)


### Base R Graphics


## Histogram

# distribution of price
hist(Cars93$Price)

# same with labels
hist(Cars93$Price,
     xlab = "Price (x $1,000)",
     ylab = "Frequency",
     xlim = c(0, 70),
     main = "Prices of 93 Models of 1993 Cars")

# same with probability instead of frequency
hist(Cars93$Price,
     xlab = "Price (x $1,000)",
     ylab = "Probability",
     xlim = c(0, 70),
     main = "Prices of 93 Models of 1993 Cars",
     probability = TRUE)

# adding density line
hist(Cars93$Price,
     xlab = "Price (x $1,000)",
     ylab = "Probability",
     xlim = c(0, 70),
     main = "Prices of 93 Models of 1993 Cars",
     probability = TRUE)
lines(density(Cars93$Price))



## Bar Chart

# distribution of type
table(Cars93$Type)

# as barchart
barplot(table(Cars93$Type))

# bar chart with custom limits, labels, line type and space
barplot(
  table(Cars93$Type),
  ylim = c(0, 25),
  xlab = "Car Type",
  ylab = "Frequency",
  space = .05
)



## Pie Chart
pie(table(Cars93$Type), main = "Distribution of Car Types")



## Dot Chart
# a kind of horizontal bar chart
type.frame <- data.frame(table(Cars93$Type))
type.frame
dotchart(type.frame$Freq, type.frame$Var1)

# also works using subsetting notation
dotchart(type.frame[,2], type.frame[,1])



## Grouped Bar Chart

# US commercial space revenues 1990 - 1994
rev.values <-
  c(1000,1300,1300,1100,1400,
    800,1200,1500,1850,2330,
    860,1300,1400,1600,1970,
    570,380,450,465,580,
    155,190,210,250,300)

# matrix (from vector)
space.rev <- matrix(rev.values, nrow = 5, byrow = T)

# column names
colnames(space.rev) <- c("1990", "1991", "1992", "1993", "1994")

# row names
rownames(space.rev) <- c(
  "Commercial Satellites Delivered",
  "Satellite Services",
  "Satellite Ground Equipment",
  "Commercial Launches",
  "Remote Sensing Data"
)

# colors
color.names = c(
  "black",
  "grey25",
  "grey50",
  "grey75",
  "white")

# bar chart
# beside=TRUE - bars will be besides each other
barplot(
  space.rev,
  beside = TRUE,
  xlab = "Year",
  ylab = "Revenue (x $1,000)",
  col = color.names
)

# add legend
legend(1,2300,rownames(space.rev), cex=0.7, fill = color.names, bty = "n")



## Scatter Plot

# with labels
plot(
  Cars93$Horsepower,
  Cars93$MPG.city,
  xlab = "Horsepower",
  ylab = "MPG City",
  main = "MPG City vs Horsepower"
)

# using formula notation
plot(
  Cars93$MPG.city ~ Cars93$Horsepower,
  xlab = "Horsepower",
  ylab = "MPG City",
  main = "MPG City ~ Horsepower"
)

# filled black dots
plot(
  Cars93$Horsepower,
  Cars93$MPG.city,
  xlab = "Horsepower",
  ylab = "MPG City",
  main = "MPG City ~ Horsepower",
  pch = 16
)

# plotting character = number of cylinders
# (adding 3rd variable)
plot(
  Cars93$Horsepower,
  Cars93$MPG.city,
  xlab = "Horsepower",
  ylab = "MPG City",
  main = "MPG City ~ Horsepower",
  pch = as.character(Cars93$Cylinders)
)



## Scatter Plot Matrix
cars.subset <- subset(Cars93, select = c(MPG.city, Price, Horsepower))
head(cars.subset)
pairs(cars.subset)

cars.subset <- subset(Cars93, select = c(MPG.city, Price, Horsepower, Cylinders))
head(cars.subset)
pairs(cars.subset)



## Box Plot

boxplot(Cars93$Horsepower ~ Cars93$Cylinders)

# nice labels
boxplot(Cars93$Horsepower ~ Cars93$Cylinders,
        xlab = "Cylinders",
        ylab = "Horsepower")

# nice labels using 'data' argument
boxplot(Horsepower ~ Cylinders, data = Cars93)
