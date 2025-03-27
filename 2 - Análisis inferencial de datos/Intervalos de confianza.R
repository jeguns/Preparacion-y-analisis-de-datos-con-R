
# Intervalos de confianza para la media -----------------------------------

talla = c(1.60, 1.58, 1.45, 1.52, 1.68, 1.62, 1.55)
talla2 = c(1.70, 1.61, 1.43, 1.51, 1.68, 1.64, 1.59)
talla |> mean()
talla2 |> mean()

# MEDIA +/- MARGEN DE ERROR ----> [ LI, LS ]

alfa = 0.05
qnorm(1-alfa/2)
qt(1-alfa/2,9)
qt(1-alfa/2,19)
qt(1-alfa/2,49)
qt(1-alfa/2,299)
qt(1-alfa/2,9999)

agua = c(2.75, 2.43, 1.59, 2.82, 3.26, 2.38, 1.79, 2.08, 3.29, 2.88,
         2.27, 2.72, 2.62, 1.54, 1.64, 2.22)
agua |> t.test(conf.level = 0.95) # 2.093929 2.691071
agua |> t.test(conf.level = 0.90) # 2.146935 2.638065
agua |> t.test(conf.level = 0.99) # 1.979728 2.805272

agua = c(2.75, 2.43, 1.59, 2.82, 3.26, 2.38, 1.79, 2.08, 3.29, 2.88,
         2.27, 2.72, 2.62, 1.54, 1.64, 2.22)
agua |> t.test(conf.level = 0.95) # 2.093929 2.691071
agua = c(2.75, 2.43, 1.59, 2.82, 3.26, 2.38, 1.79, 2.08, 3.29, 2.88,
         2.27, 2.72, 2.62, 1.54, 1.64, 2.22, 1.01, 3.54, 4.00)
agua |> t.test(conf.level = 0.95) # 2.097980 2.831494

# normal con varianza conocida

agua = c(2.75, 2.43, 1.59, 2.82, 3.26, 2.38, 1.79, 2.08, 3.29, 2.88,
         2.27, 2.72, 2.62, 1.54, 1.64, 2.22)
media = agua |> mean()
sigma = 0.5
n = agua |> length()
conf = 0.95
z = qnorm((1+conf)/2)
LI = media - z*sigma/sqrt(n)
LS = media + z*sigma/sqrt(n)
c(LI,LS)
library(BSDA)
zsum.test(mean.x = media,
          sigma.x = sigma,
          n.x = n,
          conf.level = conf)



# Intervalo de confianza para la varianza ---------------------------------

rchisq(1000,df = 3) |> hist()
rchisq(1000,df = 10) |> hist()
rchisq(1000,df = 40) |> hist()
rchisq(1000,df = 100) |> hist()
rchisq(1000,df = 250) |> hist()

agua = c(2.75, 2.43, 1.59, 2.82, 3.26, 2.38, 1.79, 2.08, 3.29, 2.88,
         2.27, 2.72, 2.62, 1.54, 1.64, 2.22)
varian = agua |> var()
n = agua |> length()
conf = 0.95
chi1 = qchisq((1-conf)/2, n-1)
chi2 = qchisq((1+conf)/2, n-1)
LI = (n-1)*varian/chi2
LS = (n-1)*varian/chi1
c(LI,LS)

library(EnvStats)
varTest(agua, conf.level = 0.95)$conf.int|> as.numeric()
varTest(agua, conf.level = 0.95)$conf.int |> sqrt() |> as.numeric()


# Intervalo de confianza para la proporción -------------------------------

p = 103/150
n = 150
conf = 0.95
z = qnorm((1 + conf)/2)
LI = p - z*sqrt(p*(1-p)/n)
LS = p + z*sqrt(p*(1-p)/n)
c(LI,LS)

binom.test(x = 3, n = 150, conf.level = 0.95)$conf.int |>
  as.numeric()

prop.test(x = 149, n = 150, conf.level = 0.95, correct = FALSE)$conf.int |>
  as.numeric()
