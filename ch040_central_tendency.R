library(MASS)
library(ggplot2)

# central tendency (or location) of a distribution

## arithmetic mean

# heights of 5 year old children (in inches)
heights <- c(36, 42, 43, 37, 40, 45)
mean(heights)

# mean horsepower of cars made in USA
table(Cars93$Origin)

Horsepower.USA <- Cars93$Horsepower[Cars93$Origin == "USA"]
mean(Horsepower.USA)

# same of non-USA cars
Horsepower.NonUSA <- Cars93$Horsepower[Cars93$Origin == "non-USA"]
mean(Horsepower.NonUSA)

# get rid of the $ signs, using 'with()'
with(Cars93, mean(Horsepower[Origin == "USA"]))

# mean horsepower of USA cars with 4 cylinders
with(Cars93, mean(Horsepower[Origin == "USA" & Cylinders == 4]))

# horsepower histograms for USA and non-USA cars
ggplot(Cars93, aes(x = Horsepower)) +
  geom_histogram(color = "black", fill = "white", binwidth = 10) +
  facet_wrap(~Origin)

# trim extreme values (here: 5%)
mean(Horsepower.USA, trim = .05)


## geometric mean

# Suppose you have a 5-year investment that yields these percentages:
# 10 percent, 15 percent, 10 percent, 20 percent, and 5 percent.
# What’s the average annual rate of return?
invest <- c(1.10, 1.15, 1.10, 1.20, 1.05)
gm.invest <- prod(invest) ^ (1 / (length(invest)))
gm.invest            # solution: 11.88%
# prod() returns the product of its parameters


## harmonic mean

# To get to work in the morning and you drive 30 miles per hour.
# At the end of the day, you drive home at 50 miles per hour.
# What is the average rate for your total time on the road?
# It’s not 40 miles per hour, because you’re on the road a different amount of time for each leg of the trip.
speeds <- c(30, 50)
hm.speeds <- 1 / mean(1/speeds)
hm.speeds            # solution: 37.5 miles per hour



## median

reading.speeds <- c(56, 78, 45, 49, 55, 62)
mean(reading.speeds)

reading.speeds.new <- replace(reading.speeds, reading.speeds == 78, 180)
mean(reading.speeds.new)

sort(reading.speeds)
median(reading.speeds)

sort(reading.speeds.new)
median(reading.speeds.new)

Horsepower.Four <- Cars93$Horsepower[Cars93$Cylinders == 4]
sort(Horsepower.Four)
median(Horsepower.Four)


## mode
# the value that occurs most frequently

scores <- c(1, 2, 2, 2, 3, 4, 4, 4, 5, 6)
install.packages("modeest")
library(modeest)
mfv(scores)                       # most frequent value (of a numerical vector); function of package 'modeest'

# or
# table of all values, sort decreasing and show first 3 ranks
sort(table(scores), decreasing = TRUE)

# same, but show first 3 ranks only
sort(table(scores), decreasing = TRUE)[1:3]
