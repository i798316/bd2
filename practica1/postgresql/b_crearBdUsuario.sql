drop database if exists practica1;
create database practica1;

drop user if exists practica1;
create user practica1 with encrypted password 'practica1';
grant all privileges on database practica1 to practica1;
