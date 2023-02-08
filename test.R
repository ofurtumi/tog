library(tidyverse)

link <- "https://notendur.hi.is/ahj/handahofskenndar_spurningar_um_lifid.csv"

dat <- read.table(link, header = TRUE, sep = ",")
skaupid <- dat$aramotaskaupid


mean(c(375, 485, 299, 17328))

# líkur útfrá meðaltali:
# Tryggingasölumaður selur að meðaltali 3 líftryggingar á viku.
# Hverjar eru líkurnar á að hann selji enga líftryggingu í vikunni?

var(300, 1 / 3)
var(2)

# líkur á að af 13 næstu trjám lifi amk. 10 af þar sem 0.9 tré lifa af
1 - sum(dbinom(11:13, 13, 0.9))

# líkur á að minnsta kosti 1 gos á næstu öld
# líkur á minnsta kosti 1 kúnna næstu mín
1 - dpois(0, 2)
