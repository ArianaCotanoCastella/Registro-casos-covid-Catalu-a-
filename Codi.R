#Filtrar por casos con data 2020 y casos positivos
library("dplyr")
Covid$TipusCasData<- as.character(Covid$TipusCasData)
filtro <-Covid %>% 
  select(TipusCasData, ComarcaCodi,ComarcaDescripcio,TipusCasDescripcio, NumCasos, Mes) %>% 
            filter(Mes!= "Enero" & Mes!= "Febrero" & TipusCasDescripcio %in% c("Positiu per Test Ràpid", 
                                                              "Positiu PCR", 
                                                              "Positiu per ELISA"))  

#Frecuencia absoluta y relativa
Frecuencia <-table(CovidMes$NumCasos)
prop.table(CovidMes$NumCasos)


#Crear gráfico de barras y ordenados por mes
Covid1<- CovidMes
Covid1$Mes <- factor(Covid1$Mes, 
                      levels= c( "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto",
                      "Septiembre", "Octubre", "Noviembre", "Diciembre"))

ggplot(Covid1, aes(Mes, NumCasos)) + 
  geom_bar(stat = "identity" , color="blue", fill=rgb(0.1,0.4,0.5,0.7))


#Varianza
var(CovidMes$NumCasos)


#Desviación típica
sd(CovidMes$NumCasos)


#Correlación 
cor(CovidMes$NumCasos, CovidMes$TempMedia)


#Crear gráfico dispersión
ggplot(CovidMes, aes(x=NumCasos, y=TempMedia)) + 
  geom_point(
    color="red",
    fill="#e5233b") 


