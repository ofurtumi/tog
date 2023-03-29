# almennar glósur - tölfræði og gagnavinnsla

## líkur útfrá meðaltali - massafall Poisson dreifingar

> Tryggingasölumaður selur að meðaltali 3 líftryggingar á viku.
> Hverjar eru líkurnar á að hann selji enga líftryggingu í vikunni

hér notum við massafall Poisson dreifingar, vegna þess að við erum að skoða strjála atburði, fjölda jákvæðra útkoma, þe. fjöldi skipta per ehv
$$P(X=k)=\frac{e^{-\lambda}\cdot\lambda^k}{k!}$$
með gildunum `k=0`,`λ=3` og fáum út úr því
$$P(X=0)=\frac{e^{-3}\cdot3^0}{0!}=\frac{e^{-3}}{1}=e^{-3}\approx0.05$$

### viðeigandi R-skipun

```R
# dpois(λ, k)
# fyrir þetta dæmi:
val <- dpois(3, 0)
```

> ATH. ef verið að reikna td.
> $P(X\geq 2)$ þá skiptist það niður í  
> $P(X\le 2)=1-(P(X=0)+P(X=1))=1-P(X=0)-P(X=1)$

## líkur útfrá óháðum tilraunum - massafall tvíkostadreifingar

> Við framkvæmum eftirfarandi tilraun fimm sinnum:
> Drögum spil úr spilastokki, kíkjum á útkomuna, setjum spilið aftur í stokkinn og stokkum.
> Hverjar eru líkurnar á að rautt spil komi upp tvisvar sinnum?

Látum $X$ tákna fjölda rauðra spila, þe. helming spila, þá er
$X\approx B(5, 0.5)$

> ath B(5, 0.5) táknar mengi tvíkostadrefinguna af 5 og 0.5 þe
> $\binom{5}{0.5}$ held ég??  
> meira kannski eins og fjöldi mögulegra jákvæðra útkoma yfir fimm tilraunir með helmings líkur

nýtum massafall tvíkostadreifingar
$$P(X=k)=\binom{n}{k}\cdot p^k\cdot(1-p)^{n-k}$$

og reiknum svo
$P(X=2)$ og fáum
$$P(X=2)=\binom{5}{2}\cdot 0.5^2\cdot 0.5^3=0.3125$$

### viðeigandi R-skipun

```R
# dbinom(n,k,p)
# fyrir þetta dæmi:
val <- dbinom(5,2,0.5
```

<!-- todo: útfæra þessar reglur, úr miðvikudagstímanum -->

X~B(n,p)
P(X=k): dbinom(k,n,p)
P(X<=k): pbinom(k,n,p)
P(X>k): 1 - pbinom(k,n,p)

X~Pois(λ)
P(X=k): dpois(k,λ)
P(X<=k): ppois(k,λ)
P(X>k): 1 - ppois(k,λ)

## líkur á stöðu - normaldreifing

Gerum ráð fyrir að meðalhæð kvenna á Íslandi sé normaldreifð með meðaltal 170 cm og staðalfrávik 3 cm. Ef valin er af handahófi íslensk kona, hverjar eru líkurnar á að hún sé lægri en 165 cm á hæð?  
hér er meðaltal
$\mu = 170cm$ og staðalfrávik
$\sigma = 3cm$ og finnum staðlað
$z$ með formúlunni
$$z=\frac{x-\mu}{\sigma} = \frac{165-170}{3} = -1.67$$
við notum síðan töflu normaldreifingarinnar og finnum hvar
$z=-1.67$ og þá fæst að
$\Phi (z)=0.0476 \approx 4.8%$

#### viðeigandi R-skipun

```R
# pnorm(x, mu, sigma)
# fyrir þetta dæmi
val <- pnorm(165, 170, 3)
```

## líkur á bili - normaldreifing

Við ætlum að finna líkur á því að þyngd sex ára barna, sem fylgir normaldreifingu með meðaltal 21 og staðalfrávik 2.8, sé á bilinu 18kg til 22kg  
byrjum á að staðla bæði gildi og fáum að
$$18kg = \frac{18-21}{2.8} \approx -1.07$$
og
$$22kg = \frac{22-21}{2.8} \approx 0.36$$

