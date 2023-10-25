# Lectura de archivos
data <- read.csv("D:/Users/jhoca/Documents/R Clases/emisiones_2023.csv")

# Análisis de datos mediante Medidas de Tendencia Central
mean_emisiones <- mean(data$Emisiones_CO2)
median_emisiones <- median(data$Emisiones_CO2)
mode_emisiones <- as.numeric(names(table(data$Emisiones_CO2))[which.max(table(data$Emisiones_CO2))])

# Exportación de archivos
write.csv(data, "D:/Users/jhoca/Documents/R Clases/datos_procesados.csv", row.names = FALSE)

# Generación de gráficos
# Gráfico de barras de las emisiones de CO2 por país
barplot(data$Emisiones_CO2, names.arg = data$País, xlab = "País", ylab = "Emisiones de CO2", main = "Emisiones de CO2 por país")

# Gráfico de dispersión de emisiones de CO2 por población
plot(data$Población, data$Emisiones_CO2, xlab = "Población", ylab = "Emisiones de CO2", main = "Emisiones de CO2 vs Población", col = "blue")

# Gráfico de pastel de las emisiones de CO2 por país
pie(data$Emisiones_CO2, labels = data$País, main = "Porcentaje de emisiones de CO2 por país")