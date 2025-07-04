# 📘 Diccionario de Datos – COMPANY

*Table Employe*

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK  | Referenci a   | Descripción                         |
|-----------------|--------------|--------|-----|-----|------|-------|------------------------|---------------|-------------------------------------|
| `IdEmploye`     | INT          | ---    | ✅  | ❌ | ❌   | ✅   | ---                    | ---           | Identificador del Employe           |
| `SNN`           | INT          | ---    | ❌  | ❌ | ❌   | ✅   | ---                    | ---           | Numero de Employe                   |
| `FristName`     | VARCHAR      | 50     | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Clave Única de Registro de Población|
| `LastName`      | VARCHAR      | 50     | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Segundo Apellido                    |
| `Name`          | VARCHAR      | 50     | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Primer Apellido                     |
| `Salary`        | MONEY        | ---    | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Nombre del Employe                  |
| `BritDate`      | DATE         | ---    | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Direccion                           |
| `Address`       | VARCHAR      | 50     | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Calle Donde se Localiza             |
| `Sex`           | VARCHAR      | 50     | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Numero de la Calle                  |
| `DeparmetId`    | INT          | ---    | ❌  | ✅ | ❌   | ✅   | ---                    | ---           | Ciudad donde Radica                 |   
| `Jefe`          | VARCHAR      | 50     | ❌  | ✅ | ❌   | ❌   | ---                    | ---           | Telefono de Contacto                |


*Table Deparmet*

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK  | Referenci a   | Descripción                   |
|-----------------|--------------|--------|-----|-----|------|-------|------------------------|---------------|-------------------------------|
| `DepId`         | INT          | ---    | ✅  | ❌ | ❌   | ✅   | ---                    | ---           | Identificador del Deparment   |
| `NumDepto`      | INT          | ---    | ❌  | ❌ | ❌   | ✅   | ---                    | ---           | Numero del Department         |
| `NameDepto`     | VARCHAR      | 50     | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Nmbre del Department          |
| `StartDate`     | DATE         | 50     | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Fecha de Inicio               |
| `ManagerId`     | INT          | ---    | ❌  | ✅ | ❌   | ✅   | ---                    | ---           | Foranea ManagerId             |


*Table Location*

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK  | Referenci a         | Descripción              |
|-----------------|--------------|--------|-----|-----|------|-------|------------------------|---------------------|--------------------------|
| `LocationId`    | INT          | ---    | ✅  | ❌ | ❌   | ✅   | ---                    | ---                 | Identificador Location   |
| `Location`      | VARCHAR      | 100    | ❌  | ❌ | ❌   | ❌   | ---                    | ---                 | Localizacion de Depto    |
| `DepId`         | INT          | ---    | ❌  | ✅ | ❌   | ❌   | ---                    | TableDeparmet(DepId)| Identificador de Deparmet|


*Table Dependent*

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK  | Referenci a   | Descripción                   |
|-----------------|--------------|--------|-----|-----|------|-------|------------------------|---------------|-------------------------------|
| `IdEmploye`     | INT          | ---    | ✅  | ❌ | ❌   | ✅   | ---                    | ---           | Identificador del Employe     |
| `Name`          | VARCHAR      | 50     | ✅  | ❌ | ❌   | ✅   | ---                    | ---           | Numero del Dependinete        |
| `sex`           | VARCHAR      | 50     | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Sexo del Dependinete          |
| `BirtDate`      | DATE         | ---    | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Fecha de Nacimiento           |
| `RelactionShip` | VARCHAR      | 50     | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Relacion con Employe          |


*Table WorksOn*

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK  | Referenci a   | Descripción                   |
|-----------------|--------------|--------|-----|-----|------|-------|------------------------|---------------|-------------------------------|
| `IdWorksOn`     | INT          | ---    | ✅  | ❌ | ❌   | ✅   | ---                    | ---           | Identificador De WorksOn      |
| `IdEmploye`     | INT          | ---    | ✅  | ❌ | ❌   | ✅   | ---                    | ---           | Numero del Employe            |
| `IdProjet`      | INT          | ---    | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Sexo del Projet               |
| `housr`         | VARCHAR      | 50     | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Horas trabajadas              |


*Table Dependent*

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK  | Referenci a   | Descripción                   |
|-----------------|--------------|--------|-----|-----|------|-------|------------------------|---------------|-------------------------------|
| `IdProjet`      | INT          | ---    | ✅  | ❌ | ❌   | ✅   | ---                    | ---           | Identificador del Projet      |
| `Nameproj`      | VARCHAR      | 50     | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Nombre del Project            |
| `NumProj`       | INT          | ---    | ❌  | ❌ | ❌   | ✅   | ---                    | ---           | Numero del Project            |
| `Location`      | VARCHAR      | 50     | ❌  | ❌ | ❌   | ❌   | ---                    | ---           | Localizacon del Proyecto      |
| `DepId`         | INT          | ---    | ❌  | ✅ | ❌   | ❌   | ---                    | ---           | Identificador de Deparmet     |