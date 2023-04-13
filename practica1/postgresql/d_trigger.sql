-- Crea el trigger y la tabla registro para guardar los datos de la operaciones

-- Tabla registro
DROP TABLE IF EXISTS Registro;
CREATE TABLE Registro (
	operacion VARCHAR(200),
	tabla VARCHAR(200),
	usuario VARCHAR(200),
	fecha TIMESTAMP
);

-- Trigger
CREATE OR REPLACE FUNCTION registrarOperacion()
RETURNS TRIGGER AS $trigger_practica1_psql$
BEGIN 
	INSERT INTO Registro (operacion, tabla, usuario, fecha)
	VALUES (TG_OP, TG_TABLE_NAME, user, current_timestamp);
	
	RETURN NEW;
END;

	$trigger_practica1_psql$ LANGUAGE plpgsql;

-- Universidad
DROP TRIGGER IF EXISTS registro_borrado_universidad ON Universidad;
CREATE TRIGGER registro_borrado_universidad AFTER DELETE ON Universidad
FOR EACH ROW EXECUTE FUNCTION registrarOperacion();
	
DROP TRIGGER IF EXISTS registro_actualizacion_universidad ON Universidad;
CREATE TRIGGER registro_actualizacion_universidad AFTER UPDATE ON Universidad
FOR EACH ROW EXECUTE FUNCTION registrarOperacion();

--Centro
DROP TRIGGER IF EXISTS registro_borrado_centro ON Centro;
CREATE TRIGGER registro_borrado_centro AFTER DELETE ON Centro
FOR EACH ROW EXECUTE FUNCTION registrarOperacion();
	
DROP TRIGGER IF EXISTS registro_actualizacion_centro ON Centro;
CREATE TRIGGER registro_actualizacion_centro AFTER UPDATE ON Centro
FOR EACH ROW EXECUTE FUNCTION registrarOperacion();

-- Titulación
DROP TRIGGER IF EXISTS registro_borrado_titulacion ON Titulacion;
CREATE TRIGGER registro_borrado_titulacion AFTER DELETE ON Titulacion
FOR EACH ROW EXECUTE FUNCTION registrarOperacion();

DROP TRIGGER IF EXISTS registro_actualizacion_titulacion ON Titulacion;
CREATE TRIGGER registro_actualizacion_titulacion AFTER UPDATE ON Titulacion
FOR EACH ROW EXECUTE FUNCTION registrarOperacion();

-- Convenio_Movilidad
DROP TRIGGER IF EXISTS registro_borrado_convenio_movilidad ON Convenio_Movilidad;
CREATE TRIGGER registro_borrado_convenio_movilidad AFTER DELETE ON Convenio_Movilidad
FOR EACH ROW EXECUTE FUNCTION registrarOperacion();

DROP TRIGGER IF EXISTS registro_actualizacion_convenio_movilidad ON Convenio_Movilidad;
CREATE TRIGGER registro_actualizacion_convenio_movilidad AFTER UPDATE ON Convenio_Movilidad
FOR EACH ROW EXECUTE FUNCTION registrarOperacion()