við flettum þessum gildum svo upp í Z-töflu og finnum að
$0.36 -> 0.6406$ og
$-1.07 -> 0.1423$ við drögum svo neðra bilið frá efra bilinu og fáum lokaniðurstöðuna okkar
$0.6405 - 0.1423 = 0.4982$
![normaldreifing fyrir dæmi](imgs/normal.excalidraw.png)

### viðeigandi R-skipun

```R
# pnorm(x2, mu, sigma) - pnorm(x1, mu, sigma)
# fyrir þetta dæmi
val <- pnorm(22, 21, 2.8) - pnorm(18, 21, 2.8)
```

## lágmarksgildi útfrá líkum - normaldreifing

við viljum finna út hvaða lengd ánamaðka, sem er normaldreifð með meðallengd _11cm_ og staðalfrávik _1.2cm_, sé nóg til að vera á meðal 40% lengstu ánamaðka  
byrjum á að finna
$\Phi(1-0.6)$ sem samsvarar topp 40% maðka, flettum því upp í z-töflu og finnum út að z-gildið er
$0.25$ en þar sem dreifingin upphaflega stöðluð þarf að varpa aftur í upphaflega dreifingu, við gerum það með
$$x=\mu + z\sigma = 11 + 0.25\cdot 1.2 = 11.3$$

### viðeigandi R-skipun

```R
# qnorm(prob, mu, sigma)
# fyrir þetta dæmi
val <- qnorm(0.6,11,1.2)
```

9: -5/3 = 0.0485
11.5: 5/12 = 0.6591

## dreifni lýsistærða

Ef slembistærðirnar $X$ og $Y$ eru óháðar þar sem dreifni $X$ er $3$ og dreini $Y$ er $1$, hver er þá dreifni lýsistærðarinnar $X +Y$?  
fyrir óháðar slembistærðir gildir að
$Var(X+Y) = Var(X) + Var(Y)$

## alpha líkur

Sigrún framkvæmdi tilgátupróf fyrir meðaltal þýðis og fékk út p-gildið
$0.10$. Sigrún ætlar að nota
$\alpha = 0.05$. Hvað er það sem alpha þýðir hérna?  
$\alpha$ eru **líkurnar á að hafna núlltilgátu sem er í raun sönn**. Í þessu dæmi vitum við ekki hvort núlltilgátan sé sönn þannig getum ekki sagt mikið með þessar upplýsingar.

## prófstærð útfrá óháðum þýðum

við erum með tvö óháð þýði með óþekkta dreifni.
Bæði úrtök hafa stærð af $150$, fyrra úrtakið hefur meðaltal $21$ og staðalfrávik $1.1$
en seinna úrtakið hefur meðaltal $20.5$ og staðalfrávik $1.5$.
Hvert er **gildið á prófstærðinni** ef kanna á tilgátuna að meðaltölin séu misjöfn.

til að finna prófastærðina má nota t- eða z-próf og höfum við breyturnar
| breyta | gildi |
| ------ | ------ |
| $x_1$ | $21$ |
| $x_2$ | $20.5$ |
| $\mu$ | $0$ |
| $s_1$ | $1.1$ |
| $s_2$ | $1.5$ |
| $n_1$ | $150$ |
| $n_2$ | $150$ |

þá getum við bombað í þessa big ass formúlu:
$$z = \frac{x_1-x_2-\mu}{\sqrt{\frac{s^2_1}{n_1}+\frac{s^2_2}{n_2}}} = \frac{21 - 20.5 - 0}{\sqrt{\frac{1.1^2}{150} + \frac{1.5^2}{150}}} = 3.29$$

## prófastærð útfrá tveimur óháðum þýðum

Tökum sitthvort úrtakið úr tveimur óháðum þýðum þar sem dreifni þýðanna er óþekkt. Úrtökin hafa bæði stærð 150, fyrra úrtak hefur meðaltal 21 og staðalfrávik 1.1, seinna hefur meðaltal 20.5 og staðalfrávik 1.5  
hvert er gildið á prófstærðinni ef kanna á tilgátuna að meðaltölin séu misjöfn

