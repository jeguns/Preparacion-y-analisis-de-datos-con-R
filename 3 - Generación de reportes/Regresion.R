library(magrittr)
datos = read.csv('Ambiental.csv')
datos |> head()
plot(datos$Humedad,datos$Temperatura, pch = 16)
modelo = lm(Temperatura ~ ., datos)
modelo |> coef()
X = cbind(1, 
          datos$Humedad, 
          datos$Vel_viento,
          datos$Radiacion_solar, 
          datos$Contaminacion)
modelo_ = lm(Temperatura ~ X, datos)
modelo_ |> aov() |> summary()
modelo |> summary()
modelo |> summary() |> extract2("adj.r.squared")
condiciones = data.frame(Humedad = 60,
                         Vel_viento = 5,
                         Radiacion_solar = 800,
                         Contaminacion = 100)
modelo |> predict(condiciones)
modelo |> predict(condiciones, interval = "prediction")
x = c(1,60,5,800,100)
H = X%*%solve(t(X)%*%X)%*%t(X)
h = H |> diag() |> max()
t(x)%*%solve(t(X)%*%X)%*%x
t(x)%*%solve(t(X)%*%X)%*%x > h
