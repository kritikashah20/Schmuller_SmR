# notes for  chapter 2

# get / set working directory
getwd()

setwd("/Users/schmis12/wrk/studio/Schmuller_SmR/data")
getwd()

setwd("/Users/schmis12/wrk/studio/Schmuller_SmR")
getwd()


# create a vector
x <- c(3, 4, 5)


# list all objects
ls()


# sum up all vector elements
sum(x)

# arithmetic mean
mean(x)

# variance
var(x)


# NAs
capacities <- c(390, 350, 390, 360, 420, NA, NA, 566, NA)
mean(capacities)
mean(capacities, na.rm = TRUE)

# check for NAs
is.na(capacities)

# any NAs
any(is.na(capacities))


# user defined functions
sumofsquares <- function(x, y, z) {
  return(sum(c(x ^ 2, y ^ 2, z ^ 2)))
}

sumofsquares(3, 4, 5)


## numeric vectors

# integer
y <- c(10, 20, 30)
typeof(y)

# double
z <- c(10L, 20L, 30L)
typeof(z)

# sequences
u <- 10:30
u
v <- seq(10, 30)
v
w <- seq(10, 30, 2)
w

# repeat
tri <- c(6, 8, 2)
rep_tri <- rep(tri, 4)
rep_tri

## matrix

# create matrix from vector
num_mat <- seq(5, 100, 5)
dim(num_mat) <- c(5, 4)
num_mat

# or using matrix function
num_mat <- matrix(seq(5, 100, 5), nrow = 5)
num_mat

# transpose matrix
t(num_mat)

## factor
eye_color <- c(2, 2, 4, 1, 5, 5, 5, 6, 1, 3, 6, 3, 1, 4)
f_eye_color <- factor(eye_color)
levels(f_eye_color) <- c("amber", "blue", "brown", "gray", "green", "hazel")
f_eye_color

## list
# vector of empathy scores
empathy_score <- c(15, 21, 45, 32, 61, 74, 53, 92, 83, 22, 67, 55, 42, 44)

# list
eyes_and_empathy <- list(eyes_code = eye_color,
                         eyes = f_eye_color,
                         empathy = empathy_score)

eyes_and_empathy


# t.test returns a list
t_result <- t.test(eyes_and_empathy$empathy, mu = 30)
t_result


## data frame
e <- data.frame(eye_color, f_eye_color, empathy_score)
e
e[7, 3]
e[7,]

e.blue <- e$empathy_score[e$f_eye_color == "blue"]
e.blue
e.green <- e$empathy_score[e$f_eye_color == "green"]
e.green
e.hazel <- e$empathy_score[e$f_eye_color == "hazel"]
e.hazel
e.means <- c(mean(e.blue), mean(e.green), mean(e.hazel))
e.means


## packages
library(MASS)
anorexia

# mean weight change (in pounds)
mean(anorexia$Postwt - anorexia$Prewt)

# control group
cont <- anorexia[anorexia$Treat == "Cont",]
mean(cont$Postwt - cont$Prewt)

# cognitive behavioural treatment
cbt <- anorexia[anorexia$Treat == "CBT",]
mean(cbt$Postwt - cbt$Prewt)

# family treatment
ft <- anorexia[anorexia$Treat == "FT",]
mean(ft$Postwt - ft$Prewt)

# t-test: weight diff zero?
t.test(anorexia$Postwt - anorexia$Prewt, mu = 0)

# analysis of variance
aov(Postwt-Prewt ~ Treat, data = anorexia)


## read and write files

scores_frame <- data.frame(
    student = seq(1, 10),
    math_score = c(85, 91, 78, 88, 93, 82, 67, 79, 89, 98),
    science_score = c(90, 87, 75, 78, 99, 89, 71, 84, 88, 97))

# xlsx

# library readxl is part of tidyverse
# writexl has to be installed separately
library(writexl)

# write xlsx
writexl::write_xlsx(scores_frame,"./data/simpleExcel.xlsx")
# read xlsx
sc1 <- as.data.frame(readxl::read_xlsx("./data/simpleExcel.xlsx",))

# csv
write.csv(scores_frame, file = "./data/simple.csv", row.names = FALSE)
sc2 <- read.csv("./data/simple.csv")

# text
write.table(scores_frame, file = "./data/simple.txt", row.names = FALSE)
sc3 <- read.table("./data/simple.txt", header = TRUE)
