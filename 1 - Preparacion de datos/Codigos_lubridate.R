Sys.Date()
Sys.time()

a = Sys.time()
x = c(3,4,5)
median(x)
b = Sys.time()
b - a

library(lubridate)
fecha1_str = "2025-03-26"
fecha1_str |> str()
fecha1_date = fecha1_str |> ymd() #2025(año)-03(mes)-
fecha1_date |> str()
fecha1_str
fecha1_date

fecha2_str = "25032025"
fecha2_str |> str()
fecha2_date = fecha2_str |> dmy()
fecha2_date |> str()
fecha2_str
fecha2_date

fecha2_str = "07/Apr/2025"
fecha2_str |> str()
fecha2_date = fecha2_str |> dmy()
fecha2_date |> str()

fecha1_str |> str()
fecha2_str |> str()
fecha2_str - fecha1_str

fecha1_date |> str()
fecha2_date |> str()
fecha2_date - fecha1_date

fecha3_str = "2025-03-18 14:30:45"
fecha3_str |> str()
fecha3_date = fecha3_str |> ymd_hms()
fecha3_date |> str()

x1 = c("Mauricio","Katy","Pablo","Ana")
x2 = c(19980512,20051230,20070707,20010919)
df = data.frame(Nombre = x1, FechaNac = x2)
df
df |> str()
df |> mutate(FechaNac = ymd(FechaNac)) -> df
df |> str()

fecha = ymd("2025-03-25")
fecha
fecha |> wday(label = TRUE, abbr = FALSE)
fecha |> wday(label = TRUE, abbr = TRUE)
fecha |> wday(label = FALSE)
fecha |> wday(label = FALSE, week_start = 1)
fecha |> semester()
fecha |> quarter() # trimestre
fecha |> week()

fecha = ymd("2025-03-01")
fecha |> year() <- 2010
fecha
fecha |> month() <- 7
fecha

fecha = ymd("2025-04-10")
fecha |> quarter() # trimestre
fecha |> hour()
fecha |> minute()

x1 = c("Mauricio","Katy","Pablo","Ana")
x2 = c(19980512,20051230,20070707,20010919)
df = data.frame(Nombre = x1, FechaNac = x2)
df
df |> mutate(FechaNac = ymd(FechaNac),
             año      = year(FechaNac),
             semestre = semester(FechaNac),
             dia_sem  = wday(FechaNac,label = TRUE, abbr = FALSE))

fecha
fecha |> as.numeric()
fecha2 = ymd("2001-07-15")
fecha2 |> as.numeric()
fecha3 = ymd("2001-07-14")
fecha3 |> as.numeric()
fecha4 = ymd("2001-07-13")
fecha4 |> as.numeric()
fecha5 = ymd("1970-01-01")
fecha5 |> as.numeric()
fecha6 = ymd("1970-01-02")
fecha6 |> as.numeric()
fecha7 = ymd("1969-12-25")
fecha7 |> as.numeric()
