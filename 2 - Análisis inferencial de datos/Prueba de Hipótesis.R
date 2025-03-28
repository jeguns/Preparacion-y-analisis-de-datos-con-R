datos = read.csv('Produccion.csv')
library(dplyr)
datos


# Prueba de hipótesis para una media --------------------------------------

datos |>
  filter(Grupo == "Equipo 1") |>
  pull(Tiempo) |>
  t.test(alternative = "greater", mu = 45)


# Prueba de hipótesis para una varianza -----------------------------------

library(EnvStats)
datos |>
  filter(Grupo == "Equipo 2") |>
  pull(Costo) |>
  varTest(alternative = "less", sigma.squared = 9)


# Prueba de hipótesis para una proporción ---------------------------------

datos |> nrow() -> n
datos |> filter(Defectuoso == 1) |> nrow() -> x
x
(3/65 - 0.03)/sqrt(0.03*0.97/65)

datos |> nrow() -> n
datos |> filter(Defectuoso == 1) |> nrow() -> x
prop.test(x, n, p = 0.03, alternative = "less", correct = FALSE)



# Prueba de hipótesis para dos proporciones -------------------------------


datos |> count(Grupo) |>
  pull(n) -> n

datos |> group_by(Grupo) |> count(Defectuoso) |>
  filter(Defectuoso == 1) |> pull(n) -> x

prop.test(x, n, alternative = "two.sided")




# Prueba de hipótesis para dos medias -------------------------------------

t.test(Tiempo ~ Grupo, datos, alternative = "two.sided",
       mu = 0, var.equal = TRUE)
