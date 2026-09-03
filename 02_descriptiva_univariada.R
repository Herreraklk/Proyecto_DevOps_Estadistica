library(tidyverse)
library(moments) # Para calcular asimetría (skewness) y curtosis

# 1. Asegurar que tenemos el dataset limpio de la Fase 1
# (Si ya tienes 'df_clean' en tu Environment, puedes saltar la re-ejecución)

# 2. Resumen univariado para todas las variables cuantitativas
resumen_cuantitativas <- df_clean %>%
  summarise(
    across(
      c(build_time_min, deploy_time_min, test_coverage_pct, 
        ticket_resolution_h, commit_size_loc, num_bugs),
      list(
        media     = ~ mean(.x),
        mediana   = ~ median(.x),
        sd        = ~ sd(.x),
        iqr       = ~ IQR(.x),
        cv        = ~ sd(.x) / mean(.x),
        asimetria = ~ skewness(.x),
        curtosis  = ~ kurtosis(.x)
      ),
      .names = "{.col}_{.fn}"
    )
  ) %>%
  pivot_longer(
    cols = everything(),
    names_to = c("variable", "medida"),
    names_pattern = "(.*)_(.*)"
  ) %>%
  pivot_wider(
    names_from = medida,
    values_from = value
  )

# Mostrar la tabla de resultados
print(resumen_cuantitativas)