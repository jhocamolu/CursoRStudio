# Instala los paquetes necesarios si no están instalados
install.packages(c("tm", "syuzhet", "ggplot2"))

# Cargando las bibliotecas
library(tm)
library(syuzhet)
library(ggplot2)

# Definir el texto que va a ser analizado
texto <- "Aquí va tu texto para el análisis de sentimientos. Puede ser un párrafo, un artículo, una revisión, etc."

# Proceso de limpieza del texto
texto_limpio <- tolower(texto) # Convertir a minúsculas
texto_limpio <- removePunctuation(texto_limpio) # Eliminar puntuación

# Aplicar técnica de análisis de sentimientos
sentimientos <- get_nrc_sentiment(texto_limpio)
sentimientos <- as.data.frame(sentimientos)

# Renombrar las columnas para la visualización del gráfico
names(sentimientos) <- c("Sentimiento", "Frecuencia")

# Generar gráfica pertinente
ggplot(sentimientos, aes(x=Sentimiento, y=Frecuencia, fill=Sentimiento)) + 
  geom_bar(stat="identity") + 
  labs(title="Análisis de Sentimientos", 
       subtitle="Sentimientos en el Texto Analizado", 
       y="Frecuencia", 
       x="Sentimientos") +
  theme_minimal()