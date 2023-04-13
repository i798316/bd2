#!/bin/bash

#sh a_descargarDatos.sh
echo "a.- Datos descargados"

#mysql -u root -p < b_crearBdUsuario.sql
echo "b.- Base de datos y usuario creados"

#mysql --local-infile -u uPractica1 -p practica1 < c1_importarDatos.sql
echo "c1.- Datos importados"

#mysql -u uPractica1 -p practica1 < c2_procesarDatos.sql
echo "c2.- Datos procesados"

#mysql -u uPractica1 -p practica1 < d_trigger.sql
echo "d.- Trigger creado"

mysql -u root -p practica1 < h_profesor.sql
echo "h.- Usuario profesor creado"
