/*
	Crea las tablas necesarias e inserta los datos necesarios desde las tablas usadas para
	importar estos, o manualmente.
*/

-- Tabla Universidad
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS Universidad CASCADE;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE Universidad (
	id_universidad INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(200) NOT NULL
);

INSERT INTO Universidad (nombre) VALUES ('Universidad de Zaragoza');

-- Tabla Centro
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS Centro CASCADE;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE Centro (
	id_centro INT AUTO_INCREMENT PRIMARY KEY,
	id_universidad INT,
	nombre VARCHAR(200) NOT NULL,
	localidad VARCHAR(200) NOT NULL,
	CONSTRAINT fk_universidad
	 FOREIGN KEY(id_universidad)
	  REFERENCES Universidad(id_universidad)
);

INSERT INTO Centro (id_universidad, nombre, localidad)
 SELECT DISTINCT Universidad.id_universidad, Rendimiento.centro, Rendimiento.localidad
  FROM Universidad, Rendimiento;
  
-- Tabla Titulación
DROP TABLE IF EXISTS Titulacion;
CREATE TABLE Titulacion (
	id_titulacion INT AUTO_INCREMENT PRIMARY KEY,
	id_centro INT,
	nombre VARCHAR(200) NOT NULL,
	curso_academico VARCHAR(200) NOT NULL,
	nota_corte DECIMAL(5,3),
	plazas_ofertadas INT,
	tasa_exito DECIMAL(6,2),
	tasa_graduacion DECIMAL(6,2),
	tasa_rendimiento DECIMAL(6,2),
	tasa_eficiencia DECIMAL(6,2),
	alumnos_matriculados INT,
	alumnos_nuevo_ingreso INT,
	alumnos_graduados INT,
	alumnos_con_reconocimiento INT,
	abandonos INT,
	CONSTRAINT fk_centro_titulacion
	 FOREIGN KEY(id_centro)
	  REFERENCES Centro(id_centro)
);

INSERT INTO Titulacion (id_centro, nombre, curso_academico, nota_corte, plazas_ofertadas,
	tasa_exito, tasa_graduacion, tasa_rendimiento, tasa_eficiencia, alumnos_matriculados,
	alumnos_nuevo_ingreso, alumnos_graduados, alumnos_con_reconocimiento,
	abandonos)
 SELECT Centro.id_centro, Resultados.estudio, Resultados.curso_academico,
 	Notas.nota_corte_definitiva_septiembre, Resultados.plazas_ofertadas,
 	Resultados.tasa_exito, Resultados.tasa_graduacion, Resultados.tasa_rendimiento,
 	Resultados.tasa_eficiencia, Resultados.alumnos_matriculados,
 	Resultados.alumnos_nuevo_ingreso, Resultados.alumnos_graduados, 
 	Resultados.alumnos_con_reconocimiento, Egresados.alumnos_interrumpen_estudios
  FROM Centro, Resultados, Notas, Egresados
   WHERE Centro.nombre = Resultados.centro AND Resultados.tipo_estudio = 'Grado' -- AND
   	-- Resultados.estudio = Notas.estudio 
   	AND Resultados.curso_academico = Notas.curso_academico
   	AND Centro.nombre = Notas.centro AND -- Resultados.estudio = Egresados.estudio AND 
   	Resultados.curso_academico = Egresados.curso_academico AND 
   	Egresados.tipo_estudio = 'Grado';
   	
-- Tabla Convenio de Movilidad
DROP TABLE IF EXISTS Convenio_Movilidad;
CREATE TABLE Convenio_Movilidad (
	id_convenio INT AUTO_INCREMENT PRIMARY KEY,
	id_centro INT,
	curso_academico INT not null,
	nombre_programa_movilidad VARCHAR(200) NOT NULL,
	nombre_area_estudios_mov VARCHAR(200) NOT NULL,
	in_out VARCHAR(200) NOT NULL,
	nombre_idioma_nivel_movilidad VARCHAR(200),
	pais_universidad_acuerdo VARCHAR(200),
	plazas_ofertadas_alumnos INT not null,
	universidad_acuerdo VARCHAR(200) NOT NULL,
	plazas_asignadas_alumnos_out INT,
	CONSTRAINT fk_centro_movilidad
	 FOREIGN KEY(id_centro)
	  REFERENCES Centro(id_centro)
);

INSERT INTO Convenio_Movilidad (id_centro, curso_academico, nombre_programa_movilidad,
	nombre_area_estudios_mov, in_out, nombre_idioma_nivel_movilidad,
	pais_universidad_acuerdo, plazas_ofertadas_alumnos, universidad_acuerdo,
	plazas_asignadas_alumnos_out)
 SELECT Centro.id_centro, Movilidad.curso_academico, Movilidad.nombre_programa_movilidad,
 	Movilidad.nombre_area_estudios_mov, Movilidad.in_out,
 	Movilidad.nombre_idioma_nivel_movilidad,Movilidad.pais_universidad_acuerdo,
 	Movilidad.plazas_ofertadas_alumnos, Movilidad.universidad_acuerdo,
 	Movilidad.plazas_asignadas_alumnos_out
  FROM Centro, Movilidad
   WHERE Centro.nombre = Movilidad.centro
