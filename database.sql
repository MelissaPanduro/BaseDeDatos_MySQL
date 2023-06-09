CREATE DATABASE Matriculas
DEFAULT CHARACTER SET utf8;

use Matriculas;

CREATE TABLE Registros
(
    id int auto_increment,
    Nombres varchar(30),
    Apellidos varchar(40),
    Dni char(8),
	Celular char(9),
    Email varchar(30),
    activo bool default '1',
    CONSTRAINT registros_pk PRIMARY KEY (id)
);
select * from Registros;
