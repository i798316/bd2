#!/bin/bash

# Contraseña postgres: bases
# Contraseña uPractica1: practica1
# Contraseña profesor: profesor

#sh a_descargarDatos.sh
echo "a.- Datos descargados"

#psql -U postgres -f b_crearBdUsuario.sql
echo "b.- Base de datos y usuario creados"

#psql -U postgres -d practica1 -f c1_importarDatos.sql
echo "c1.- Datos importados"

#psql -U postgres -d practica1 -f c2_procesarDatos.sql
echo "c2.- Datos procesados"

#psql -U postgres -d practica1 -f d_trigger.sql
echo "d.- Trigger creado"

sudo -i -u postgres psql -U uPractica1 -d practica1 -f e_estudiosMayorOcupacion.sql
echo "e.- Consulta sobre estudio con mayor ocupación terminada"

psql -U postgres -d practica1 -f f_universidad.sql
echo "f.- Consulta sobre la universidad que más alumnos recibe terminada"

psql -U postgres -d practica1 -f g_vista.sql
echo "g.- Vista creada"

psql -U postgres  -d practica1 -f h_profesor.sql
echo "h.- Usuario profesor creado"

psql -U postgres -d practica1 -f borrarTablasAux.sql
echo "Tablas auxiliares borradas"
