-- Database: Gestor_Ticket_Comedor

-- DROP DATABASE IF EXISTS "Gestor_Ticket_Comedor";

CREATE DATABASE "Gestor_Ticket_Comedor"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Peru.1252'
    LC_CTYPE = 'Spanish_Peru.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE "Gestor_Ticket_Comedor"
    IS 'base de datos que almacenará la posición de los comensales del comedor de la universidad';
    