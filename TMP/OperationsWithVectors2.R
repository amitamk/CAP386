# Operations with vectors
# Average temperature in Baltimore
tempHi <- c(41.2,44.8,53.9,64.5,73.9,82.7,87.2,85.1,78.2,67.0,56.3,46.0)
tempLo <- c(23.5,26.1,33.6,42.0,51.8,60.8,65.8,63.9,56.6,43.7,34.7,27.3)
diff <- tempHi-tempLo
diff
tempHiC <- (5/9) * (tempHi - 32)
tempHiC
tooHot <- (tempHiC > 25)
tooHot