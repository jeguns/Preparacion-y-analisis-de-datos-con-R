datos <- read.csv('Salud.csv')
plot(datos$IMC,datos$Presion_sistolica, pch = 19)
modelo <- lm(Presion_sistolica ~ IMC, datos)
modelo |> coef()
modelo |> summary()
library(broom)
modelo |> tidy()
modelo |> confint()
modelo |> aov() |> summary()
modelo |> residuals()
(modelo |> residuals() |> sum())/100
modelo |> residuals() |> mean()
par(mfrow=c(2,2))
modelo |> residuals() |>
  hist(main = "Histograma de los residuales")
modelo |> residuals() |>
  density() |> plot(main = "Densidad de los residuales")
modelo |> plot(which = 2)
modelo |> residuals() |>
  boxplot(main = "Boxplot de los residuales")
modelo |> residuals() |> shapiro.test()
library(nortest)
modelo |> residuals() |> ad.test()
modelo |> residuals() |> lillie.test()

rnorm(5001) |> shapiro.test()
rnorm(5001) |> ad.test()

modelo |> plot(which=1)
modelo |> plot(which=3)
plot(datos$IMC, residuals(modelo))

modelo |> car::ncvTest()

modelo |> residuals() |>
  plot(main = "Residuales", type = "b", pch = 15)
abline(h=0)


modelo |> residuals() |>
  acf()

library(car)
modelo |> durbinWatsonTest()
modelo |> durbinWatsonTest(max.lag = 5)

summary(modelo)$r.squared
library(magrittr)
modelo |> summary() |> extract("r.squared")
cor(datos$Presion_sistolica,datos$IMC)**2

modelo |> predict(data.frame(IMC = 22))
modelo |> predict(data.frame(IMC = c(18,20,23)))
modelo |> predict(data.frame(IMC = c(18,20,23)),
                  level = 0.95, interval = "confidence")


modelo |> predict(data.frame(IMC = 22))
modelo |> predict(data.frame(IMC = c(18,20,23)))
modelo |> predict(data.frame(IMC = c(18,20,23)),
                  level = 0.95, interval = "prediction")


rpois(100,4) |> hist()

