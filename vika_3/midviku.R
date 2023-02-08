# miðvikudagsæfing 3
# Þorvaldur Tumi Baldursson - 1. feb 2023

# dæmi 14
d14a <- qnorm(0.975)
d14b <- qt(0.95, 40)
d14c <- qchisq(0.95, 1)
d14d <- qf(0.95, 10, 20)

# dæmi 15
d15a <- pnorm(-0.82)
d15b <- pnorm(1.96)
d15c <- pnorm(1.65)
d15d <- pnorm(0.0)

# dæmi 18
d18a <- pnorm(20, 21, 2.8)
d18b <- 1 - pnorm(30, 21, 2.8)
d18c <- pnorm(19, 21, 2.8) - pnorm(17, 21, 2.8)
d18d <- pnorm(27, 21, 2.8) - pnorm(25, 21, 2.8)
d18e <- pnorm(21, 21, 2.8) - pnorm(21, 21, 2.8)

# dæmi 20
d20a <- pnorm(8.2, 8.2, 2.2) - pnorm(8.2, 8.2, 2.2)
d20b <- 1 - pnorm(10, 8.2, 2.2)
d20c <- pnorm(12, 8.2, 2.2) - pnorm(10, 8.2, 2.2)
d20d <- pnorm(3.7, 8.2, 2.2)
d20e <- qnorm(0.9, 8.2, 2.2)
d20e <- qnorm(0.2, 8.2, 2.2)
