#!/bin/bash

sh a_descargarDatos.sh
echo "a.- Datos descargados"

mysql -u root -p < b_crearBdUsuario.sql
echo "b.- Base de datos y usuario creados"

mysql --local-infile -u root -p practica1 < c1_importarDatos.sql
echo "c1.- Datos importados"

mysql -u uPractica1 -p practica1 < c2_procesarDatos.sql
echo "c2.- Datos procesados"

mysql -u uPractica1 -p practica1 < d_trigger.sql
echo "d.- Trigger creado"

mysql -u uPractica1 -p practica1 < e_estudiosMayorOcupacion.sql
echo "e.- Consulta sobre estudio con mayor ocupación terminada"

mysql -u uPractica1 -p practica1 < f_universidad.sql
echo "f.- Consulta sobre la universidad que más alumnos recibe terminada"

mysql -u uPractica1 -p practica1 < g_vista.sql
echo "g.- Vista creada"

mysql -u root -p practica1 < h_profesor.sql
echo "h.- Usuario profesor creado"

mysql -u uPractica1 -p practica1 < borrarTablasAux.sql
echo "Tablas auxiliares borradas"
