df = read.csv2('INEI.csv')
# csv = comma separated values
df
library(dplyr)
df |> select('Departamento','Provincia','Cantidad')
df |> select(3, 4, 8)
df |> select(-'ubigeo_reniec',-'ubigeo_inei')
df |> select(-1, -2)
df |> select(-1, -2) |> head(10)
head(select(df,-1,-2),10)

df |> pull(Distrito)
df |> pull(5)

df[1,] # seleccionar la fila 1
df[c(3,5,10),] # seleccionar las filas 3, 5 y 10

df |> filter(Sexo == "M")
df |> filter(Cantidad < 100)
df |> pull(Sexo)

df |> filter((Sexo == "M") & (Cantidad < 100))
df |> filter((Sexo == "M") | (Cantidad < 100))

df |> colnames()

df |> mutate(Sexo = tolower(Sexo))
df |> mutate(Alta_Cantidad = ifelse(Cantidad>300,"Sí","No"))
Edades_am = c("60-64", "65-69", "70-74", "75-79", "80  +")
df |> mutate(Es_AdultoMayor = ifelse(Edad_Anio %in% Edades_am, 1, 0))

df |> mutate(Sexo = tolower(Sexo),
             Alta_Cantidad = ifelse(Cantidad>300,"Sí","No"),
             Es_AdultoMayor = ifelse(Edad_Anio %in% Edades_am, 1, 0)) -> df2

df2 |> select(-Alta_Cantidad) -> df2

df |> arrange(Cantidad)  
df |> arrange(-Cantidad)
df |> arrange(desc(Cantidad))
df |> arrange(Departamento)
df |> arrange(desc(Departamento))
df |> arrange(Departamento,Provincia)
df |> arrange(Departamento,desc(Provincia))

empleados <- data.frame(
  ID = c(1, 2, 3, 4),
  Nombre = c("Luisa", "Bruno", "Ana", "Renato"),
  Departamento = c("Ventas", "TI", "RRHH", "Marketing")
)
empleados
salarios <- data.frame(
  ID = c(2, 3, 5),
  Salario = c(5000, 6000, 4500)
)
salarios
empleados |> inner_join(salarios, by = "ID")
empleados |> left_join(salarios, by = "ID")
empleados |> right_join(salarios, by = "ID")
empleados |> full_join(salarios, by = "ID")


empleados <- data.frame(
  ID = c(1, 2, 3, 4),
  Nombre = c("Luisa", "Bruno", "Ana", "Renato"),
  Departamento = c("Ventas", "TI", "RRHH", "Marketing")
)
empleados
salarios <- data.frame(
  codigo = c(2, 3, 5),
  Salario = c(5000, 6000, 4500)
)
salarios
empleados |> full_join(salarios, by = c("ID"="codigo"))

library(tidyr)
