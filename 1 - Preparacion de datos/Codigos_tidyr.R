library(tidyr)
library(dplyr)
# pivot_longer
x1 = c(15,14,18,17)
x2 = c(20,19,15,17)
x3 = c(12,13,11,16)
datos = data.frame(trat1 = x1, trat2 = x2, trat3 = x3)
datos
datos |> pivot_longer(cols = c("trat1","trat2","trat3"),
                      names_to = "Tratamiento",
                      values_to = "Rendimiento") -> datos2

# pivot_wider
datos2$dia = c(rep(1,3),rep(2,3),rep(3,3),rep(4,3))
datos2

datos2 |> select(-rep) -> datos2
datos2
datos2 |> pivot_wider(names_from = "Tratamiento",
                      values_from = "Rendimiento")

x1 = c("Ingreso","Egreso","Ingreso","Egreso","Ingreso","Egreso","Ingreso")
x2 = c("Lunes","Lunes","Martes","Martes","Miércoles","Miércoles","Jueves")
x3 = c(20,16,25,12,30,18, 29)
datos = data.frame(tipo = x1, dia = x2, cantidad = x3)
datos
datos |> pivot_wider(names_from = dia,
                     values_from = cantidad)

# separate
df <- data.frame(NombreCompleto = c("Ana Juárez Ramírez",
                                    "Raúl Gómez Vargas",
                                    "Beatriz Castillo Castillo"))
df
df |>
  separate(NombreCompleto, into = c("Nombre", "ApellidoP", "ApellidoM"), 
           sep = " ") |> 
  mutate(NOMBRE = paste(Nombre, ApellidoP, ApellidoM))

# unite
x1 = c("EP","ZT","CC")
x2 = c("03","02","01")
x3 = c("01","02","01")
x4 = c(3,4,2,3,3,4)
df = data.frame(codfac = x1, nivel = x2, numero = x3, creditos = 4)
df
df |> unite(col = cod_curso,
            codfac, nivel, numero,
            sep = "")


x1 = c("María","Ana","Fernando","Eduardo")
x2 = c(2,1,NA,4)
x3 = c("Ate","Lince","Bellavista",NA)
df = data.frame(Persona = x1, Mascotas = x2, Distrito = x3)
df
df |> drop_na()
df

