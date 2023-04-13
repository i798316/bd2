-- Crea usuario profesor

REASSIGN OWNED by profesor to postgres;
--REVOKE ALL ON practica1 FROM profesor;
drop owned by profesor;

DROP USER IF EXISTS profesor;
CREATE USER profesor WITH PASSWORD 'profesor';

GRANT CONNECT ON DATABASE practica1 TO profesor;
GRANT USAGE ON SCHEMA public TO profesor;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO profesor;
