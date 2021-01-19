library(DT)
library(shiny)
library(shinydashboard)
library(shinyjs)
library(readxl)
library(xlsx)
library(dplyr)
library(plotly)
library(ggplot2)
library(purrr)
library(tidyr)
library(data.table)

intervalos <- as.data.frame(read_xlsx("tables/intervalos_mes1_2021.xlsx"))
intervalos$Inferior <- as.numeric(intervalos$Inferior)
intervalos$Superior <- as.numeric(intervalos$Superior)
colnames(intervalos)[7] <- "num_datos"
precios <- as.data.frame(read_xlsx("tables/precios_semana2_2021.xlsx"))
colnames(precios)[4] <- "precios"
intervalos <- intervalos %>% 
                  left_join(precios,by=c("Mercado"="Mercado","Producto"="Producto","Presentacion"="Presentacion")) %>% 
                  filter(!is.na(precios)) %>% 
                                        mutate(observacion=ifelse(num_datos>0 & precios>0,
                                        ifelse(precios<Inferior,"Bajo el rango",
                                        ifelse(precios>=Inferior & precios<=Superior,"Dentro del rango",
                                        ifelse(precios>Superior,"Sobre el rango",0))),
                                        ifelse(precios>0 & num_datos==0,"No clasificado","")))



# a <- as.data.frame(table(intervalos$observacion))
# b <-  intervalos %>% group_by(Mercado,observacion) %>% summarise(n())

