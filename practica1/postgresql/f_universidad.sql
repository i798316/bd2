-- Consulta que devuelve la universidad que más alumnos ha recibido en 2021

SELECT c.universidad_acuerdo, SUM(c.plazas_ofertadas_alumnos) AS plazas
FROM Convenio_Movilidad c
WHERE c.curso_academico = 2021
GROUP BY c.universidad_acuerdo
/*
SELECT universidad_acuerdo, plazas_ofertadas_alumnos
FROM Convenio_Movilidad
WHERE universidad_acuerdo = 'Université Claude Bernard (Lyon I) (Francia)'*/
