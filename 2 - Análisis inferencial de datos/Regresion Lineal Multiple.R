X = matrix(c(rep(1,10),1:10,rnorm(10)), ncol = 3)
X
solve(t(X)%*%X)

X = matrix(rnorm(40),ncol=10)
X
t(X)%*%X
solve(t(X)%*%X)

X = matrix(c(rep(1,10),rep(15,10),rnorm(10)), ncol = 3)
X
t(X)%*%X
solve(t(X)%*%X)

datos <- read.csv('Salud.csv')
modelo <- lm(Presion_sistolica ~ IMC, datos)

modelo2 = lm(Presion_sistolica ~ Edad + Minutos_ejercicio + IMC, datos)
modelo2 |> coef()
modelo2 |> confint()
modelo2 |> confint(level = 0.99)
modelo2 |> aov() |> summary()
X = cbind(1,datos$Edad, datos$Minutos_ejercicio, datos$IMC)
X
modelo2 |> summary()
library(magrittr)
modelo2 |> summary() |> extract("r.squared")
summary(modelo2)$r.squared

datos$X4 = rnorm(100)
modelo3 = lm(Presion_sistolica ~ Edad + Minutos_ejercicio + IMC + X4, datos)
modelo3 |> summary() |> extract("r.squared")

modelo2 |> summary() |> extract("adj.r.squared")
modelo3 |> summary() |> extract("adj.r.squared")

modelo |> AIC()
modelo2 |> AIC()
modelo3 |> AIC()

library(car)
modelo |> vif()
modelo2 |> vif()
modelo3 |> vif()


# ESTIMACIÓN PUNTUAL DE LA MEDIA
modelo2 |>
  predict(data.frame(Edad = 30,
                     Minutos_ejercicio = 60,
                     IMC = 23))

# ESTIMACIÓN INTERVALAR DE LA MEDIA
modelo2 |>
  predict(data.frame(Edad = 30,
                     Minutos_ejercicio = 60,
                     IMC = 23),
          interval = "confidence",
          level = 0.90)


# PREDICCIÓN PUNTUAL DE Y (PRESION SIST)
modelo2 |>
  predict(data.frame(Edad = 30,
                     Minutos_ejercicio = 60,
                     IMC = 23))

# PREDICCIÓN INTERVALAR DE Y
modelo2 |>
  predict(data.frame(Edad = 30,
                     Minutos_ejercicio = 60,
                     IMC = 23),
          interval = "prediction",
          level = 0.90)


DF = data.frame(Edad = c(30,25,27),
                Minutos_ejercicio = c(60,40,75),
                IMC = c(23,18,21))
DF

modelo2 |>
  predict(DF,
          interval = "prediction",
          level = 0.90)

H = X%*%solve(t(X)%*%X)%*%t(X)
H
h = H %>% diag %>% max
h
x = c(1,30,60,23)
x
t(x)%*%solve(t(X)%*%X)%*%x

x = c(1,70,5,30)
x
t(x)%*%solve(t(X)%*%X)%*%x
