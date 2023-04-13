-- Importa los datos de los archivos csv introduciéndolos en tablas

SET GLOBAL local_infile=1;

-- Tabla Oferta
DROP TABLE IF EXISTS Oferta;
CREATE TABLE Oferta (CURSO_ACADEMICO integer, ESTUDIO varchar(200), LOCALIDAD varchar(200),
	CENTRO varchar(200), TIPO_CENTRO varchar(200), TIPO_ESTUDIO varchar(200),
	PLAZAS_OFERTADAS integer, PLAZAS_MATRICULADAS integer, PLAZAS_SOLICITADAS integer,
	INDICE_OCUPACION decimal(5,2), FECHA_ACTUALIZACION varchar(200));
	
LOAD DATA LOCAL INFILE '/home/bowy/uni/bd2/repositorio/bd2/practica1/mysql/Datos/Oferta2019.csv'
INTO TABLE Oferta FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 ROWS;
	
LOAD DATA LOCAL INFILE '/home/bowy/uni/bd2/repositorio/bd2/practica1/mysql/Datos/Oferta2020.csv'
INTO TABLE Oferta FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/home/bowy/uni/bd2/repositorio/bd2/practica1/mysql/Datos/Oferta2021.csv'
INTO TABLE Oferta FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Tabla Resultados
DROP TABLE IF EXISTS Resultados;
CREATE TABLE Resultados (CURSO_ACADEMICO integer, CENTRO varchar(200), ESTUDIO varchar(200),
	TIPO_ESTUDIO varchar(200), ALUMNOS_MATRICULADOS integer, ALUMNOS_NUEVO_INGRESO integer, 
	PLAZAS_OFERTADAS integer, ALUMNOS_GRADUADOS integer, ALUMNOS_ADAPTA_GRADO_MATRI integer,
	ALUMNOS_ADAPTA_GRADO_MATRI_NI integer, ALUMNOS_ADAPTA_GRADO_TITULADO integer,
	ALUMNOS_CON_RECONOCIMIENTO integer, ALUMNOS_MOVILIDAD_ENTRADA integer,
	ALUMNOS_MOVILIDAD_SALIDA integer, CREDITOS_MATRICULADOS decimal(7,2),
	CREDITOS_RECONOCIDOS decimal(7,2), DURACION_MEDIA_GRADUADOS decimal(6,2), 
	TASA_EXITO decimal(6,2), TASA_RENDIMIENTO decimal(6,2), TASA_EFICIENCIA decimal(6,2),
	TASA_ABANDONO decimal(6,2), TASA_GRADUACION decimal(6,2),
	FECHA_ACTUALIZACION varchar(200));

LOAD DATA LOCAL INFILE 
'/home/bowy/uni/bd2/repositorio/bd2/practica1/mysql/Datos/Resultados2019.csv' 
INTO TABLE Resultados FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 ROWS;
	
LOAD DATA LOCAL INFILE 
'/home/bowy/uni/bd2/repositorio/bd2/practica1/mysql/Datos/Resultados2020.csv' 
INTO TABLE Resultados FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 
'/home/bowy/uni/bd2/repositorio/bd2/practica1/mysql/Datos/Resultados2021.csv' 
INTO TABLE Resultados FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Tabla Notas
DROP TABLE IF EXISTS Notas;
CREATE TABLE Notas (CURSO_ACADEMICO integer, ESTUDIO varchar(200), LOCALIDAD varchar(200),
	CENTRO varchar(200), PRELA_CONVO_NOTA_DEF decimal(5,3), 
	NOTA_CORTE_DEFINITIVA_JULIO decimal(5,3),
	NOTA_CORTE_DEFINITIVA_SEPTIEMBRE decimal(5,3), FECHA_ACTUALIZACION varchar(200));
	
LOAD DATA LOCAL INFILE '/home/bowy/uni/bd2/repositorio/bd2/practica1/mysql/Datos/Notas2019.csv'
INTO TABLE Oferta FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 ROWS;
	
