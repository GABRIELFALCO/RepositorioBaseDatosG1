#CREAR LA BASE DE DATOS COMPANY
CREATE DATABASE Company
USE Company;
#CREAR LA TABLA DEPARTAMENTO 
CREATE TABLE DEPARTAMENT(
	DepartmentId INT auto_increment NOT NULL,
    DeptNumber INT NOT NULL,
    DeptName NVARCHAR(25) NOT NULL,
    ManagerId INT NULL,
    StartDate DATE NOT NULL,

	CONSTRAINT PK_Department 
        PRIMARY KEY (DepartmentId),

    CONSTRAINT unique_deptNumber 
        UNIQUE (DeptNumber),
        
    CONSTRAINT unique_deptName 
        UNIQUE (DeptName)
);

#CREAR LA TABLA EMPLEADO 
CREATE TABLE Employee (
	EmployeeId INT auto_increment NOT NULL,
    FirstName NVARCHAR(25) NOT NULL,
    LastName NVARCHAR(25) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    BirthDate DATE NOT NULL,
    Address NVARCHAR(50) NOT NULL,
    DepartmentId INT NOT NULL,
	ManagerId INT NULL

	CONSTRAINT PK_Employee PRIMARY KEY (EmployeeId),
        
    CONSTRAINT FK_Employee_Department FOREIGN KEY (DepartmentId) 
        REFERENCES DEPARTAMENT(DepartmentId),
        
    CONSTRAINT FK_Employee_Manager FOREIGN KEY (ManagerId) 
        REFERENCES Employee(EmployeeId),
        
    CONSTRAINT CK_Salary_Positive 
        CHECK (Salary > 0.0)
);
ALTER TABLE DEPARTAMENT
ADD CONSTRAINT FK_Department_Manager 
    FOREIGN KEY (ManagerId) 
    REFERENCES Employee(EmployeeId)
    ON DELETE SET NULL;


	#CREAR LA TABLA LOCACION 
	CREATE TABLE Location(
	LocationId INT auto_increment NOT NULL,
    LocationName NVARCHAR(25) NOT NULL,
    DepartmentId INT NOT NULL,
    
    CONSTRAINT PK_Location 
        PRIMARY KEY (LocationId),
        
    CONSTRAINT FK_Location_Department 
        FOREIGN KEY (DepartmentId) 
        REFERENCES DEPARTAMENT(DepartmentId)
	);
	#CREAR TABLA DEPENDENT 
	CREATE TABLE Dependent (
	DependentId INT auto_increment NOT NULL,
    EmployeeId INT NOT NULL,
    FullName NVARCHAR(25) NOT NULL,
    Gender NVARCHAR(10) NOT NULL,
    BirthDate DATE NOT NULL,
    Relationship NVARCHAR(25) NOT NULL,
    
    CONSTRAINT PK_Dependent 
        PRIMARY KEY (DependentId),
        
    CONSTRAINT FK_Dependent_Employee FOREIGN KEY (EmployeeId) 
        REFERENCES Employee(EmployeeId)
	);

	#CREAR LA TABLA PROJECT
	CREATE TABLE Project (
    ProjectId INT auto_increment NOT NULL,
    ProjectNumber INT NOT NULL,
    ProjectName NVARCHAR(25) NOT NULL,
    LocationId INT NOT NULL,
    DepartmentId INT NOT NULL,
    
    CONSTRAINT PK_Project 
        PRIMARY KEY (ProjectId),
        
    CONSTRAINT UQ_ProjectNumber 
        UNIQUE (ProjectNumber),
        
    CONSTRAINT FK_Project_Location 
        FOREIGN KEY (LocationId) 
        REFERENCES Location(LocationId),
        
    CONSTRAINT FK_Project_Department 
        FOREIGN KEY (DepartmentId) 
        REFERENCES DEPARTAMENT(DepartmentId)
);

#CREAR TABLA WORKSON
CREATE TABLE WorksOn (
    EmployeeId INT NOT NULL,
    ProjectId INT NOT NULL,
    HoursWorked INT NOT NULL,
    
    CONSTRAINT PK_WorksOn 
        PRIMARY KEY (EmployeeId, ProjectId),
        
    CONSTRAINT FK_WorksOn_Employee 
        FOREIGN KEY (EmployeeId) 
        REFERENCES Employee(EmployeeId)
        ON DELETE CASCADE,
        
    CONSTRAINT FK_WorksOn_Project 
        FOREIGN KEY (ProjectId) 
        REFERENCES Project(ProjectId)
        ON DELETE CASCADE,
        
    CONSTRAINT CK_Valid_Hours 
        CHECK (HoursWorked > 0 AND HoursWorked <= 80)
);