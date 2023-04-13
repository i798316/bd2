-- Consulta que devuelve la universidad que más alumnos ha recibido en 2021

SELECT c.universidad_acuerdo, SUM(c.plazas_ofertadas_alumnos) AS total
FROM Convenio_Movilidad c
WHERE c.curso_academico = 2021
GROUP BY c.universidad_acuerdo
ORDER BY total DESC
LIMIT 1
