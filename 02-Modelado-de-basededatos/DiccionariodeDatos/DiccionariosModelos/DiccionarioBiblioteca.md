# 📘 Diccionario de Datos – BIBLIOTECA
*Tabla libros*

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK  | Referenci a   | Descripción              |
|-----------------|--------------|--------|-----|-----|------|-------|------------------------|---------------|--------------------------|
| `IdLibro`       | INT          | ---    | ✅  | ❌ | ❌   | ✅   | ---                    | ---           | Identificador del Libro  |
| `NumISBN`       | INT          | ---    | ❌  | ❌ | ❌   | ✅   | ---                    | ---           | ISBN del Libro           |
| `Titulo`        | VARCHAR      | 100    | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Tema principal del Libro |
| `Autor`         | VARCHAR      | ---    | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Por Quien fue Escrito    |


*Tabla lector*

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK  | Referenci a   | Descripción              |
|-----------------|--------------|--------|-----|-----|------|-------|------------------------|---------------|--------------------------|
| `IdLector`      | INT          | ---    | ✅  | ❌ | ❌   | ✅   | ---                    | -             | Identificador del Lector |
| `ApMaterno`     | VARCHAR      | 100    | ❌  | ❌ | ❌   | ❌   | ---                    | -             | segundo apellido Lector  |
| `ApPaterno`     | VARCHAR      | 100    | ❌  | ❌ | ❌   | ❌   | ---                    | -             | Primerapellido Lector    |
| `Nombre`        | VARCHAR      | 100    | ❌  | ❌ | ❌   | ❌   | ---                    | -             | nombre del Lector        |
| `NumLector`     | INT          | ---    | ❌  | ❌ | ❌   | ❌   | ---                    | -             | nombre del Lector        |


*Tabla Prestamo*

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK  | Referenci a          | Descripción               |
|-----------------|--------------|--------|-----|-----|------|-------|------------------------|----------------------|------------------------ --|
| `IdPrestamo`    | INT          | ---    | ✅  | ❌ | ❌   | ✅   | ---                    | ---                  | Identificador del Prestamo|
| `idLibro`       | INT          | ---    | ❌  | ✅ | ❌   | ❌   | ---                    | TablaLibro(IdLibro)  | Identificador del Libro   |
| `IdLector`      | INT          | ---    | ❌  | ✅ | ❌   | ❌   | ---                    | TablaLector(idLector)| Identificador del Lector  |
