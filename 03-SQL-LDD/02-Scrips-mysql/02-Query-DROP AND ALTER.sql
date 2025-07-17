#CRAR LA BASE DE DATOS EMPRESA PATITO 
CREATE DATABASE empresaPatito;
 
use empresaPatito;
 #EAR TABLA EMPLEADO 
CREATE TABLE Empleados(
IdEmpleado INT NOT NULL,
Nombre VARCHAR(100)NOT NULL,
Puesto VARCHAR(50),
FechaIngreso DATE,
Salario DECIMAL(10,2),
CONSTRAINT Pk_empleados
PRIMARY KEY (IdEmpleado)

);

#agregar columna de tabla empleado

ALTER TABLE Empleados
ADD Correo VARCHAR(100);


SELECT * FROM Empleados

#MODIFICAR EL TIPO DE DATO DE UN CAMPO 

ALTER TABLE Empleados
ALTER COLUMN Salario DECIMAL(12,2) NOT NULL;


#RENOMBRAR UN CAMPO 

EXEC sp_rename 'empleados.Correo',
				'Email','COLUMN';
				 

#CREAR TABLA DEPTOS

CREATE TABLE Departamentos(
IdDepartamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
NombreDepto VARCHAR(100)
);

#AGREGAR CAMPO A LA TABLA EMPLEADOS, PARA QUE SEA UNA FOREIGN KEY
ALTER TABLE EMPLEADOS
ADD IdDepartamento INT NOT NULL;

#AGREGAR FOREIGN KEY
ALTER TABLE Empleados
ADD CONSTRAINT Fk_Empleados_departamento
FOREIGN KEY (IdDepartamento)
REFERENCES Departamentos(IdDepartamento);

#eliminar la clave primaria de empleados 
ALTER TABLE Empleados 
DROP CONSTRAINT Pk_empleados;


#ELIMINAR LA FOREIGN KEY DE LA TABLA Empleados

ALTER TABLE Departamentos
DROP CONSTRAINT IdDepartamento INT NOT NULL;


#ELIMINAR LA PRIMARY KEY DE DEPTO
ALTER TABLE Departamentos
DROP PRIMARY KEY;


#CRRAR CONSTRAINT DE VERIFICACION 
#EN SALARIO 
ALTER TABLE Empleados 
ADD CONSTRAINT chk_salario
CHECK (salario>0.0);




CREATE TABLE Categoria(
Id INT NOT NULL PRIMARY KEY DEFAULT -1,
Nombre VARCHAR(20),
Estatus CHAR(1) DEFAULT 'A'
);


INSERT INTO Categoria VALUES
(1, 'carnes','D');

SELECT *FROM Categoria;


INSERT INTO Categoria VALUES
(default, 'carnes',Default);

DROP TABLE Categoria

#eliminar la columna email
ALTER TABLE Empleados
DROP COLUMN Email;

ALTER TABLE Departamentos
ADD CONSTRAINT Pk_departamentos
PRIMARY KEY (IdDepartamento);

#eliminar tabla empleados 

DROP TABLE Empleados;
 

DROP TABLE Departamentos;
 
DROP TABLE Categoria;
 

#ELIMINAR LA BASE DE ADTOS 
DROP DATABASE empresaPatito;