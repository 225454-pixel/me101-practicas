# Tema 12 — Datos geoespaciales (Unidad III)

**Estudiante:** José Ángel
**Curso:** ME101 — Programación Estadística y Visualización de Datos

## (a) Lugares elegidos y por qué

Elegí cuatro lugares que forman parte de mi rutina diaria entre Anta y Cusco. Las coordenadas están en WGS84 (EPSG:4326), tomadas de Google Maps:

| Lugar | Latitud | Longitud | Por qué lo elegí |
|---|---|---|---|
| Mi casa (Anta) | -13.466745 | -72.142850 | Es mi punto de partida todos los días. |
| UNSAAC | -13.521836 | -71.958325 | Es donde estudio. |
| Tóxica | -13.465919 | -72.146260 | Dirección de la Tóxica. |
| Terminal de buses a Anta | -13.527465 | -71.958151 | De aquí salen los buses para volver de Cusco a Anta. |

Así puedo comparar dos grupos de lugares: los de Anta y los de Cusco, separados por el trayecto que hago a diario.

## (b) Par más cercano y más lejano

Calculé todas las combinaciones con mi propia función `distancia_haversine` (radio terrestre de 6371 km):

- **Más cercano:** Mi casa (Anta) y Tóxica, a **0.380 km** (unos 380 m).
- **Más lejano:** Tóxica y el Terminal de buses a Anta, a **21.460 km**.

Desde mi casa hasta la UNSAAC hay 20.871 km en línea recta. La distancia real por carretera es mayor, porque Haversine mide sobre la superficie de la esfera y no sigue las curvas de la pista.

## (c) Pregunta de cierre sobre CRS

Los números solos no dicen en qué unidades ni en qué sistema están. Mis coordenadas son grados en EPSG:4326, mientras que en UTM son metros Este/Norte (en esta zona, unos 8 500 000 m al Norte). Si un compañero pone mis valores en su GPS como si fueran UTM, los leerá como unos pocos metros desde el origen de la zona, y el punto caerá a miles de kilómetros de Anta. También podría invertir latitud y longitud. En UTM además hay que indicar la zona: mis lugares quedan justo a ambos lados del meridiano -72°, así que Anta cae en la zona 18S (EPSG:32718) y la UNSAAC en la 19S (EPSG:32719). Por eso los datos siempre deben ir con su código EPSG, para que el otro pueda transformarlos correctamente.

## Archivos de esta carpeta

- `JoseAngel_Tema12_Python.ipynb` — cuaderno con las Tareas 1 a 3, con todas las celdas ejecutadas.
- `mapa_basico.png` — mapa de puntos hecho con matplotlib.
- `mis_lugares.geojson` — FeatureCollection con 4 puntos y, como reto opcional, una LineString que representa la ruta de Mi casa a la UNSAAC.
