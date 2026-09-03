library(tidyverse)

# 1. Matriz de Correlación de Pearson para variables cuantitativas
num_vars <- df_clean %>%
  select(where(is.numeric))

matriz_correlacion <- cor(num_vars, use = "complete.obs") %>%
  round(3)

cat("--- MATRIZ DE CORRELACIÓN DE PEARSON ---\n")
print(matriz_correlacion)

# 2. Correlaciones específicas clave
cor_commit_bugs <- cor(df_clean$commit_size_loc, df_clean$num_bugs)
cor_coverage_bugs <- cor(df_clean$test_coverage_pct, df_clean$num_bugs)

cat("\n--- CORRELACIONES CLAVE ---\n")
cat("Commit Size vs Num Bugs:", round(cor_commit_bugs, 3), "\n")
cat("Test Coverage vs Num Bugs:", round(cor_coverage_bugs, 3), "\n")

# 3. Tabla de Proporciones: Porcentaje de Estado por Prioridad
tabla_prop_prioridad_status <- prop.table(
  table(df_clean$priority, df_clean$deploy_status), 
  margin = 1
) * 100

cat("\n--- PORCENTAJE DE ESTADO DE DESPLIEGUE POR PRIORIDAD (%) ---\n")
print(round(tabla_prop_prioridad_status, 2))