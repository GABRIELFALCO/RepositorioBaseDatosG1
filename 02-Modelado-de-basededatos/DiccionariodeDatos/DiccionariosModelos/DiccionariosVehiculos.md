# 📘 Diccionario de Datos – Plantilla General
**Tabla Cliente**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK  | Referencia a    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumCliente`    | INT          | -      | ✅  | ❌  | ❌   |✅     |  --------------                               | -                                | Identificador del cliente               |----
| `Nombre`        | VARCHAR      | 20     | ❌  | ❌  | ❌   | ❌     | -----         | ---                                |            |
| `Apellido`      | INT          | 20      | ❌  | ❌  | ❌   | ❌     |--------------         | -                                | Edad del cliente                   |
| `Correo`        | VARCHAR      | 20    | ❌  | ❌  | ❌   | ❌     | -----------                  | -                                | Correo electrónico                      |
| `IdCiudad`      | INT          | -      | ❌  | ❌  | ❌   | ❌     | ---------                                        |            | cliente    |
