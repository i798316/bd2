-- Crea base de datos y usuario

DROP DATABASE IF EXISTS practica1;
CREATE DATABASE practica1;

DROP USER IF EXISTS uPractica1;
FLUSH PRIVILEGES;
CREATE USER 'uPractica1'@'%' IDENTIFIED BY 'practica1';
GRANT ALL PRIVILEGES ON practica1.* TO 'uPractica1'@'%';

FLUSH PRIVILEGES;
