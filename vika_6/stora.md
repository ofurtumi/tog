---
title: "Fyrra R verkefni"
author: "Þorvaldur Tumi Baldursson (ttb3@hi.is)"
date: "2023-02-01"
output: 
    rmdformats::downcute:
        downcute_theme: "chaos"
---



# Hluti 1 - Gagnameðhöndlun

## byrjum á að lesa inn gögnin:

```r
hst <- read.table(
  "https://ahj.hi.is/husnaedisverd_2017_21.csv",
  sep = ";",
  header = TRUE,
  stringsAsFactors = TRUE,
)
```
## veljum síðan þrjú hverfi
- Fossvogur
- Breiðholt
- Austur Kópavog

```r
hverfi <- c(280, 25, 320)
hst <- dplyr::filter(hst, matssvaedi %in% hverfi)
```

## athugum gerð breyta

```r
print(str(hst))
```

```
## 'data.frame':	2130 obs. of  5 variables:
##  $ kaupverd  : int  18000 13500 67000 51500 52800 63800 18000 50000 32000 36000 ...
##  $ teg_eign  : Factor w/ 4 levels "Einbýlishús",..: 2 2 1 2 4 1 2 1 2 1 ...
##  $ byggar    : int  1973 1971 1970 1995 1969 1924 1989 1962 2007 1955 ...
##  $ birtm2    : num  89.5 49.9 197.1 216.4 220.7 ...
##  $ matssvaedi: int  320 320 280 320 280 25 25 320 320 320 ...
## NULL
```
týpur breytanna lýta út fyrir að vera réttar

## fermetraverd
búum til nýja breytu í töfluna þar sem við deilum kaupverðinu með stærð til að fá verð á fermetra

```r
hst <- hst %>% mutate(fermetraverd = kaupverd / birtm2)
```
´
## tegund eigna

```r
hst <- hst %>% mutate(teg_eign_s_i = case_when(
  teg_eign %in% c("Einbýlishús", "Parhús", "Raðhús") ~ "Sérbýli",
  teg_eign %in% c("Íbúðareign") ~ "Íbúð"
))
```

## hverfi
skiptum nú hverfakóðunum út fyrir nöfn þeirra á skiljanlegu máli, 
það sem kóðinn gerir er að skipta hverjum 

```r
hst <- hst %>% transmute(hst,
  matssvaedi = case_when(
    matssvaedi == 280 ~ "Fossvogur",
    matssvaedi == 25 ~ "Bakkar",
    matssvaedi == 320 ~ "Kópavogur Au."
  )
)
```
## slembiúrtak

```r
set.seed(8)
urtak <- sample_n(hst, 400)
```

# Hluti 2 - Töflur og tilgátur

## fjöldi eftir hverfum

```r
h_table <- round(
  prop.table(
    table(
      urtak$matssvaedi,
      urtak$teg_eign_s_i
    ),
    1
  ),
  3
)

knitr::kable(
  h_table
)
```



|              |  Íbúð| Sérbýli|
|:-------------|-----:|-------:|
|Bakkar        | 0.883|   0.117|
|Fossvogur     | 0.667|   0.333|
|Kópavogur Au. | 0.839|   0.161|

## hlutfall eigna eftir hverfum

```r
proportions(h_table)
```

```
##                
##                       Íbúð    Sérbýli
##   Bakkar        0.29433333 0.03900000
##   Fossvogur     0.22233333 0.11100000
##   Kópavogur Au. 0.27966667 0.05366667
```