- bæði úrtökin hafa stærð $n_1 = 150,  n_2 = 150$
- fyrra úrtakið hefur
  - meðaltal: $\overline{x}_1 = 21$
  - staðalfrávik: $s_1 = 1.1$
- seinna úrtakið hefur
  - meðaltal: $\overline{x}_2 = 20.5$
  - staðalfrávik: $s_2 = 1.5$

**ath! staðalfrávik eru gefin, en í formúlunni til að finna svar á að nota dreifni sem er staðalfrávik^2**

$$z = \frac{\overline{x}_1-\overline{x}_2-\delta}{\sqrt{\frac{s_1^2}{n_1}+\frac{s_2^2}{n_2}}} = \frac{21-20.5-0}{\sqrt{\frac{1.1^2}{150}+\frac{1.5^2}{150}}} = 3.29$$

## prófstærð útfrá n pöruðum mælingum

við höfum eftirfarandi gögn um einstaklinga fyrir og eftir þau voru látin labba upp 100 tröppur:

| einstaklingur | bpm fyrir | bpm eftir | mismunur |
| ------------- | --------- | --------- | -------- |
| 1             | 60        | 70        | 10       |
| 2             | 55        | 61        | 6        |
| 3             | 62        | 88        | 26       |
| 4             | 63        | 72        | 9        |
| 5             | 59        | 80        | 21       |

það er skítlöng formúla til að reikna þetta drasl, notum frekar **R**

ef við getum gert ráð fyrir því að gögn fylgi normaldreifingu þá bætum við aftast í fallið `paired=T` _(held ég)_

```r
# fyrir gögn sem er ekki víst að fylgi normaldreifingu
t.test(c(60,55,62,63,59), c(70,61,88,72,80))

# fyrir gögn sem fylgja normaldreifingu
t.test(c(60,55,62,63,59), c(70,61,88,72,80), paired = T)
```

við erum að leita að úrtakinu sem heitir `t` og af ehv ástæðum er það mínustala??

## efra og neðra öryggisbil

til að finna efra og neðra öryggisbil notum við eftirfarandi formúlur

$+$ tilheyrir efra öryggisbili og
$-$ tilheyrir neðra öryggisbili

notum þessa ef gögn uppfylla skilyrði fyrir normalnálgun
$$\hat{p}\pm z_{1-\alpha/2}\cdot \sqrt{\frac{\hat{p}(1-\hat{p})}{n}}$$

þar sem $\hat{p} = \frac{x}{n}$

# línulegt aðhvarf

Atli vill kanna hvort það śe í raun fylgni milli vettlingasölu og hitastigs. Hann framkvæmir tvíhliða tilgátupróf og prófstærðin í tilgátuprófinu hans er -2.07. Hvaða ályktun dregur hann.
hér er 0-tilgáta að p = 0 og gagntilgáta p != 0

$t_{1-\frac{a}{2}(n-2)} = t_{0.975,(5)}=qt(-2.07,0.975,5)$

# aðhvarfsgreining - stiklað á stóru

## nöfn á breytum

í línulegri aðhvarfsgreiningu kallast breytan sem fylgir Y-ásnum **svarbreyta** og sú sem stjórnar svarbreytunni og fylgir X-ásnum kallast **skýribreyta**

## fylgni út frá gögnum

til að fá fylgni út frá R-gögnum, skal taka rótina af `Multiple R-squared` og athuga hvort gögnin séu hækkandi eða lækkandi og setja mínus sem samsvarar því

## response töflur - ferviksgreining

ef tafla er gefin með eftirfarandi breytum:

- Df
- Sum Sq
- Mean Sq

og ehv nokkrum fleirum má finna **Df** með því að deila **Sum Sq** með **Mean Sq** í sömu línu þ.e.
$$Df=\frac{\sigma^2}{\mu^2}$$
og þetta má umrita til að finna annaðhvort $\mu^2$ eða $\sigma^2$

fjöldi flokka er $Df + 1$ og fjöldi mælinga er $DF_{\text{residuals}} - DF$
