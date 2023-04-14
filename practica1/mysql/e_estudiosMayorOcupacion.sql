-- Consulta que devuelve los dos estudios de cada localidad con mayor índice de ocupación en 2020

SELECT a.localidad, a.nombre, a.indice_ocupacion
FROM 
	(SELECT * , 
		ROW_NUMBER() OVER(PARTITION BY b.localidad ORDER BY b.localidad) AS row_num
	FROM 
		(SELECT c1.localidad, t1.nombre, t1.indice_ocupacion
		FROM Centro c1, Titulacion t1
		WHERE c1.id_centro = t1.id_centro AND t1.curso_academico = '2020'
		ORDER BY c1.localidad, t1.indice_ocupacion DESC) AS b ) AS a
	
WHERE a.row_num = 1 OR a.row_num = 2;
