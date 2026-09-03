library(tidyverse)

# 1. Aplicar Regla de Sturges para determinar el número de clases (k)
N <- nrow(df_clean)
k <- ceiling(1 + 3.322 * log10(N))
cat("Número de clases según Sturges (k):", k, "\n")

# 2. Construir la Tabla de Frecuencias para 'build_time_min'
tabla_frecuencias_build <- df_clean %>%
  mutate(clase = cut(build_time_min, breaks = k, include.lowest = TRUE)) %>%
  count(clase, name = "fa") %>%                  # Frecuencia Absoluta (fa)
  mutate(
    fr = round(fa / sum(fa), 4),                 # Frecuencia Relativa (fr)
    fr_pct = round(fr * 100, 2),                 # Frecuencia Relativa %
    fac = cumsum(fa),                            # Frecuencia Absoluta Acumulada (fac)
    frac = round(cumsum(fr), 4)                  # Frecuencia Relativa Acumulada
  )

# 3. Mostrar la tabla resultante
print(tabla_frecuencias_build)

# 4. Identificar la Clase Modal (la categoría con mayor frecuencia)
clase_modal <- tabla_frecuencias_build %>% 
  filter(fa == max(fa))

cat("\n--- CLASE MODAL ---\n")
print(clase_modal)