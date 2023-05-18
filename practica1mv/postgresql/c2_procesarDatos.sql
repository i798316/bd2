/*
	Crea las tablas necesarias e inserta los datos necesarios desde las tablas usadas para 
	importar estos o manualmente.
	
	Observaciones:
	-	La sintaxis de "estudio" en los ficheros de Resultados es diferente a la de 
		los demás ficheros.
*/

-- Tabla Universidad
drop table if exists Universidad cascade;
create table Universidad (
	id_universidad serial primary key,
	nombre varchar(200) not null
);

insert into Universidad (nombre) values ('Universidad de Zaragoza');

-- Tabla Centro
drop table if exists Centro cascade;
create table Centro (
	id_centro serial primary key,
	id_universidad int,
	nombre varchar(200) not null,
	localidad varchar(200) not null,
	constraint fk_universidad
	 foreign key(id_universidad)
	  references Universidad(id_universidad)
);

insert into Centro (id_universidad, nombre, localidad)
 select distinct Universidad.id_universidad, Rendimiento.centro, Rendimiento.localidad
  from Universidad, Rendimiento;

-- Tabla Titulación
drop table if exists Titulacion;
create table Titulacion (
	id_titulacion serial primary key,
	id_centro int,
	nombre varchar(200) not null,
	curso_academico varchar(200) not null,
	nota_corte decimal(5,3),
	plazas_ofertadas int,
	tasa_exito decimal(6,2),
	tasa_graduacion decimal(6,2),
	tasa_rendimiento decimal(6,2),
	tasa_eficiencia decimal(6,2),
	alumnos_matriculados int,
	alumnos_nuevo_ingreso int,
	alumnos_graduados int,
	alumnos_con_reconocimiento int,
	abandonos int,
	indice_ocupacion decimal(5,2),
	constraint fk_centro_titulacion
	 foreign key(id_centro)
	  references Centro(id_centro)
);

insert into Titulacion (id_centro, nombre, curso_academico, nota_corte, plazas_ofertadas,
	tasa_exito, tasa_graduacion, tasa_rendimiento, tasa_eficiencia, alumnos_matriculados,
	alumnos_nuevo_ingreso, alumnos_graduados, alumnos_con_reconocimiento,
	abandonos, indice_ocupacion)
 select Centro.id_centro, Resultados.estudio, Resultados.curso_academico,
 	Notas.nota_corte_definitiva_septiembre, Resultados.plazas_ofertadas,
 	Resultados.tasa_exito, Resultados.tasa_graduacion, Resultados.tasa_rendimiento,
 	Resultados.tasa_eficiencia, Resultados.alumnos_matriculados,
 	Resultados.alumnos_nuevo_ingreso, Resultados.alumnos_graduados, 
 	Resultados.alumnos_con_reconocimiento, Egresados.alumnos_interrumpen_estudios,
 	Oferta.indice_ocupacion
  from Centro, Resultados, Notas, Egresados, Oferta
   where Centro.nombre = Resultados.centro and Resultados.tipo_estudio = 'Grado' --and
   	--Resultados.estudio = Notas.estudio 
   	and Resultados.curso_academico = Notas.curso_academico
   	and Centro.nombre = Notas.centro and --Resultados.estudio = Egresados.estudio and 
   	Resultados.curso_academico = Egresados.curso_academico and 
   	Egresados.tipo_estudio = 'Grado' and Oferta.tipo_estudio = 'Grado'
   	and Resultados.curso_academico = Oferta.curso_academico and Centro.nombre = Oferta.centro
   	and Notas.estudio = Egresados.estudio and Egresados.estudio = Oferta.estudio;
   	
/* Abandonos voluntarios
insert into Titulacion (abandonos_voluntarios)
 select total
  from (select sum(Egresados.alumnos_interrumpen_estudios) as total
  	from Egresados
  	group by 
*/

-- Tabla Convenio de Movilidad
drop table if exists Convenio_Movilidad;
create table Convenio_Movilidad (
	id_convenio serial primary key,
	id_centro int,
	curso_academico int not null,
	nombre_programa_movilidad varchar(200) not null,
	nombre_area_estudios_mov varchar(200) not null,
	in_out varchar(200) not null,
	nombre_idioma_nivel_movilidad varchar(200),
	pais_universidad_acuerdo varchar(200),
	plazas_ofertadas_alumnos int not null,
	universidad_acuerdo varchar(200) not null,
	plazas_asignadas_alumnos_out int,
	constraint fk_centro_movilidad
	 foreign key(id_centro)
	  references Centro(id_centro)
);

insert into Convenio_Movilidad (id_centro, curso_academico, nombre_programa_movilidad,
	nombre_area_estudios_mov, in_out, nombre_idioma_nivel_movilidad,
	pais_universidad_acuerdo, plazas_ofertadas_alumnos, universidad_acuerdo,
	plazas_asignadas_alumnos_out)
 select Centro.id_centro, Movilidad.curso_academico, Movilidad.nombre_programa_movilidad,
 	Movilidad.nombre_area_estudios_mov, Movilidad.in_out,
 	Movilidad.nombre_idioma_nivel_movilidad,Movilidad.pais_universidad_acuerdo,
 	Movilidad.plazas_ofertadas_alumnos, Movilidad.universidad_acuerdo,
 	Movilidad.plazas_asignadas_alumnos_out
  from Centro, Movilidad
   where Centro.nombre = Movilidad.centro
