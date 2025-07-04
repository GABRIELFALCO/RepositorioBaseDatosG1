# 📘 Diccionario de Datos – HOSPITAL

*Tabla Doctores*

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK  | Referenci a   | Descripción                   |
|-----------------|--------------|--------|-----|-----|------|-------|------------------------|---------------|-------------------------------|
| `IdDoctor`      | INT          | ---    | ✅  | ❌ | ❌   | ✅   | ---                    | ---           | Identificador del Doctor      |
| `ApMaterno`     | VARCHAR      | 50     | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Segundo Apellido              |
| `ApPaterno`     | VARCHAR      | 50     | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Primer Apellido               |
| `Nombre`        | VARCHAR      | 50     | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Nombre del Doctor             |
| `Area`          | VARCHAR      | ---    | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Area donde Trabaja            |


*Tabla Pacientes*

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK  | Referenci a   | Descripción                |
|-----------------|--------------|--------|-----|-----|------|-------|------------------------|---------------|----------------------------|
| `IdPaciente`    | INT          | ---    | ✅  | ❌ | ❌   | ✅   | ---                    | ---           | Identificador del Paciente |
| `ApMaterno`     | VARCHAR      | ---    | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Segundo Apellido           |
| `ApPaterno`     | VARCHAR      | ---    | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Primer Apellido            |
| `Nombre`        | VARCHAR      | 50     | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Nombre del Paciente        |


*Tabla Atienden*

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK  | Referenci a             | Descripción              |
|-----------------|--------------|--------|-----|-----|------|-------|------------------------|-------------------------|--------------------------|
| `IdAtencion`    | INT          | ---    | ✅  | ❌ | ❌   | ✅   | ---                    | ---                     | Identificador Atencion   |
| `NumAten`       | INT          | ---    | ❌  | ❌ | ❌   | ❌   | ---                    | ---                     | Numero de Atencion       |
| `Fecha`         | DATE         | ---    | ❌  | ❌ | ❌   | ❌   | ---                    | ---                     | Fecha de ser Atendido    |
| `Diagnostico`   | VARCHAR      | 100    | ❌  | ❌ | ❌   | ❌   | ---                    | ---                     | Identificador Inscripcion|
| `IdDoctor`      | INT          | ---    | ❌  | ✅ | ❌   | ❌   | ---                    | TablaDoctoresR(IdDoctor)| Identificador de Doctores|
| `IdDoctor`      | INT          | ---    | ❌  | ✅ | ❌   | ❌   | ---                    | TablaPacientes(IdCurso) | Identificador de Paciente|