LOAD DATA LOCAL INFILE '/home/bowy/uni/bd2/repositorio/bd2/practica1/mysql/Datos/Notas2020.csv'
INTO TABLE Oferta FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/home/bowy/uni/bd2/repositorio/bd2/practica1/mysql/Datos/Notas2021.csv'
INTO TABLE Oferta FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Tabla Movilidad
DROP TABLE IF EXISTS Movilidad;
CREATE TABLE Movilidad (CURSO_ACADEMICO integer, NOMBRE_PROGRAMA_MOVILIDAD varchar(200),
	NOMBRE_AREA_ESTUDIOS_MOV varchar(200), CENTRO varchar(200), IN_OUT varchar(200), 
	NOMBRE_IDIOMA_NIVEL_MOVILIDAD varchar(200), PAIS_UNIVERSIDAD_ACUERDO varchar(200),
	UNIVERSIDAD_ACUERDO varchar(200), PLAZAS_OFERTADAS_ALUMNOS integer,
	PLAZAS_ASIGNADAS_ALUMNOS_OUT integer, FECHA_ACTUALIZACION varchar(200));
	
LOAD DATA LOCAL INFILE 
'/home/bowy/uni/bd2/repositorio/bd2/practica1/mysql/Datos/Movilidad2019.csv' 
INTO TABLE Movilidad FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 ROWS;
	
LOAD DATA LOCAL INFILE 
'/home/bowy/uni/bd2/repositorio/bd2/practica1/mysql/Datos/Movilidad2020.csv' 
INTO TABLE Movilidad FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 
'/home/bowy/uni/bd2/repositorio/bd2/practica1/mysql/Datos/Movilidad2021.csv' 
INTO TABLE Movilidad FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Tabla Egresados
DROP TABLE IF EXISTS Egresados;
CREATE TABLE Egresados (CURSO_ACADEMICO integer, LOCALIDAD varchar(200), ESTUDIO varchar(200),
	TIPO_ESTUDIO varchar(200), TIPO_EGRESO varchar(200), SEXO varchar(200),
	ALUMNOS_GRADUADOS integer, ALUMNOS_INTERRUMPEN_ESTUDIOS integer,
	ALUMNOS_INTERRUMPEN_EST_ANO1 integer, ALUMNOS_TRASLADAN_OTRA_UNIV integer,
	DURACION_MEDIA_GRADUADOS decimal(5,2), TASA_EFICIENCIA decimal(5,2),
	FECHA_ACTUALIZACION varchar(200));
	
LOAD DATA LOCAL INFILE 
'/home/bowy/uni/bd2/repositorio/bd2/practica1/mysql/Datos/Egresados2019.csv' 
INTO TABLE Egresados FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 ROWS;
	
LOAD DATA LOCAL INFILE 
'/home/bowy/uni/bd2/repositorio/bd2/practica1/mysql/Datos/Egresados2020.csv' 
INTO TABLE Egresados FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 
'/home/bowy/uni/bd2/repositorio/bd2/practica1/mysql/Datos/Egresados2021.csv' 
INTO TABLE Egresados FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Tabla Rendimiento
DROP TABLE IF EXISTS Rendimiento;
CREATE TABLE Rendimiento (CURSO_ACADEMICO integer, TIPO_ESTUDIO varchar(200), 
	ESTUDIO varchar(200), LOCALIDAD varchar(200), CENTRO varchar(200), 
	ASIGNATURA varchar(200), TIPO_ASIGNATURA varchar(200), CLASE_ASIGNATURA varchar(200),
	TASA_EXITO decimal(5,2), TASA_RENDIMIENTO decimal(5,2), TASA_EVALUACION decimal(5,2),
	ALUMNOS_EVALUADOS integer, ALUMNOS_SUPERADOS integer, ALUMNOS_PRESENTADOS integer,
	MEDIA_CONVOCATORIAS_CONSUMIDAS decimal(5,2), FECHA_ACTUALIZACION varchar(200));
	
LOAD DATA LOCAL INFILE 
'/home/bowy/uni/bd2/repositorio/bd2/practica1/mysql/Datos/Rendimiento2019.csv' 
INTO TABLE Rendimiento FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 ROWS;
	
LOAD DATA LOCAL INFILE 
'/home/bowy/uni/bd2/repositorio/bd2/practica1/mysql/Datos/Rendimiento2020.csv' 
INTO TABLE Rendimiento FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 
'/home/bowy/uni/bd2/repositorio/bd2/practica1/mysql/Datos/Rendimiento2021.csv' 
INTO TABLE Rendimiento FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 ROWS;