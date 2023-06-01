create database dbRestaurante;
use dbRestaurante;
create table Pedido 
(
IDPED int AUTO_INCREMENT,
USERPED varchar (80),
EMAUSPED varchar (80),
CELUSPED char(9),
FOODPED varchar (80),
MSGPED varchar (250),
PRIMARY KEY (IDPED)
);

INSERT INTO PEDIDO
(USERPED, EMAUSPED, CELUSPED, FOODPED, MSGPED)
VALUES
('Jose Ramirez','jose.ramirez@outlook.com','974815236','Arroz con pollo', 'Por favor enviar a la direcciòn Av. Miraflores 253, San Vicente de Cañete'),
('Ana Guerra Solano','ana.guerra@gmail.com','981526321','Sopa seca de gallina','Necesito 4 platos');
select * from Pedido;
