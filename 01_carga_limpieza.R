library(tidyverse)

# 1. Cargar datos
df <- read_csv("devops_metrics.csv")

# 2. Inspección inicial
glimpse(df)
summary(df)
colSums(is.na(df))

# 3. Limpieza y tipado de variables
df_clean <- df %>%
  drop_na() %>% 
  mutate(
    priority = factor(priority, levels = c("baja", "media", "alta", "crítica"), ordered = TRUE),
    team = as.factor(team),
    module = as.factor(module),
    deploy_status = as.factor(deploy_status)
  )

# 4. Verificar resultado
glimpse(df_clean)
summary(df_clean)