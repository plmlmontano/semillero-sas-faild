-- creacion de base de datos
CREATE DATABASE semilleros;

-- uso de la base de datos
USE semilleros;

-- marca
CREATE TABLE marca (
  id INT PRIMARY KEY auto_increment NOT NULL,
  descripcion VARCHAR(45) DEFAULT NULL,
  estado BOOLEAN NOT NULL, -- estado de la marca creada
  date_create TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- fecha de creacion del registro
  date_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- fecha de actualizacion del registro
);

DESCRIBE marca;

INSERT INTO marca (descripcion, estado,  date_create, date_update)
VALUES('BMW', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
SELECT * FROM marca;


-- linea
CREATE TABLE linea (
  id INT PRIMARY KEY auto_increment NOT NULL,
  id_marca INT DEFAULT NULL,
  descripcion VARCHAR(45) DEFAULT NULL,
  CONSTRAINT fk_id_marca FOREIGN KEY (id_marca) REFERENCES marca(id),
  estado BOOLEAN NOT NULL, -- estado de la linea creada
  date_create TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- fecha de creacion del registro
  date_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- fecha de actualizacion del registro
);

DESCRIBE linea;

INSERT INTO linea (id_marca, descripcion, estado,  date_create, date_update)
VALUES(1, 'Todoterreno', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
SELECT * FROM linea;

-- vehiculo
CREATE TABLE vehiculos (
  nro_placa VARCHAR(7) PRIMARY KEY NOT NULL UNIQUE NOT NULL,
  id_linea INT DEFAULT NULL,
  color VARCHAR(45) DEFAULT NULL,
  modelo ENUM('2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020','2021', '2022', '2023', '2024') NULL,
  fecha_vencimiento_seguro TIMESTAMP NOT NULL,
  fecha_vencimiento_tecnomecanica TIMESTAMP NOT NULL,
  CONSTRAINT fk_id_linea FOREIGN KEY (id_linea) REFERENCES linea(id),
  estado BOOLEAN NOT NULL, -- estado del vehiculo creado
  date_create TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- fecha de creacion del registro
  date_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- fecha de actualizacion del registro
);

DESCRIBE vehiculos;

INSERT INTO vehiculos VALUES 
  ('LMM992', 1, 'Verde', '2002', '2021-04-23 00:00:00', '2021-12-23 00:00:00',	1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
SELECT * FROM vehiculos;





-- Ingreso de data
INSERT INTO marca  (descripcion, estado, date_create, date_update) VALUES
('Renault', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Mazda', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Toyota', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Honda', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO linea (id_marca, descripcion, estado, date_create, date_update) VALUES
(2, 'Descapotable', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'Deportivo', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'Familiar', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(4, 'Compacto', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'Dos puertas', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(5, 'Subcompacto', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(4, 'Matrix', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


-- Consulta de vehiculos con id de marca 
SELECT a.nro_placa, c.descripcion marca, b.descripcion linea, a.color, a.modelo, DATE_FORMAT(a.fecha_vencimiento_seguro, '%d/%m/%Y') 'Fecha de vencimiento seguro', DATE_FORMAT(a.fecha_vencimiento_tecnomecanica, '%d/%m/%Y') 'Fecha de vencimiento tecnomecanica', a.estado 
FROM vehiculos a
LEFT JOIN linea b ON a.id_linea = b.id
LEFT JOIN marca c ON b.id_marca = c.id;

SELECT * FROM marca;

SELECT a.id, b.descripcion Marca, a.descripcion, a.estado
FROM linea a
LEFT JOIN marca b ON a.id_marca = b.id;