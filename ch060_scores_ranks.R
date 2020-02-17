library(MASS)

## z-scores

Horsepower.USA.Eight <- Cars93$Horsepower[Cars93$Origin == "USA" & Cars93$Cylinders == 8]
Horsepower.USA.Eight
# mean
mean(Horsepower.USA.Eight)
# standard deviation
sd(Horsepower.USA.Eight)
# z-scores (incl. mean and sd)
scale(Horsepower.USA.Eight)


## ranking

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
