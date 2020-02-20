data(Cars93, package = "MASS")

## z-Score

Horsepower.USA.Eight <- with(Cars93, Horsepower[Origin == "USA" & Cylinders == 8])
Horsepower.USA.Eight
# mean
mean(Horsepower.USA.Eight)
# standard deviation
sd(Horsepower.USA.Eight)

# z-scores (incl. mean and sd)
scale(Horsepower.USA.Eight)                   # for a sample
N <- length(Horsepower.USA.Eight)
scale(Horsepower.USA.Eight) / sqrt((N-1)/N)   # for a population


## T-Score

# is a z-score with unit 10 and mean 50
# T = z * 10 + 50
T.Hp.Eight <- round((10 * scale(Horsepower.USA.Eight) + 50), digits = 0)
T.Hp.Eight


## SAT-Score (C-Score)

# is a z-score with unit 100 and mean 500
# SAT = z * 10 + 50
SAT.Hp.Eight <- round((100 * scale(Horsepower.USA.Eight) + 500), digits = 0)
SAT.Hp.Eight


## IQ

# is a z-score with standard deviation (unit) 15 and mean 100
# T = z * 10 + 50
test_results <- c(49, 48, 52, 60, 38, 43, 55, 53, 40, 61, 58, 51, 50, 47)
IQ <- round((15 * scale(test_results) + 100), digits = 0)
IQ


## Ranking

# default: ascendant (lowes value: 1st rank)
Horsepower.USA.Eight
rank(Horsepower.USA.Eight)
# for descending order put a minus in front
-Horsepower.USA.Eight
rank(-Horsepower.USA.Eight)


# how to rank equal values?

tied.Horsepower <- replace(Horsepower.USA.Eight, 6, 200)        # replace 6th value with 200
tied.Horsepower

# default: average
rank(tied.Horsepower)
rank(tied.Horsepower, ties.method = "average")
# minimum rank
rank(tied.Horsepower, ties.method = "min")
# maximum rank
rank(tied.Horsepower, ties.method = "max")


# nth lowest, nth highest rank

sort(Horsepower.USA.Eight)
# 2nd lowest
sort(Horsepower.USA.Eight)[2]
# 2nd highest
N <- length(Horsepower.USA.Eight)
sort(Horsepower.USA.Eight)[N-1]


# Percentiles
sort(Horsepower.USA.Eight)
quantile(Horsepower.USA.Eight)

# exclusive quartiles
quantile(Horsepower.USA.Eight, type = 6)  # default: type=7

# user defined percentiles
quantile(Horsepower.USA.Eight, c(.54, .68, .91))



# Percent ranks

# find the percent ranks that correspond to given scores in a data set
percent.ranks <- function(x){round((rank(x) / length(x)) * 100, digits = 2)}
percent.ranks(Horsepower.USA.Eight)


xx <- c(15,20,25,30,35,40,45,50)
mean(xx)
# proportion of scores > 15
mean(xx > 15)
# why does this work?
# because TRUE converts to 1 and FALSE to 0:
xx > 15
# proportion of scorse <= 28
mean(xx <= 28)
# proportion of USA 8 cylinder cars with less than 273 HP
mean(Horsepower.USA.Eight <= 273) * 100

# minimum, lower hinge, median, upper hinge, and maximum:
fivenum(Horsepower.USA.Eight)

# summary
summary(Horsepower.USA.Eight)
