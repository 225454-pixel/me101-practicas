library(tidyverse)
df <- read_csv("estudiantes.csv")
glimpse(df)
colSums(is.na(df))
df_limpio <- df %>%
  drop_na(nota) %>%
  mutate(asistencia_pct = replace_na(
    asistencia_pct,
    mean(asistencia_pct, na.rm = TRUE)
  ))
df_limpio
colSums(is.na(df_limpio))
promedio_por_curso <- df_limpio %>%
  group_by(curso) %>%
  summarise(promedio_nota = mean(nota))

print(promedio_por_curso)
write_csv(df_limpio, "estudiantes_limpio_R.csv")
