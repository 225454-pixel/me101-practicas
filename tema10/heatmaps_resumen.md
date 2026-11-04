# Tema 10 — Resumen de mapas de calor

**Curso:** ME101 · Programación Estadística y Visualización de Datos
**Estudiante:** Apellido Nombre
**Fecha:** 04/11/2026

## Contenido de la carpeta

| Archivo | Origen |
|---|---|
| `Apellido_Nombre_Tema10_Python.ipynb` | Tarea 1 (seaborn) |
| `tema10_verificacion.R` | Tareas 2 y 3 (ggplot2 y pheatmap) |
| `heatmap_seaborn.png` | Tarea 1, paso 6 |
| `heatmap_seaborn_mascara.png` | Tarea 1, paso 7 |
| `heatmap_ggplot2.png` | Tarea 2, paso 11 |
| `heatmap_pheatmap_agrupado.png` | Tarea 3, paso 13 |
| `heatmap_pheatmap_sin_agrupar.png` | Tarea 3, paso 14 |

## (a) ¿Qué herramienta fue más rápida y por qué?

La más rápida fue **pheatmap**: con una sola llamada recibió la matriz ancha tal cual y ya dibujó
colores, números, leyenda y dendrogramas, e incluso guardó el PNG con el argumento `filename`.
**seaborn** quedó muy cerca: `sns.heatmap()` también acepta la matriz directamente y solo tuve que
agregar `plt.savefig()`; además, la máscara con `np.triu()` fue fácil de aplicar. **ggplot2** fue la
más lenta porque antes de graficar tuve que pasar la matriz a formato largo con `pivot_longer()` y
armar el gráfico capa por capa (`geom_tile`, `geom_text`, escala, tema), aunque a cambio es la que más
control da sobre cada detalle.

## (b) ¿El agrupamiento de pheatmap cambió el orden de las variables?

**Sí cambió.** Sin agrupamiento el orden es el original:
`horas_estudio, horas_redes, asistencia, nota_final`.
Con agrupamiento, pheatmap juntó primero **horas_estudio** y **nota_final** (r = 0.98, los perfiles de
correlación más parecidos), luego unió **asistencia** a ese grupo, y dejó a **horas_redes** sola en un
extremo, porque es la única variable que se correlaciona negativamente con todas las demás.
Esto revela dos bloques: un grupo de variables de "esfuerzo y rendimiento" que suben juntas, y el uso
de redes sociales como contraparte. En la matriz numérica esto ya se intuía, pero el reordenamiento lo
hace visible de un vistazo, porque las celdas rojas quedan juntas en un bloque.

## (c) Matriz de correlación completa (Pearson)

| | horas_estudio | horas_redes | asistencia | nota_final |
|---|---:|---:|---:|---:|
| **horas_estudio** | 1.0000 | -0.9808 | 0.8417 | 0.9828 |
| **horas_redes** | -0.9808 | 1.0000 | -0.8674 | -0.9661 |
| **asistencia** | 0.8417 | -0.8674 | 1.0000 | 0.8019 |
| **nota_final** | 0.9828 | -0.9661 | 0.8019 | 1.0000 |

Dataset: 10 estudiantes; variables horas de estudio semanales, horas diarias en redes sociales,
porcentaje de asistencia y nota final (escala vigesimal).
