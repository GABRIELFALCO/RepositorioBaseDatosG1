# 📘 Diccionario de Datos – CURSOS

*Tabla Estudiante*

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK  | Referenci a   | Descripción                   |
|-----------------|--------------|--------|-----|-----|------|-------|------------------------|---------------|-------------------------------|
| `IdEstudiante`  | INT          | ---    | ✅  | ❌ | ❌   | ✅   | ---                    | ---           | Identificador del Estudiante  |
| `ApMaterno`     | VARCHAR      | 50     | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Segundo Apellido              |
| `ApPaterno`     | VARCHAR      | 50     | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Primer Apellido               |
| `Nombre`        | VARCHAR      | 50     | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Nombre del Estudiante         |
| `Matricula`     | INT          | ---    | ❌  | ❌ | ❌   | ✅   | ---                    | ---           | Folio en su Institución       |
| `NumEstu`       | INT          | ---    | ❌  | ❌ | ❌   | ✅   | ---                    | ---           | Numero de Estudiante          |


*Tabla Cusos*

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK  | Referenci a   | Descripción              |
|-----------------|--------------|--------|-----|-----|------|-------|------------------------|---------------|--------------------------|
| `IdCurso`       | INT          | ---    | ✅  | ❌ | ❌   | ✅   | ---                    | ---           | Identificador del Curso  |
| `NumCurso`      | INT          | ---    | ❌  | ❌ | ❌   | ✅   | ---                    | ---           | Numero del Curso         |
| `Codigo`        | INT          | ---    | ❌  | ❌ | ❌   | ✅   | ---                    | ---           | Codigo Inscripcion       |
| `NombreCurso`   | VARCHAR      | 100    | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Nombre del Cusrso        |


*Tabla Inscripcion*

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK  | Referenci a         | Descripción              |
|-----------------|--------------|--------|-----|-----|------|-------|------------------------|---------------------|--------------------------|
| `IdInscripcion` | INT          | ---    | ✅  | ❌ | ❌   | ✅   | ---                    | ---                 | Identificador Inscripcion|
| `IdLibro`       | INT          | ---    | ❌  | ✅ | ❌   | ❌   | ---                    | TablaLibro(IdLibro) | Identificador de Libros  |
| `IdCurso`       | INT          | ---    | ❌  | ✅ | ❌   | ❌   | ---                    | TablaCursos(IdCurso)| Identificador de Cursos  |