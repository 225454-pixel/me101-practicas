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
El umbral obtenido mediante el método de Otsu fue 0.359212890625. Este valor permite separar los píxeles de la imagen en dos grupos según su intensidad.

La proporción de píxeles clasificados como True fue 0.8339583333333334, equivalente al 83.4 % del total de píxeles analizados.