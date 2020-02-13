library(ggplot2)
library(MASS)
library(reshape2)

### ggplot2 Graphics


## Histogram

# distribution of price
ggplot(data = Cars93, aes(x = Price)) +
  geom_histogram()

ggplot(data = Cars93, aes(x = Price)) +
  geom_histogram(binwidth = 5, color = "black", fill = "white")

ggplot(data = Cars93, aes(x = Price)) +
  geom_histogram(binwidth = 5,
                 color = "black",
                 fill = "white") +
  labs(x = "Price (x $1,000)",
       y = "Frequency",
       title = "Prices of 93 Models of 1993 Cars")


# bins between $0 and $65,000
# in steps of $5,000
ggplot(data = Cars93) +
  aes(Price) +
  geom_histogram(breaks = seq(0, 65, 5)) +
  xlab("Price (x $1,000)") +
  ylab("Frequency")




## Bar Chart

# frequency of car types
ggplot(data = Cars93, aes(x = Type)) +
  geom_bar() +
  labs(y = "Frequency",
       title = "Car Type and Frequency in Cars93",
       subtitle = "1993",
       caption = "Data Source: MASS")


## Dot Chart

# prepare data
type.frame <- data.frame(table(Cars93$Type))
colnames(type.frame) <- c("Type", "Frequency")

# draw plot
ggplot(data = type.frame, aes(x = Frequency, y = Type)) +
  geom_point()

# reorder sequence of types (depending on frequency)
ggplot(data = type.frame, aes(x = Frequency, y = reorder(Type, Frequency))) +
  geom_point(size = 4)

# remove vertical lines
# dotted horizontal lines
ggplot(data = type.frame, aes(x = Frequency, y = reorder(Type, Frequency))) +
  geom_point(size = 4) +
  theme_bw() +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(color = "black", linetype = "dotted")
  ) +
  labs(y = "Type")



## Grouped Bar Chart

# prepare data
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

# melt() : turn wide format into long format
space.melt <- melt(space.rev)
# set column names
colnames(space.melt) <- c("Industry", "Year", "Revenue")
# or:
names(space.melt) <- c("Industry", "Year", "Revenue")

# or, do it all at once
space.melt <-
  melt(space.rev,
       varnames = c("Industry", "Year"),
       value.name = "Revenue")

# plot the grouped bar chart
ggplot(space.melt, aes(x = Year, y = Revenue, fill = Industry)) +
  geom_bar(stat = "identity")

# tell the bars to “dodge” each other and line up side-by-side
ggplot(space.melt, aes(x = Year, y = Revenue, fill = Industry)) +
  geom_bar(stat = "identity",
           position = "dodge")

# same with gray scale and nice labels
ggplot(space.melt, aes(y = Revenue, x = Year, fill = Industry)) +
  geom_bar(stat = "identity",                 # use given numbers (revenue), not frequencies
           position = "dodge",                # bars dodge side-by-side, not stacked
           color = "black") +                 # black outline
  scale_fill_grey(start = 0, end = 1) +       # grey scale colors
  labs(y = "Revenue (x $1,000)") +            # labels
  theme_bw() +                                # b/w theme
  theme(panel.grid.major.x = element_blank()) # remove vertical lines




# barchart using ggplot2
ggplot(data = Cars93, aes(x = Cars93$Type)) +
  geom_bar() +
  xlab("Type") +
  ylab("Frequency") +
  labs(title = "Car Types Distribution", subtitle = "1993", caption = "Data Source: MASS")



## scatter plot

# ggplot2
ggplot(data = Cars93) + aes(x = Cars93$Horsepower, y = Cars93$MPG.city) +
  geom_point() +
  xlab("Horsepower") + ylab("MPG City")

# colored 3rd variable (type)
ggplot(data = Cars93) +
  aes(x = Cars93$Horsepower,
      y = Cars93$MPG.city,
      color = Type) +
  geom_point() +
  xlab("Horsepower") + ylab("MPG City")



## box plots

# horsepower ~ cylinders
ggplot(data = Cars93) + aes(x = Cylinders, y = Horsepower) + geom_point()

# as boxplot
ggplot(data = Cars93) + aes(x = Cylinders, y = Horsepower) + geom_boxplot()


