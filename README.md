# 📊 Análisis Estocástico de Métricas DevOps y Calidad de Software

Este repositorio contiene un análisis estadístico descriptivo e inferencial aplicado sobre un conjunto de datos sintético de **5,000 eventos de CI/CD**. El objetivo principal del proyecto es evaluar patrones de rendimiento, tiempos de construcción (*build*), tasas de fallo en despliegues y la relación entre el tamaño de los cambios en el código y los errores detectados en producción.

---

## 📁 Estructura del Repositorio

```text
Proyecto_DevOps_Estadistica/
├── 00_generar_datos.R            # Script de generación del dataset sintético (5,000 registros)
├── 01_carga_limpieza.R           # Carga, tipado de datos y procesamiento de valores nulos
├── 02_descriptiva_univariada.R   # Tendencia central, dispersión, asimetría y curtosis
├── 03_frecuencias_agrupacion.R   # Tablas de frecuencia con la Regla de Sturges
├── 04_comparacion_grupos.R       # Resúmenes agrupados por equipos (Alpha, Beta, Delta, Gamma) y módulos
├── 05_relaciones_bivariadas.R    # Matriz de correlación y cruce bivariado de variables
├── 06_visualizacion_datos.R      # Gráficos exploratorios y descriptivos con ggplot2
├── devops_metrics.csv            # Dataset sintético base en formato CSV
├── bitacora_prompts.md           # Registro interactivo de consultas y asistencia por IA
├── reporte_final.Rmd             # Documento ejecutable R Markdown
├── reporte_final.html            # Reporte final interactivo compilar en formato web
└── README.md                     # Documentación principal del repositorio
```
🛠️ Tecnologías y Librerías Utilizadas
Lenguaje: R v4.6+

Entorno de Desarrollo: RStudio

Paquetes Principales:

tidyverse (dplyr, ggplot2, readr, tibble, purrr)

moments (Estadística de forma: asimetría y curtosis)

knitr / rmarkdown (Generación del informe interactivo HTML)
