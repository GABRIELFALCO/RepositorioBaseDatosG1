# 📘 Diccionario de Datos – Vehiculos
*Tabla Clientes*

| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|---------------|--------------|--------|-----|-----|------|--------|--------------|--------------|---------------------------------|
| idCliente   | INT          | -      | ✅  | ❌  | ❌   | ✅     | -            | -            | Identificador del cliente       |
| ap. Paterno | NVARCHAR     | 50     | ❌  | ❌  | ❌   | ❌     | -            | -            | Apellido paterno del cliente    |
| ap. Materno | NVARCHAR     | 50     | ❌  | ❌  | ❌   | ❌     | -            | -            | Apellido materno del cliente    |
| nombre      | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | -            | -            | Nombre del cliente              |
| telefono    | INT          | -      | ❌  | ❌  | ❌   | ❌     | -            | -            | Teléfono del cliente            |
| curp        | NVARCHAR     | 16     | ❌  | ❌  | ❌   | ✅     | -            | -            | CURP del cliente                |
| calle       | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | -            | -            | Calle de dirección              |
| num         | INT          | 10     | ❌  | ❌  | ❌   | ❌     | -            | -            | Número de dirección             |
| ciudad      | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | -            | -            | Ciudad de residencia            |



*Tabla Vehículos*

| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción               |
|-------------|--------------|--------|-----|------|------|---------|--------------------|--------------|---------------------------|
| idVehículo  | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                  | -            | Identificador del vehículo|
| placa       | NVARCHAR     | 7      | ❌  | ❌  | ❌   | ✅     | -                  | -            | Placa del vehículo        |
| modelo      | NVARCHAR     | 25     | ❌  | ❌  | ❌   | ❌     | -                  | -            | Modelo del vehículo       |
| marca       | NVARCHAR     | 25     | ❌  | ❌  | ❌   | ❌     | -                  | -            | Modelo del vehículo       |
| year        | DATE         | -      | ❌  | ❌  | ❌   | ❌     | -                  | -            | Año del vehículo          |
| idCliente   | INT          | -      | ❌  | ✅  | ❌   | ❌     | -                  | cliente(idCliente)| el cliente que renta vehivulo |
| idSucursal  | INT          | -      | ❌  | ✅  | ❌   | ❌     | -                  | Sucursar(idSucursal)| la sucursal donde se encuetra el vehiculo|



*Tabla Renta*

| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción                    |
|-------------|--------------|--------|-----|-----|------|------|----------------------|---------------------|---------------------------|
| idRenta     | INT          | -      | ✅ | ❌  | ❌   | ✅  | -                    | -                   | Identificador de renta    |
| idCliente   | INT          | -      | ❌ | ✅  | ❌   | ❌  | -                    | Clientes(idCliente) | Cliente que renta         |
| idVehículo  | INT          | -      | ❌ | ✅  | ❌   | ❌  | -                    | Vehículos(idVehículo)| Vehículo rentado         |
| fechaInicio | DATE         | -      | ❌ | ❌  | ❌   | ❌  | -                    | -                   | Fecha inicio de renta     |
| fechaFin    | DATE         | -      | ❌ | ❌  | ❌   | ❌  | -                    | -                   | Fecha fin de renta        |



*Tabla Sucursal*

| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a  | Descripción   |
|---------------|--------------|--------|-----|-----|------|--------|----------------------|----------------------|---------------------------|
| idSucursal  | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                    | -                    | Identificador de sucursal |
| nombre      | NVARCHAR     | 25     | ❌  | ❌  | ❌   | ❌     | -                    | -                    | Nombre de la sucursal     |
| ubicacion   | NVARCHAR     | 25     | ❌  | ❌  | ❌   | ✅     | -                    | -                    | Dirección de la sucursal  |
| idVehículo  | INT          | -      | ❌  | ✅  | ❌   | ❌     | -                    | Vehículos(idVehículo)| Vehículo asignado         |