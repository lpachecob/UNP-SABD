-- Database: Gestor_Ticket_Comedor
-- DROP DATABASE IF EXISTS "Gestor_Ticket_Comedor";

CREATE DATABASE GESTOR_TICKET_COMEDOR;

COMMENT ON DATABASE Gestor_Ticket_Comedor
    IS 'BD que almacenará la posición de los comensales del comedor de la universidad';

--CREACIÓN DE TABLAS PARA BASE DE DATOS
CREATE TYPE sexo AS ENUM('H', 'M');
CREATE TYPE tipo AS ENUM('activo', 'inactivo', 'suspendido');
CREATE TABLE Sistema_UNP(
	cod_unp CHAR(10) NOT NULL PRIMARY KEY,
	dni CHAR(8) NOT NULL UNIQUE,
	apellido_paterno VARCHAR(20) NOT NULL,
	apellido_materno VARCHAR(20) NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	sexo sexo NOT NULL, --M/F
	carrera_unp VARCHAR(20) NOT NULL,
	ciclo_unp CHAR(2) NOT NULL, --1/2/3.../10
	estado_alumno tipo NOT NULL --activo/inactivo/suspendido
);

CREATE TYPE tipo_beca AS ENUM('beca completa', 'media beca', 'sin beca');
CREATE TABLE Estado_Beca(
	cod_unp CHAR(10) NOT NULL,
	tipo_beca tipo_beca NOT NULL, --beca completa/media beca/sin beca
	deuda FLOAT NOT NULL,
	FOREIGN KEY (cod_unp) REFERENCES Sistema_UNP(cod_unp)
);

CREATE TYPE tipo_usuario AS ENUM('alumno', 'profesor', 'administrativo');
CREATE TABLE Usuario(
	cod_usuario CHAR(11) NOT NULL PRIMARY KEY,
	tipo_usuario tipo_usuario NOT NULL --alumno/profesor/administrativo
);

CREATE TABLE Sistema_App(
	cod_unp CHAR(10) NOT NULL UNIQUE PRIMARY KEY,
	contraseña VARCHAR(30) NOT NULL
);

CREATE TYPE tipo_QR AS ENUM('activo', 'inactivo', 'escaneado');
CREATE TABLE Codigo_QR(
	cod_unp CHAR(10) NOT NULL,
	cod_QR VARCHAR(100) NOT NULL,
	position INT NOT NULL, --Posición en la cola
	tipo_QR tipo_QR NOT NULL, --Valor por defecto ACTIVO. activo/inactivo/escaneado
	FOREIGN KEY (cod_unp) REFERENCES Sistema_App(cod_unp)
);

CREATE TYPE tipo_comida AS ENUM('desayuno', 'almuerzo', 'cena');
CREATE TABLE Horario(
	hora_inicio TIME NOT NULL, --hora inicio de la comida
	hora_fin TIME NOT NULL, --hora fin de la comida
	tipo_comida VARCHAR (8) --tipo de comida. desayuno/almuerzo/cena
);

CREATE TABLE Dato(
	dia varchar(12) NOT NULL,
	tipo_comida varchar(10) NOT NULL,
	plato_total INT NOT NULL,
	plato_restante INT NOT NULL,
	menu VARCHAR (200) NOT NULL
);

--INSERCIÓN DE DATOS
INSERT INTO Sistema_UNP
VALUES 
	('0512019144', '75310015', 'Olivares', 'Carrasco', 'Bryan','M','Ing. Informatica', '8', 'activo'),
	('0512019142', '75310012', 'Madrid', 'Reyes', 'Kevin','Jesús', 'Ing. Informatica', '8', 'activo'),
	('0512019143', '75310013', 'Pacheco', 'Brophy', 'Luis','Ernesto', 'Ing. Informatica', '8', 'activo'),
	('0512019146', '75310016', 'Aponte', 'Abarca', 'Pierina','Reneé', 'Ing. Informatica', '8', 'activo'),
	('0512019147', '75310017', 'Nanquén', 'Tello', 'Ruth','Carolina', 'Ing. Informatica', '8', 'activo');
	
SELECT * FROM Sistema_UNP

INSERT INTO Horario
VALUES	
	('6:50', '9:00', 'Desayuno'),
	('11:50', '14:00', 'Almuerzo'),
	('16:50', '19:00', 'Cena');

SELECT * FROM Horario

INSERT INTO Estado_Beca 
VALUES	
	('0512019144', 'beca completa', 100),
	('0512019146', 'media beca', 5000),
	('0512019147', 'sin beca', 400);

SELECT * FROM Estado_Beca

INSERT INTO Dato
VALUES	
	('Lunes', 'Desayuno', 500, 500, 'Café con tamal'),
	('Lunes', 'Almuerzo', 500, 500, 'Ají de gallina'),
	('Lunes', 'Cena', 500, 500, 'Chaufa'),

	('Martes', 'Desayuno', 500, 500, 'Leche con avena'),
	('Martes', 'Almuerzo', 500, 500, 'Arroz con pollo'),
	('Martes', 'Cena', 500, 500, 'Arroz con pollo y mazamorra de piña'),

	('Miercoles', 'Desayuno', 500, 500, 'Cafe con tamal'),
	('Miercoles',' Almuerzo', 500, 500, 'Aji de gallina'),
	('Miercoles', 'Cena', 500, 500, 'Chaufa'),

	('Jueves', 'Desayuno', 500, 500, 'Cafe con tamal'),
	('Jueves', 'Almuerzo', 500, 500, 'Aji de gallina'),
	('Jueves', 'Cena', 500, 500, 'Chaufa'),

	('Viernes', 'Desayuno', 500, 500, 'Cafe con tamal'),
	('Viernes', 'Almuerzo', 500, 500, 'Aji de gallina'),
	('Viernes', 'Cena', 500, 500, 'Chaufa');
	
SELECT * FROM Dato