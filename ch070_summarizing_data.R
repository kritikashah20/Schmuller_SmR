data(Cars93, package = "MASS")

# number of variables in a data frame
length(Cars93)
ncol(Cars93)

# number of rows
nrow(Cars93)

# number of US cars
sum(Cars93$Origin == "USA")

# number of non-US cars
sum(Cars93$Origin != "USA")

# combination of conditions
with(Cars93, sum(Origin == "USA" & Cylinders == 4))

Horsepower.USA.Four <- with(Cars93, Horsepower[Origin == "USA" & Cylinders == 4])
Horsepower.USA.Four

# high
max(Horsepower.USA.Four)
# low
min(Horsepower.USA.Four)
# high & low
range(Horsepower.USA.Four)
