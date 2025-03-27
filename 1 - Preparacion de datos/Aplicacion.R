
# Aplicación 1 ------------------------------------------------------------

library(readr)
library(readxl)
library(stringr)
library(dplyr)
library(lubridate)
ventas <- read_csv('ventas.csv')
clientes <- read_excel('clientes.xlsx')
ventas |> str()
clientes |> str()
ventas |> 
  mutate(Producto = str_to_title(str_squish(Producto)),
         Fecha    = ymd(Fecha), # en este caso es opcional
         año      = year(Fecha),
         mes      = month(Fecha),
         dia      = day(Fecha)) -> ventas

ventas |> left_join(clientes) -> ventas_final

write.csv(x = ventas_final,
          file = "ventas_procesadas.csv",
          row.names = FALSE)
