library(MASS)

### Dispersion (or variability) of a distribution

# two groups of children and their heights in inches
heights1 <- c(48, 48, 48, 48, 48)
heights2 <- c(50, 47, 52, 46, 45)

# mean is the same
mean(heights1)            # 48
mean(heights2)            # 48


## Variance

# sample variance (s2)
# CAVE: unit is square inches!
var(heights1)             # 0
var(heights2)             # 8.5

# population variance (sigma2)
var.p <- function(x) {var(x) * (length(x) - 1) / length(x)}
var.p(heights1)           # 0
var.p(heights2)           # 6.8



## Standard Deviation

# sample standard deviation (sqrt(s2))
# unit is inches
# (because standard deviation is square root of variance)
sd(heights1)              # 0
sd(heights2)              # 2.915476

# population standard deviation (sqrt(sigma2))
sd.p <- function(x) {sd(x) * sqrt((length(x) - 1) / length(x))}
sd.p(heights1)
sd.p(heights2)


# exercise with Cars93

# variance and standard deviation of horsepower of cars that originated in the USA
with(Cars93, var(Horsepower[Origin == "USA"]))          # 2965.319
with(Cars93, sd(Horsepower[Origin == "USA"]))           # 54.45474

# how many cars are in this group? (better: how many horsepower entries do we have?)
with(Cars93, length(Horsepower[Origin == "USA"]))       # 48

# how about non-USA cars?
with(Cars93, var(Horsepower[Origin == "non-USA"]))      # 2537.283
with(Cars93, sd(Horsepower[Origin == "non-USA"]))       # 50.37145

# how many non-USA cars do we have?
with(Cars93, length(Horsepower[Origin == "non-USA"]))   # 45
