# TEMA 6 - IMAGENES COMO DATOS
# Tarea 3: Reconstruccion del degradado

degradado <- as.integer(seq(0, 255, length.out = 5))

gris <- matrix(
  rep(degradado, times = 5),
  nrow = 5,
  ncol = 5,
  byrow = TRUE
)

print("Matriz en escala de grises:")
print(gris)

print("Dimensiones:")
print(dim(gris))

print("Promedio:")
print(mean(gris))


# ============================================================
# TAREA 3: IMAGEN RGB DE DOS MITADES
# ============================================================

# Crear una imagen de 4 filas, 4 columnas y 3 canales
rgb <- array(0, dim = c(4, 4, 3))

# Mitad izquierda: rojo (R=255, G=0, B=0)
rgb[, 1:2, 1] <- 255

# Mitad derecha: azul (R=0, G=0, B=255)
rgb[, 3:4, 3] <- 255

# Comprobar los píxeles extremos
print("Pixel superior izquierdo (rojo):")
print(rgb[1, 1, ])

print("Pixel superior derecho (azul):")
print(rgb[1, 4, ])

print("Dimensiones de la imagen RGB:")
print(dim(rgb))



# ============================================================
# CONVERSION A ESCALA DE GRISES: LUMINOSIDAD PONDERADA
# ============================================================

R <- rgb[, , 1]
G <- rgb[, , 2]
B <- rgb[, , 3]

gris_luminosidad <- 0.299 * R + 0.587 * G + 0.114 * B

print("Matriz de luminosidad:")
print(gris_luminosidad)

print("Luminosidad del rojo:")
print(gris_luminosidad[1, 1])

print("Luminosidad del azul:")
print(gris_luminosidad[1, 4])
