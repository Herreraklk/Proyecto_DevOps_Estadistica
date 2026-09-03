# 1. Fijar semilla para reproducibilidad
set.seed(42)
n <- 5000

# 2. Generar datos sintéticos DevOps
devops_metrics <- data.frame(
  build_time_min = round(rgamma(n, shape = 3, rate = 0.2), 2),
  deploy_time_min = round(rgamma(n, shape = 2, rate = 0.1), 2),
  commit_size_loc = rpois(n, lambda = 150),
  num_bugs = rpois(n, lambda = 2),
  test_coverage_pct = round(pmin(100, pmax(0, rnorm(n, mean = 75, sd = 12))), 2),
  ticket_resolution_h = round(rexp(n, rate = 0.05), 2),
  team = sample(c("Alpha", "Beta", "Gamma", "Delta"), n, replace = TRUE),
  module = sample(c("auth", "api", "ui", "database", "analytics"), n, replace = TRUE),
  priority = sample(c("baja", "media", "alta", "crítica"), n, replace = TRUE, prob = c(0.4, 0.3, 0.2, 0.1)),
  deploy_status = sample(c("success", "failed", "rolled_back"), n, replace = TRUE, prob = c(0.8, 0.15, 0.05))
)

# 3. Insertar faltantes (NAs)
devops_metrics$ticket_resolution_h[sample(1:n, 50)] <- NA
devops_metrics$test_coverage_pct[sample(1:n, 30)] <- NA

# 4. Guardar archivo CSV
write.csv(devops_metrics, "devops_metrics.csv", row.names = FALSE)
print("¡Archivo devops_metrics.csv creado con éxito!")