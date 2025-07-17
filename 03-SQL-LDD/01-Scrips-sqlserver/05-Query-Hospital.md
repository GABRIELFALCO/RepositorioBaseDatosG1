```SQL
--CREAR BASE DE DATOS HOSPITL 
CREATE DATABASE Hospital;
USE Hospital;

--CREAR LA TABLA DOCTORES
CREATE TABLE Doctores(
    IdDoctor INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    APaterno VARCHAR(50) NOT NULL,
    AMaterno VARCHAR(50) NOT NULL,
    Area VARCHAR(50) NOT NULL,
    
    CONSTRAINT pk_doctor 
        PRIMARY KEY (IdDoctor)
);
Go

--CREAR LA TABLA PACIENTES
CREATE TABLE Pacientes(
	IdPacientes INT IDENTITY(1,1) NOT NULL,
    APaterno VARCHAR(50) NOT NULL,
    AMaterno VARCHAR(50) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    
    CONSTRAINT pk_pacientes 
        PRIMARY KEY (IdPacientes)
);
Go

-- CREAR LA TABLA ATENCION
CREATE TABLE Atencion(
	IdAtencion INT IDENTITY(1,1) NOT NULL,
	IdDoctor INT NOT NULL,
	IdPacientes INT NOT NULL,
	Fecha DATE,
	Diagnostigo VARCHAR(100),
  
    CONSTRAINT pk_atencion  PRIMARY KEY (IdAtencion),

	CONSTRAINT fk_medico_atencion FOREIGN KEY (IdDoctor) 
        REFERENCES Doctores(IdDoctor),

	CONSTRAINT fk_pacinete_atencion 
        FOREIGN KEY (IdPacientes) 
        REFERENCES Pacientes(IdPacientes)
);
Go
```