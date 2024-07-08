library(Rcmdr)
grupo12 <- read.csv("dataset.csv", header = TRUE, sep = ";", dec = ",")

library(fitdistrplus)
library(GGally)
library(scatterplot3d)
library(ggplot2)
library(car)
library(rgl)
library(ks)
library(goftest)
# Data Cleaning
auxSpeed <- grupo12[,"Speed"]
Speed <- auxSpeed[!is.na(auxSpeed)] # Cleans NA
auxPressure <- grupo12[,"Pressure"]
Pressure <- auxPressure[!is.na(auxPressure)]
auxType <- grupo12[,"Type"]
Type <- auxType[!is.na(auxType)]
auxDef <- grupo12[,"Def"]
Def <- auxDef[!is.na(auxDef)]
auxTime <- grupo12[,"Time"]
Time <- auxTime[!is.na(auxTime)]
auxCost <- grupo12[,"Cost"]
Cost <- auxCost[!is.na(auxCost)]
auxVolume <- grupo12[,"Volume"]
Volume <- auxVolume[!is.na(auxVolume)]
auxThickness <- grupo12[,"Thickness"]
Thickness <- auxThickness[!is.na(auxThickness)]
auxResistance <- grupo12[,"Resistance"]
Resistance <- auxResistance[!is.na(auxResistance)]

# Exercise 1
numSummary(grupo12[,"Speed", drop=FALSE], statistics=c("mean", "sd"))
meanSpeed <- mean(Speed)
sdSpeed <- sd(Speed)
hist(Speed, prob=TRUE, col="yellow")
curve(dnorm(x, mean=meanSpeed, sd=sdSpeed), add=TRUE, col="darkblue")
descdist(Speed, discrete=FALSE)

### Tests for a Normal Distribution
partition1 <- c(20,40,60) # suggested by histogram
partition1
# Counts for chosen partition
countPartition <- function(Speed, partition1) {
  tt <- table(Speed)
  comp <- length(as.numeric(tt))
  counts <- rep(0,length(partition1)+1)
  for (i in 1:comp) {
    loc <- sum(as.numeric(names(tt))[i] > partition1) + 1
    counts[loc] <- counts[loc] + as.numeric(tt)[i]
  }
  return(counts)
}
counts1 <- countPartition(Speed, partition1)
counts1
### Probabilities for a Normal Distribution
probabilitiesPNorm <- function(Speed, partition1) {
  comp <- length(partition1) + 1
  probs <- rep(0, comp)
  probs[1] <- pnorm(partition1[1], mean=meanSpeed, sd=sdSpeed, lower.tail=TRUE)
  for (i in 2:(comp-1)) probs[i] <- pnorm(partition1[i], mean=meanSpeed, sd=sdSpeed, lower.tail=TRUE) - pnorm(partition1[i-1], mean=meanSpeed, sd=sdSpeed, lower.tail=TRUE)
  probs[comp] <- 1 - pnorm(partition1[comp-1], mean=meanSpeed, sd=sdSpeed, lower.tail=TRUE)
  return(probs)
}
probabilities1 <- probabilitiesPNorm(Speed, partition1)
probabilities1
sum(probabilities1)
xk1 <- counts1
xk1
n1 <- sum(xk1)
n1
pk1 <- probabilities1
pk1
npk1 <- n1 * pk1
npk1 # Rules are verified
chisq.test(xk1, p=pk1) # Chi-Square Test (NOTE: Low-power test, hence conducted only once for demonstration purposes)
ks.test(Speed, "pnorm", mean=meanSpeed, sd=sdSpeed) # Kolmogorov-Smirnov Test
ad.test(Speed, "pnorm", mean=meanSpeed, sd=sdSpeed) # Anderson-Darling Test
shapiro.test(Speed) # Shapiro-Wilk Test

### Tests for a Chi-Square Distribution
partition1.2 <- c(2.5,5,7.5)
gl <- 2
counts1.2 <- countPartition(Speed, partition1.2)
counts1.2
probabilitiesPChisq <- function(Speed, partition1.2) {
  comp <- length(partition1.2) + 1
  probs <- rep(0, comp)
  probs[1] <- pchisq(c(partition1.2[1]), df=gl, lower.tail=TRUE)
  for (i in 2:(comp-1)) probs[i] <- pchisq(c(partition1.2[i]), df=gl, lower.tail=TRUE) - pchisq(c(partition1.2[i-1]), df=gl, lower.tail=TRUE)
  probs[comp] <- 1 - pchisq(c(partition1.2[comp-1]), df=gl, lower.tail=TRUE)
  return(probs)
}
probabilities1.2 <- probabilitiesPChisq(Speed, partition1.2)
probabilities1.2
xk1.2 <- counts1.2
xk1.2
n1.2 <- sum(xk1.2)
n1.2
pk1.2 <- probabilities1.2
pk1.2
npk1.2 <- n1.2 * pk1.2
npk1.2 # Rules are verified
ks.test(Speed, "pchisq", df=gl)
ad.test(Speed, "pchisq", df=gl)

### Tests for a Uniform Distribution
minSpeed <- min(Speed)
maxSpeed <- max(Speed)
ks.test(Speed, "punif", min=minSpeed, max=maxSpeed)
ad.test(Speed, "punif", min=minSpeed, max=maxSpeed)

