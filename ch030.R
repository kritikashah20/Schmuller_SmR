library(tidyverse)
library(MASS)



## histogram

# distribution of price
# (bins of $5,000 between $0 and $65,000)
ggplot(data = Cars93) + aes(Price) + geom_histogram(breaks = seq(0, 65, 5)) +
  xlab("Price (x $1,000)") + ylab("Frequency")



## barchart

# distribution of type
ggplot(data = Cars93) + aes(Cars93$Type) + geom_bar() +
  xlab("Type") + ylab("Frequency")



## scatter plot

# base R
plot(Cars93$Horsepower, Cars93$MPG.city)

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


