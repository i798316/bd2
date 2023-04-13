-- Creación del usuario y base de datos
drop database if exists practica1;

REASSIGN OWNED by uPractica1 to postgres;
drop owned by uPractica1;
drop user if exists uPractica1;

create user uPractica1;
alter user uPractica1 with password 'practica';

create database practica1 owner uPractica1;

-- Concesión de permisos al usuario sobre la base de datos
grant all privileges on database practica1 to uPractica1;
grant all privileges on all tables in schema public to uPractica1;
grant all privileges on all sequences in schema public to uPractica1;
