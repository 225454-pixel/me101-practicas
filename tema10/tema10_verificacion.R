# ============================================================
# ME101 · Tema 10 — Mapas de calor con ggplot2 y pheatmap
# Tareas 2 y 3
# Estudiante: Apellido Nombre
# Fecha: 04/11/2026
# ============================================================

library(tidyverse)
library(pheatmap)

# ------------------------------------------------------------
# TAREA 2 — Paso 9: reconstruir dataset y matriz de correlacion
# (mismos valores que la Tarea 1 en Python)
# ------------------------------------------------------------
datos <- data.frame(
  horas_estudio = c(2, 4, 5, 3, 6, 8, 7, 1, 9, 5),
  horas_redes   = c(6, 5, 3, 6, 3, 1, 2, 7, 1, 4),
  asistencia    = c(70, 65, 85, 60, 80, 90, 75, 55, 95, 88),
  nota_final    = c(10, 12, 13, 11, 15, 16, 15, 8, 17, 12)
)

matriz_corr <- cor(datos, method = "pearson")
print(round(matriz_corr, 4))

# ------------------------------------------------------------
# TAREA 2 — Paso 10: convertir a formato largo con pivot_longer()
# ------------------------------------------------------------
variables <- colnames(matriz_corr)

corr_larga <- matriz_corr |>
  as.data.frame() |>
  rownames_to_column(var = "var1") |>
  pivot_longer(cols = -var1, names_to = "var2", values_to = "r") |>
  mutate(
    var1 = factor(var1, levels = rev(variables)),  # fila 1 arriba
    var2 = factor(var2, levels = variables)
  )

print(nrow(corr_larga))
cat("Verificacion: nrow == n_variables^2 ->",
    nrow(corr_larga) == length(variables)^2, "\n")

# ------------------------------------------------------------
# TAREA 2 — Paso 11: heatmap con geom_tile() + geom_text()
# ------------------------------------------------------------
g <- ggplot(corr_larga, aes(x = var2, y = var1, fill = r)) +
  geom_tile(color = "white", linewidth = 0.8) +
  geom_text(aes(label = sprintf("%.2f", r)), size = 4.5) +
  scale_fill_gradient2(low = "#2166AC", mid = "white", high = "#B2182B",
                       midpoint = 0, limits = c(-1, 1),
                       name = "r de Pearson") +
  coord_fixed() +
  labs(title = "Matriz de correlacion — ggplot2 + geom_tile",
       x = NULL, y = NULL) +
  theme_minimal(base_size = 12) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        panel.grid = element_blank())

print(g)
ggsave("heatmap_ggplot2.png", plot = g, width = 7, height = 6, dpi = 150)

# ------------------------------------------------------------
# TAREA 3 — Paso 13: pheatmap CON agrupamiento (por defecto)
# ------------------------------------------------------------
paleta <- colorRampPalette(c("#2166AC", "white", "#B2182B"))(100)
cortes <- seq(-1, 1, length.out = 101)   # centra la escala en 0

pheatmap(matriz_corr,
         display_numbers = TRUE,
         number_format = "%.2f",
         color = paleta,
         breaks = cortes,
         main = "pheatmap CON agrupamiento jerarquico",
         filename = "heatmap_pheatmap_agrupado.png",
         width = 7, height = 6)

# ------------------------------------------------------------
# TAREA 3 — Paso 14: pheatmap SIN agrupamiento
# ------------------------------------------------------------
pheatmap(matriz_corr,
         display_numbers = TRUE,
         number_format = "%.2f",
         color = paleta,
         breaks = cortes,
         cluster_rows = FALSE,
         cluster_cols = FALSE,
         main = "pheatmap SIN agrupamiento",
         filename = "heatmap_pheatmap_sin_agrupar.png",
         width = 7, height = 6)

# Orden que eligio el agrupamiento (para comparar con el original)
hc <- hclust(dist(matriz_corr))   # mismo metodo que pheatmap por defecto
cat("Orden original:   ", variables, "\n")
cat("Orden agrupado:   ", variables[hc$order], "\n")
