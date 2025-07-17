CREATE DATABASE IncripcionCurso
USE IncripcionCurso;

--CREAR TABLA ESTUDIANTE 
CREATE TABLE Estudiante(
IdEstudiante INT NOT NULL,
APaterno VARCHAR(50) NOT NULL,
AMaterno VARCHAR(50) NOT NULL,
Nombre VARCHAR(50) NOT NULL,
    CONSTRAINT pk_estudiante PRIMARY KEY (IdEstudiante)
);
Go

--CRAR LA TABLA CURSO 
CREATE TABLE Curso(
IdCurso INT NOT NULL,
NombreCurso VARCHAR(20) NOT NULL,
Codigo INT NOT NULL,
    CONSTRAINT pk_curso PRIMARY KEY (IdCurso)
);
Go

--CREAR LA TABLA INSCRIPCION 
CREATE TABLE Inscripcion(
IdInscripcion INT NOT NULL,
IdEstudiante INT NOT NULL,
    IdCurso INT NOT NULL,
	   CONSTRAINT pk_inscripcion PRIMARY KEY (IdInscripcion),

	   CONSTRAINT fk_estudiante 
        FOREIGN KEY (IdEstudiante) 
        REFERENCES Estudiante(IdEstudiante),

		 CONSTRAINT fk_curso 
        FOREIGN KEY (IdCurso) 
        REFERENCES Curso(IdCurso)
);
Go