-- Trigger que impide borrar datos de las tablas

DROP TRIGGER IF EXISTS impide_borrar_universidad;
CREATE TRIGGER impide_borrar_universidad
BEFORE DELETE ON Universidad
FOR EACH ROW
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No está permitido borrar datos';

DROP TRIGGER IF EXISTS impide_borrar_centro;
CREATE TRIGGER impide_borrar_centro
BEFORE DELETE ON Centro
FOR EACH ROW
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No está permitido borrar datos';

DROP TRIGGER IF EXISTS impide_borrar_titulacion;
CREATE TRIGGER impide_borrar_titulacion
BEFORE DELETE ON Titulacion
FOR EACH ROW
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No está permitido borrar datos';

DROP TRIGGER IF EXISTS impide_borrar_movilidad;
CREATE TRIGGER impide_borrar_movilidad
BEFORE DELETE ON Convenio_Movilidad
FOR EACH ROW
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No está permitido borrar datos';
