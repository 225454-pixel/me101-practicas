# Tema 6: Imágenes como datos

## 1. Dimensiones de las imágenes sintéticas

La imagen en escala de grises tiene dimensiones de 5 × 5 píxeles y está representada mediante una matriz bidimensional. Sus valores van de 0 a 255 y el promedio de los píxeles es 127.2.

La imagen a color RGB tiene dimensiones de 4 × 4 × 3, correspondientes a cuatro filas, cuatro columnas y tres canales de color: rojo, verde y azul.

## 2. Colores y luminosidad

Para la imagen RGB elegí dos colores: rojo y azul. El rojo tiene valores RGB de (255, 0, 0) y una luminosidad ponderada de 76.245. El azul tiene valores RGB de (0, 0, 255) y una luminosidad ponderada de 29.07.

## 3. Umbral de binarización

Utilicé un umbral de 50 para convertir la imagen a una matriz binaria. Elegí este valor porque se encuentra entre las luminosidades del rojo y del azul. Así, el rojo se representa con 1 y el azul con 0, lo que permite distinguir ambos colores mediante valores binarios.