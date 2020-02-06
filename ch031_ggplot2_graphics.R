library(ggplot2)
library(MASS)


## histogram

# histogram with ggplot2
# (bins of $5,000 between $0 and $65,000)
ggplot(data = Cars93) +
  aes(Price) +
  geom_histogram(breaks = seq(0, 65, 5)) +
  xlab("Price (x $1,000)") +
  ylab("Frequency")




## bar chart

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


