library(dslabs)
data(heights)

summary(heights$height)

#Encontrando todos los persentiles en heights
p <- seq(0.01, 0.99, 0.01)
percentiles <- quantile(heights$height, p)
percentiles

#Validando que son lo mismo el percentil 25 y 75
percentiles[names(percentiles) == "25%"]
percentiles[names(percentiles) == "75%"]

#qnorm da un valor de z para la curva normal, dada una probabilidad p. 
#qnorm y pnorm son funciones inversas

# define x and z
library(tidyverse)
library(dslabs)
data(heights)
index <- heights$sex=="Male"
x <- heights$height[index]
x
z <- scale(x)
z

# proportion of data below 69.5
mean(x <= 69.5)

# calculate observed and theoretical quantiles
p <- seq(0.05, 0.95, 0.05)
observed_quantiles <- quantile(x, p)
theoretical_quantiles <- qnorm(p, mean = mean(x), sd = sd(x))

# make QQ-plot
plot(theoretical_quantiles, observed_quantiles)
abline(0,1)

# make QQ-plot with scaled values
observed_quantiles <- quantile(z, p)
theoretical_quantiles <- qnorm(p)
plot(theoretical_quantiles, observed_quantiles)
abline(0,1)
