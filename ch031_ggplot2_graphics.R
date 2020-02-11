library(ggplot2)
library(MASS)

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

# remove x-lines; y-lines dotted
ggplot(data = type.frame, aes(x = Frequency, y = reorder(Type, Frequency))) +
  geom_point(size = 4) +
  theme_bw() +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(color = "black", linetype = "dotted")
  ) +
  labs(y = "Type")



# barchart using ggplot2
ggplot(data = Cars93) +
  aes(Cars93$Type) +
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


