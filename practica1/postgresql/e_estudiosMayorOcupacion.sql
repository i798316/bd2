-- Consulta que devuelve los dos estudios de cada localidad con mayor índice de ocupación en 2021

SELECT o1.localidad, o1.estudio, o1.indice_ocupacion
FROM Oferta o1
WHERE o1.curso_academico = 2021
GROUP BY o1.curso_academico, o1.localidad, o1.estudio, o1.indice_ocupacion
HAVING COUNT(*) <= 2
 AND o1.indice_ocupacion >= ALL (
  SELECT o2.indice_ocupacion
  FROM Oferta o2
  WHERE o1.localidad = o2.localidad AND o1.curso_academico = o2.curso_academico
  ORDER BY o2.indice_ocupacion DESC
  LIMIT 2
 );
