-- Crea usuario profesor

DROP USER IF EXISTS profesor;
FLUSH PRIVILEGES;
CREATE USER 'profesor'@'%' IDENTIFIED BY 'profesor';
GRANT SELECT ON practica1.* TO 'profesor'@'%';

FLUSH PRIVILEGES;
