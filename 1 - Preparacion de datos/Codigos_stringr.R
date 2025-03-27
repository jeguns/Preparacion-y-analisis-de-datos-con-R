library(stringr)

y = c(1,5,2,4,55,666)
y |> str_length()

x = c("Economía", " Administración y finanzas ", "Economía ",
      "Negocios", "Estadística","Física")
x |> str_trim(side = "both")

x = c("Economía", " Administración y finanzas ", "Economía     ",
      "Negocios", "Estadística","Física")
x |> str_trim(side = "left")
x |> str_trim(side = "right")

x = c("Economía", " Administración y finanzas ", "Economía ",
      "Negocios", "Estadística","Física")
x |> str_to_lower() |> str_squish()

library(readxl)
datos_dir = read_excel('direcciones.xlsx')
datos_dir
library(dplyr)
library(stringr)
datos_dir |> filter(str_detect(DIRECCION,"Av") |
                      str_detect(DIRECCION,"av"))

datos_dir |> 
  mutate(DIRECCION2 = tolower(DIRECCION)) |> 
  filter(str_detect(DIRECCION2,"av")) |> 
  select(-DIRECCION2)

datos_dir |> filter(str_detect(DIRECCION,"[A|a]v"))

datos_dir |> filter((x2<35) & (str_detect(DIRECCION,"Calle") |
                                 str_detect(DIRECCION,"calle")))

str(datos_dir)


