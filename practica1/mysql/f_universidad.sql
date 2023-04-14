-- Consulta que devuelve la universidad que más alumnos ha recibido en 2020

SELECT *
FROM
	(SELECT *, 
		ROW_NUMBER() OVER(PARTITION BY a.id_centro) AS row_num
	FROM 
		(SELECT c.id_centro, c.universidad_acuerdo,
			SUM(c.plazas_ofertadas_alumnos) AS plazas
		FROM Convenio_Movilidad c
		WHERE c.curso_academico = 2020 AND c.in_out = 'OUT'
		GROUP BY c.universidad_acuerdo, c.id_centro
		ORDER BY c.id_centro, plazas DESC) AS a ) AS b

WHERE b.row_num = 1;
