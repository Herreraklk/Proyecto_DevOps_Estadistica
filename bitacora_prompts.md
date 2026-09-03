 ##  Fase 0: Generación del conjunto de datos (`devops_metrics.csv`)
 (1)
 Al inicio le pedí a la IA algo muy directo:  
"Dame un script en R para crear un dataset sintético de métricas DevOps de 5000 filas."
 Resultado: La IA generó un script básico que no se ajustaba a los requerimientos de la pauta. Le faltaban las variables ordinales explícitas (como la prioridad de tickets), no incluía valores nulos (`NA`) para realizar la etapa de limpieza posterior y tampoco fijaba una semilla (`set.seed`), por lo que los datos cambiaban cada vez que se ejecutaba el código.
 
 (2)
 Para ajustar la respuesta a la pauta del proyecto, redefiní la consulta detallando cada variable y condición técnica:  
 "Genera un script en R usando tidyverse para crear el archivo 'devops_metrics.csv' con 5.000 filas. Debe incluir set.seed(42) y las siguientes columnas: build_time_min, deploy_time_min, test_coverage_pct y ticket_resolution_h (cuantitativas continuas); commit_size_loc y num_bugs (cuantitativas discretas); team, module y deploy_status (cualitativas nominales); y priority (cualitativa ordinal: baja, media, alta, crítica). Además, introduce deliberadamente entre 1% y 2% de NAs en test_coverage_pct y ticket_resolution_h para poder limpiarlos en la siguiente fase."
 
 ##  Fase 1: Carga y Limpieza de Datos
 
 (1)
 prompt:
 Escribe el script de R '01_carga_limpieza.R' usando tidyverse. Debe leer 'devops_metrics.csv', mostrar el resumen inicial con glimpse() y colSums(is.na()), y crear un objeto 'df_clean' donde: 1) Se eliminen las filas con NAs mediante drop_na(), 2) Se convierta 'priority' en factor ordenado (baja < media < alta < crítica), y 3) Se conviertan 'team', 'module' y 'deploy_status' en factores nominales."
 
 (2)
 En la pestaña **Environment** vi que `df` tenía 5000 observaciones y `df_clean` quedó con 4920 observaciones (se removieron correctamente las 80 filas con faltantes).
 
 ##  Fase 2: Estadística Descriptiva Univariada
 
 (1)
 prompt:
 "Crea un script en R ('02_descriptiva_univariada.R') que calcule la media, mediana, desviación estándar, IQR, coeficiente de variación, asimetría y curtosis para todas las variables cuantitativas de 'df_clean' usando dplyr y moments."
 
 (2)
 verificacion:
 Se ejecutó el script y se generó la tabla de resumen con 6 variables numéricas.
 
 ##  Fase 3: Tablas de Frecuencias y Agrupación
 
 (1)
 prompt:
 "Crea un script en R ('03_frecuencias_agrupacion.R') que aplique la Regla de Sturges para calcular los intervalos de clase de build_time_min en df_clean y genere la tabla de frecuencias absolutas, relativas y acumuladas, identificando la clase modal."
 
 (2)
 verificacion:
 Se determinaron 14 intervalos de clase según la regla de Sturges.
 
 
 ##  Fase 4: Comparación por Grupos
 
 (1)
 prompt:
 "Genera un script en R ('04_comparacion_grupos.R') para comparar la mediana del tiempo de build, promedio de bugs y porcentaje de fallos agrupando por equipo y por módulo con dplyr, además de una tabla cruzada entre equipo y deploy_status."
 
 (2)
 verificacion:
 Se ejecutó el análisis comparativo
 
 ##  Fase 5: Relaciones Bivariadas
 
 (1)
 prompt:
 "Escribe un script en R ('05_relaciones_bivariadas.R') para calcular la matriz de correlación de Pearson entre todas las variables numéricas de 'df_clean' y generar la tabla de contingencia en porcentajes por fila (prop.table) entre prioridad y deploy_status."
 
 (2)
 verificacion:
 Se obtuvo la matriz de correlación completa.
 
 ##  Fase 6: Visualización de Datos con ggplot2
 
 (1)
 Prompt:
 "Genera un script en R ('06_visualizacion_datos.R') usando ggplot2 para construir 4 gráficos con títulos y ejes formateados: 1) Histograma de build_time_min, 2) Boxplot de ticket_resolution_h por equipo, 3) Gráfico de barras agrupadas de deploy_status por prioridad, y 4) Scatter plot con línea de tendencia entre commit_size_loc y num_bugs."
 
 (2)
 Verificación:
 Se visualizaron los 4 gráficos en la pestaña Plots sin errores de sintaxis
 