library(tidyverse)

# 1. Comparación de rendimiento por EQUIPO
resumen_equipo <- df_clean %>%
  group_by(team) %>%
  summarise(
    eventos       = n(),
    mediana_build = round(median(build_time_min), 2),
    promedio_bugs = round(mean(num_bugs), 2),
    pct_fallos    = round(mean(deploy_status == "failed") * 100, 2)
  )

cat("--- RESUMEN POR EQUIPO ---\n")
print(resumen_equipo)

# 2. Comparación de rendimiento por MÓDULO
resumen_modulo <- df_clean %>%
  group_by(module) %>%
  summarise(
    mediana_build = round(median(build_time_min), 2),
    promedio_bugs = round(mean(num_bugs), 2),
    pct_fallos    = round(mean(deploy_status == "failed") * 100, 2)
  )

cat("\n--- RESUMEN POR MÓDULO ---\n")
print(resumen_modulo)

# 3. Tabla de Contingencia: Equipo vs Estado de Despliegue
tabla_equipo_status <- table(df_clean$team, df_clean$deploy_status)

cat("\n--- TABLA CRUZADA (EQUIPO vs STATUS) ---\n")
print(tabla_equipo_status)