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



/*
CREATE OR REPLACE FUNCTION impideBorrar()
RETURNS TRIGGER AS $trigger_practica1_mysql$
BEGIN
	RAISE_APPLICATION_ERROR(-20001,'No está permitido borrar datos de las tablas');
	
END;

	$trigger_practica1_mysql$ LANGUAGE plpgsql;
	
-- Universidad
DROP TRIGGER IF EXISTS impide_borrar_universidad ON Universidad;
CREATE TRIGGER impide_borrar_universidad BEFORE DELETE ON Universidad
FOR EACH ROW EXECUTE FUNCTION impideBorrar();


-- Centro
DROP TRIGGER IF EXISTS impide_borrar_centro ON Centro;
CREATE TRIGGER impide_borrar_centro BEFORE DELETE ON Centro
FOR EACH ROW EXECUTE FUNCTION impideBorrar();

-- Titulación
DROP TRIGGER IF EXISTS impide_borrar_titulacion ON Titulacion;
CREATE TRIGGER impide_borrar_titulacion BEFORE DELETE ON Titulacion
FOR EACH ROW EXECUTE FUNCTION impideBorrar();

-- Convenio_Movilidad
DROP TRIGGER IF EXISTS impide_borrar_convenio_movilidad ON Convenio_Movilidad;
CREATE TRIGGER impide_borrar_convenio_movilidad BEFORE DELETE ON Convenio_Movilidad
FOR EACH ROW EXECUTE FUNCTION impideBorrar();*/
