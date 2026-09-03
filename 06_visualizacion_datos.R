library(tidyverse)

# Tema gráfico limpio
theme_set(theme_minimal(base_size = 13))

# 1. Histograma: Distribución de build_time_min
p1 <- ggplot(df_clean, aes(x = build_time_min)) +
  geom_histogram(bins = 14, fill = "#0284c7", color = "#ffffff", alpha = 0.8) +
  labs(
    title = "Distribución del Tiempo de Build",
    subtitle = "Frecuencia de duración en minutos (14 clases Sturges)",
    x = "Tiempo de Build (minutos)",
    y = "Frecuencia Absoluta"
  )
print(p1)

# 2. Boxplot: Tiempo de resolución de tickets por equipo
p2 <- ggplot(df_clean, aes(x = team, y = ticket_resolution_h, fill = team)) +
  geom_boxplot(alpha = 0.7, show.legend = FALSE) +
  scale_fill_brewer(palette = "Set2") +
  labs(
    title = "Tiempo de Resolución de Tickets por Equipo",
    subtitle = "Comparación de medianas, dispersión y valores atípicos",
    x = "Equipo",
    y = "Horas de Resolución"
  )
print(p2)

# 3. Gráfico de Barras: Estado de despliegue según prioridad
p3 <- ggplot(df_clean, aes(x = priority, fill = deploy_status)) +
  geom_bar(position = "dodge") +
  scale_fill_brewer(palette = "Set1") +
  labs(
    title = "Estado de Despliegue según Prioridad",
    subtitle = "Distribución de éxitos, fallos y rollbacks",
    x = "Prioridad del Ticket",
    y = "Cantidad de Eventos",
    fill = "Estado"
  )
print(p3)

# 4. Gráfico de Dispersión: Commit Size vs Num Bugs
p4 <- ggplot(df_clean, aes(x = commit_size_loc, y = num_bugs)) +
  geom_jitter(alpha = 0.3, color = "#2563eb") +
  geom_smooth(method = "lm", color = "#dc2626", se = TRUE) +
  labs(
    title = "Relación entre Tamaño de Commit y Bugs Detectados",
    subtitle = "Líneas de código modificadas vs. N° de Bugs post-despliegue",
    x = "Tamaño del Commit (LOC)",
    y = "Número de Bugs"
  )
print(p4)