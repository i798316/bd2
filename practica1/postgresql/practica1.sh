#!/bin/bash

sh a_descargarDatos.sh
echo Datos descargados

psql -U postgres -f b_crearBdUsuario.sql
echo Base de datos y usuario creados