### Question 2
meanPress <- 350
sdPress <- 121
hist(Pressure, prob=TRUE, col="pink")
curve(dnorm(x, mean=meanPress, sd=sdPress), add=TRUE, col="darkblue")
partition2 <- c(100,150,200,250,300,350,400,450,500,550,600)
partition2
counts2 <- countPartition(Pressure, partition2)
counts2
n2 <- sum(counts2)
n2
probabilities2 <- probabilitiesPNorm(Pressure, partition2)
probabilities2
sum(probabilities2)
xk2 <- counts2
xk2
n2 <- sum(xk2)
n2
pk2 <- probabilities2
pk2
npk2 <- n2 * pk2
npk2
# Direct Chi-Square Test
chisq.test(xk2, p=pk2)
# Kolmogorov Test
ks.test(Pressure, "pnorm", mean=meanPress, sd=sdPress)
# Anderson-Darling Test
ad.test(Pressure, "pnorm", mean=meanPress, sd=sdPress)
# Shapiro Test
shapiro.test(Pressure)

# Exercise 3
X <- table(Type)
countsA <- ifelse("A" %in% names(X), X[names(X)=="A"], 0)
countsB <- ifelse("B" %in% names(X), X[names(X)=="B"], 0)
countsM <- ifelse("M" %in% names(X), X[names(X)=="M"], 0)
xk3 <- c(countsA, countsB, countsM)

# Remove categories with zero counts
xk3 <- xk3[xk3 != 0]

n3 <- sum(xk3)
pk3 <- c(30/100, 60/100, 10/100)
npk3 <- n3 * pk3 # Frequências esperadas

# Chi-Square Test
chisq.test(xk3, p=npk3)

### Exercise 4
pairs(~Time+Speed+Thickness+Resistance) # Scatterplot
n4 <- length(Time)
n4
# Multilinear Model
model.multilinear4 <- lm(Time~Speed+Thickness+Resistance)
summary(model.multilinear4) # Coefficient of determination and p-value
model.multilinear4$coefficients
k4 <- 3
### Removing one at a time
model.multilinear4B <- lm(Time~Speed+Thickness) # Without Resistance
summary(model.multilinear4B)
model.multilinear4C <- lm(Time~Speed+Resistance) # Without Thickness
summary(model.multilinear4C)
model.multilinear4D <- lm(Time~Thickness+Resistance) # Without Speed
summary(model.multilinear4D)
### Simultaneous null test
anova(simplifiedmodel4, simplifiedmodel4B, simplifiedmodel4C, simplifiedmodel4D)
simplifiedmodel4B <- lm(Time~Speed+Thickness)
simplifiedmodel4C <- lm(Time~Speed+Resistance)
simplifiedmodel4D <- lm(Time~Thickness+Resistance)
### Pairwise null test
linearHypothesis(simplifiedmodel4, c("Speed=0", "Thickness=0", "Resistance=0"))
linearHypothesis(simplifiedmodel4B, c("Speed=0", "Thickness=0"))
linearHypothesis(simplifiedmodel4C, c("Speed=0", "Resistance=0"))
linearHypothesis(simplifiedmodel4D, c("Thickness=0", "Resistance=0"))
# Other information
sigma
srk4 <- 15.11983 * sqrt( (n4 - 1) / (n4 - 4) )
### Residual
residual4 <- (srk4 - sigma.k4) / sigma.k4
residual4
# Confidence Interval
confint(simplifiedmodel4, level=0.95)

### Exercise 5
auxTime[is.na(auxSpeed)] <- meanSpeed
auxSpeed[is.na(auxSpeed)] <- meanSpeed
auxPressure[is.na(auxPressure)] <- meanSpeed
auxVolume[is.na(auxVolume)] <- meanSpeed

### Exercise 8
a6 <- 30
b6 <- 40
v6 <- runif(100, a6, b6)
v6
hist(v6, prob=TRUE, col="cyan")
meanV6 <- mean(v6)
meanV6
sdV6 <- sd(v6)
sdV6
curve(dnorm(x, mean=meanV6, sd=sdV6), add=TRUE, col="red")
descdist(v6, discrete=FALSE)
# Linear
ks.test(v6, "pnorm", mean=meanV6, sd=sdV6)
# Andersen-Darling
ad.test(v6, "pnorm", mean=meanV6, sd=sdV6)
# Shapiro-Wilk
shapiro.test(v6)

### Exercise 9
mean9 <- 40
sd9 <- 10
hist(Cost, prob=TRUE, col="green")
curve(dnorm(x, mean=mean9, sd=sd9), add=TRUE, col="purple")
partition9 <- c(5,10,15,20,25,30,35,40,45,50,55,60,65,70)
partition9
counts9 <- countPartition(Cost, partition9)
counts9
n9 <- sum(counts9)
n9
probabilities9 <- probabilitiesPNorm(Cost, partition9)
probabilities9
sum(probabilities9)
xk9 <- counts9
xk9
n9 <- sum(xk9)
n9
pk9 <- probabilities9
pk9
npk9 <- n9 * pk9
npk9 # Rules are verified
chisq.test(xk9, p=pk9) # Chi-Square Test (Low-power test conducted once for demonstration purposes)
ks.test(Cost, "pnorm", mean=mean9, sd=sd9) # Kolmogorov-Smirnov Test
ad.test(Cost, "pnorm", mean=mean9, sd=sd9) # Anderson-Darling Test
shapiro.test(Cost) # Shapiro-Wilk Test
