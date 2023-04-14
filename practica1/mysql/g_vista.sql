-- Vista

DROP VIEW IF EXISTS tasas_exito;
CREATE VIEW tasas_exito AS

	SELECT mayor.nombre AS agig_mayor_tasa, mayor.tasa_exito AS mayor_tasa_exito, 
		menor.nombre AS asig_menor_tasa, menor.tasa_exito AS menor_tasa_exito
	FROM Titulacion menor,
		(SELECT t.nombre, t.tasa_exito
		FROM Titulacion t
		WHERE t.nombre = 'Ingeniería Informática' AND t.id_centro IN 
			(SELECT c.id_centro
			FROM Centro c
			WHERE c.nombre = 'Escuela de Ingeniería y Arquitectura'
				OR c.nombre = 'Escuela Universitaria Politécnica de Teruel')
		ORDER BY t.tasa_exito DESC 
		LIMIT 10) AS mayor
	WHERE menor.nombre = 'Ingeniería Informática' AND menor.id_centro IN 
			(SELECT c1.id_centro
			FROM Centro c1
			WHERE c1.nombre = 'Escuela de Ingeniería y Arquitectura'
				OR c1.nombre = 'Escuela Universitaria Politécnica de Teruel')
		ORDER BY menor.tasa_exito 
		LIMIT 10;
