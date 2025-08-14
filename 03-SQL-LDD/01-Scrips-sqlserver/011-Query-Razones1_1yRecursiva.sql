--CREAR BASE DE DATOS 
CREATE DATABASE ejercicio
GO
USE ejercicio;
GO

--CREAR LA TABLA EMPLEADO 
CREATE TABLE Empleado(
EmpleadoId INT NOT NULL IDENTITY(1,1),
Nombre NVARCHAR(20) NOT NULL,
Apellido1 NVARCHAR(20) NOT NULL,
Apellido2 NVARCHAR(20),
Direccion NVARCHAR(50) NOT NULL,
Salario DECIMAL(10,2) NOT NULL,
jef INT,
Departamento INT NOT NULL,
CONSTRAINT PK_Empleado
PRIMARY KEY (EmpleadoId),

CONSTRAINT chk_ssalario
CHECK (Salario BETWEEN 200 AND 50000),

CONSTRAINT FK_Empleado_Jefe
FOREIGN KEY (jef)
REFERENCES Empleado(EmpleadoId)
ON DELETE NO ACTION 
ON UPDATE NO ACTION 
);
GO

--CREAR LA TABLA DEPARTAMENTO 
CREATE TABLE Departamento (
DeparpartamentoId INT NOT NULL IDENTITY(1,1),
NombreDepto NVARCHAR(20) NOT NULL,
Estatus CHAR(2) NOT NULL,
Administrador INT NOT NULL,

CONSTRAINT pk_depto
PRIMARY KEY (DeparpartamentoId),

CONSTRAINT unique_nombredepto
UNIQUE(NombreDepto),

CONSTRAINt chk_estatus
CHECK (Estatus IN('Si','NO')),

CONSTRAINT fk_empleado_depto
FOREIGN KEY (Administrador)
REFERENCES Empleado(EmpleadoId)
);
Go

ALTER TABLE Empleado
ADD CONSTRAINT FK_empleado_depto1
FOREIGN KEY(Departamento)
REFERENCES Departamento(DeparpartamentoId);
GO

CREATE TABLE Ubicacion(
UbicacionId INT NOT NULL IDENTITY(1,1),
Ubicacion NVARCHAR(20) NOT NULL,
DeptoId INT NOT NULL,

CONSTRAINT PK_Ubicacion 
PRIMARY KEY (UbicacionId),

CONSTRAINT unique_deptiid
UNIQUE(DeptoId),

CONSTRAINT FK_ubicacion_depto
FOREIGN KEY(DeptoId)
REFERENCES Departamento(DeparpartamentoId)
);
Go