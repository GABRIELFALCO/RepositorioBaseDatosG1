```SQL
--CREAR LA BASE DE DATOS EMPRESACHICA
CREATE DATABASE EmpresaChica
USE EmpresaChica;
--CREAR LA TABLE DE DEPARTAMENTO 
CREATE TABLE Departamento(
	DepartamentoId INT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(50) NOT NULL,
    
    CONSTRAINT PK_Departamento 
        PRIMARY KEY (DepartamentoId),
        
    CONSTRAINT UQ_NombreDepartamento 
        UNIQUE (Nombre)

);
Go
--CREAR LA TABLA EMPLEADO 
CREATE TABLE Empleado(
EmpleadoId INT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(30) NOT NULL,
    ApellidoPaterno NVARCHAR(30) NOT NULL,
    ApellidoMaterno NVARCHAR(30) NOT NULL,
    Cargo NVARCHAR(20) NOT NULL,
    Salario DECIMAL(10,2) NOT NULL,
    DepartamentoId INT NOT NULL,

	CONSTRAINT PK_Empleado 
        PRIMARY KEY (EmpleadoId),
        
    CONSTRAINT FK_Empleado_Departamento 
        FOREIGN KEY (DepartamentoId) 
        REFERENCES Departamento(DepartamentoId),
		CONSTRAINT CK_Salario_Positivo 
        CHECK (Salario > 0)
);
Go

--se crea la tabla de telefono 
CREATE TABLE Telefono (
    TelefonoId INT IDENTITY(1,1) NOT NULL,
    Numero NVARCHAR(20) NOT NULL,
    Tipo NVARCHAR(15) NOT NULL,
    EmpleadoId INT NOT NULL,
    
    CONSTRAINT PK_Telefono 
        PRIMARY KEY (TelefonoId),
        
    CONSTRAINT FK_Telefono_Empleado 
        FOREIGN KEY (EmpleadoId) 
        REFERENCES Empleado(EmpleadoId)
        ON DELETE CASCADE,
        
    CONSTRAINT UQ_Numero_Empleado 
        UNIQUE (Numero, EmpleadoId),
		);
		Go
        ```