library(tidyverse)

# liður 1
link <- "https://notendur.hi.is/ahj/handahofskenndar_spurningar_um_lifid.csv"
ttb <- read_table(link, header = TRUE, Sep = ";", na.strings = "", dec = ",")

# liður 2
ggplot(data = ttb, aes(ttb$is)) +
    geom_bar()

# liður 3
ggplot(data = ttb, aes(ttb$ferdatimi)) +
    geom_bar() +
    xlab("Ferðatími") +
    ylab("Fjöldi nemenda")

# liður 4
ggplot(data = ttb, aes(x = ttb$fri, y = ttb$smjor)) +
    geom_boxplot() +
    xlab("Týpa af fríi") +
    ylab("Hugmynd um smjör verð")


# liður 5
ggplot(data = ttb, aes(x = ttb$nemendur, y = ttb$spotify)) +
    geom_point() +
    xlab("Hugmynd að fjölda nemenda") +
    ylab("Árleg spotify notkun")

# liður 6
table(ttb$ferdamati, ttb$namskeid)

# liður 7
round(prop.table(table(ttb$ferdamati, ttb$ferdamati)), 3)

sd(c(162, 173, 158, 155, 185)) / 166.6