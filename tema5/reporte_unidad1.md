# Reporte Unidad 1

## Estadística descriptiva

Se analizaron las variables `nota` y `asistencia_pct` utilizando Python y R.

### Resultados principales

| Variable | Media | Desviación estándar | CV (%) | Dispersión |
|---|---:|---:|---:|---|
| nota | 14.0000 | 1.5811 | 11.2938 | Baja |
| asistencia_pct | 89.5000 | 3.6401 | 4.0671 | Baja |

### Interpretación

La variable `nota` presenta una media de 14.00 y una desviación estándar de 1.5811. Su coeficiente de variación es de 11.2938%, por lo que según la función utilizada presenta una dispersión baja.

La variable `asistencia_pct` presenta una media de 89.50 y una desviación estándar de 3.6401. Su coeficiente de variación es de 4.0671%, por lo que también presenta una dispersión baja.

### Observación sobre Python y R

Al comparar los resultados obtenidos en Python y R, algunas medidas coincidieron y otras presentaron diferencias debido a las convenciones utilizadas por las funciones. Por ejemplo, NumPy calcula por defecto la varianza con `ddof=0`, mientras que R utiliza la varianza muestral. También se observaron diferencias en el cálculo de la curtosis debido a las convenciones de cada biblioteca.