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
COMMENT ON DATABASE "Gestor_Ticket_Comedor"
    IS 'Base de datos que almacenará la posición de los comensales del comedor de la universidad';
