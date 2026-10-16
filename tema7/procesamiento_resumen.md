# Tema 7: Procesamiento básico de imágenes

## 1. Imagen sintética
Se creó una imagen de 120 × 120 píxeles con fondo celeste, un rectángulo rojo, un círculo amarillo y una línea verde.

## 2. Transformaciones con Pillow
Se convirtió la imagen a escala de grises, se rotó 90°, se redujo a la mitad y se realizó un volteo vertical.

## 3. Brillo y filtros
Se aplicaron dos factores de brillo: 0.5 y 2.5. También se utilizó un filtro de desenfoque gaussiano y un filtro de detección de bordes.

## 4. Comparación con scikit-image
Se comparó la conversión a escala de grises de Pillow con `rgb2gray()` de scikit-image. Las diferencias pueden deberse al método de conversión y al redondeo.

## 5. Umbral de Otsu
Umbral obtenido: [completar con el resultado de Python].

Proporción de píxeles clasificados como True: [completar con el resultado de Python].