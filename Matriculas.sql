DROP DATABASE IF EXISTS Matricula;
CREATE DATABASE matricula
DEFAULT CHARACTER SET utf8;

-- Table: Alumno
CREATE TABLE Alumno (
    id int  NOT NULL COMMENT 'identificador de alumno',
    DNI char(8)  NOT NULL COMMENT 'Documento de identidad',
    Nombre varchar(80)  NOT NULL COMMENT 'Nombre del alumno',
    Apellido varchar(15)  NOT NULL COMMENT 'nombre del apellido',
    Fecha_Nacimiento date  NOT NULL COMMENT 'fecha de nacimiento',
    Sexo varchar(10)  NOT NULL COMMENT 'sexo del estudiante',
    Apoderado_id int  NOT NULL COMMENT 'apoderado del alumno',
    Matricula_id int  NOT NULL COMMENT 'Numero de la matricula del alumno',
    CONSTRAINT Alumno_pk PRIMARY KEY (id)
) COMMENT 'Datos del Alumno';

-- Table: Apoderado
CREATE TABLE Apoderado (
    id int  NOT NULL COMMENT 'identificador del apoderado',
    dni char(8)  NOT NULL COMMENT 'documento de identidad',
    Nombre varchar(50)  NOT NULL COMMENT 'Nombre del apoderado',
    Apellido varchar(60)  NOT NULL COMMENT 'Apellido del apoderado',
    Direccion int  NOT NULL COMMENT 'Direccion del apoderado',
    Telefono char(9)  NOT NULL COMMENT 'Telofono del apoderado',
    Email char(40)  NOT NULL COMMENT 'Email del apoderado',
    Parentezco varchar(20)  NOT NULL COMMENT 'Parentezco del alumno - apoderado',
    CONSTRAINT Apoderado_pk PRIMARY KEY (id)
) COMMENT 'Datos del Apoderado';

-- Table: Curso
CREATE TABLE Curso (
    id int  NOT NULL COMMENT 'identificador de curso',
    Nombre varchar(50)  NOT NULL COMMENT 'nombre del curso',
    Descripcion varchar(30)  NOT NULL COMMENT 'descripcion del curso',
    Docente_id int  NOT NULL COMMENT 'Identificador del docente',
    Grado_id int  NOT NULL COMMENT 'identificador del grado',
    CONSTRAINT Curso_pk PRIMARY KEY (id)
) COMMENT 'Datos De Curso';

-- Table: Docente
CREATE TABLE Docente (
    id int  NOT NULL COMMENT 'identificador del docente',
    DNI char(8)  NOT NULL COMMENT 'Documento de identidad',
    Nombre varchar(50)  NOT NULL COMMENT 'Nombre del docente',
    Apellido varchar(60)  NOT NULL COMMENT 'Apellido del docente',
    Direccion varchar(30)  NOT NULL COMMENT 'Direccion del docente',
    Telefono char(9)  NOT NULL COMMENT 'Telefono del docente',
    Email char(40)  NOT NULL COMMENT 'Correo electronico del docente',
    Curso varchar(30)  NOT NULL COMMENT 'Curso del docente',
    CONSTRAINT Docente_pk PRIMARY KEY (id)
) COMMENT 'Datos De Docente';

-- Table: Grado
CREATE TABLE Grado (
    id int  NOT NULL COMMENT 'identificador del grado',
    Seccion varchar(25)  NOT NULL COMMENT 'Seccion del grado del estudiante',
    Matricula_id int  NOT NULL COMMENT 'Identificador de matricula',
    CONSTRAINT Grado_pk PRIMARY KEY (id)
) COMMENT 'Datos De Grado';

-- Table: Matricula
CREATE TABLE Matricula (
    id int  NOT NULL COMMENT 'identificador de matricula
',
    Grado varchar(45)  NOT NULL COMMENT 'la matricula tiene un grado especifico para el alumno',
    Seccion varchar(30)  NOT NULL COMMENT 'la matricula tiene una seccion especifica',
    fecha_matricula date  NOT NULL COMMENT 'fecha de la inscripcion en la matricula',
    CONSTRAINT Matricula_pk PRIMARY KEY (id)
) COMMENT 'Datos De Matricula';

-- Table: Notas
CREATE TABLE Notas (
    id int  NOT NULL COMMENT 'identificador de notas',
    Curso varchar(30)  NOT NULL COMMENT 'notas del curso',
    Descripcion varchar(30)  NOT NULL COMMENT 'Descripcion de la nota',
    Curso_id int  NOT NULL COMMENT 'identificador de curso',
    Alumno_id int  NOT NULL COMMENT 'identificador de alumno',
    CONSTRAINT Notas_pk PRIMARY KEY (id)
) COMMENT 'Datos De Notas';

-- foreign keys
-- Reference: Alumno_Apoderado (table: Alumno)
ALTER TABLE Alumno ADD CONSTRAINT Alumno_Apoderado FOREIGN KEY Alumno_Apoderado (Apoderado_id)
    REFERENCES Apoderado (id);

-- Reference: Alumno_Matricula (table: Alumno)
ALTER TABLE Alumno ADD CONSTRAINT Alumno_Matricula FOREIGN KEY Alumno_Matricula (Matricula_id)
    REFERENCES Matricula (id);

-- Reference: Curso_Docente (table: Curso)
ALTER TABLE Curso ADD CONSTRAINT Curso_Docente FOREIGN KEY Curso_Docente (Docente_id)
    REFERENCES Docente (id);

-- Reference: Curso_Grado (table: Curso)
ALTER TABLE Curso ADD CONSTRAINT Curso_Grado FOREIGN KEY Curso_Grado (Grado_id)
    REFERENCES Grado (id);

-- Reference: Grado_Matricula (table: Grado)
ALTER TABLE Grado ADD CONSTRAINT Grado_Matricula FOREIGN KEY Grado_Matricula (Matricula_id)
    REFERENCES Matricula (id);

-- Reference: Notas_Alumno (table: Notas)
ALTER TABLE Notas ADD CONSTRAINT Notas_Alumno FOREIGN KEY Notas_Alumno (Alumno_id)
    REFERENCES Alumno (id);

-- Reference: Notas_Curso (table: Notas)
ALTER TABLE Notas ADD CONSTRAINT Notas_Curso FOREIGN KEY Notas_Curso (Curso_id)
    REFERENCES Curso (id);

-- End of file.

