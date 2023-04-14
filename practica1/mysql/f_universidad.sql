-- Consulta que devuelve la universidad que más alumnos ha recibido en 2021

SELECT DISTINCT ON (c.id_centro) c.id_centro, c.universidad_acuerdo,
	SUM(c.plazas_ofertadas_alumnos) AS plazas
FROM Convenio_Movilidad c
WHERE c.curso_academico = 2021 AND c.in_out = 'OUT'
GROUP BY c.universidad_acuerdo, c.id_centro
ORDER BY c.id_centro, plazas DESC;
