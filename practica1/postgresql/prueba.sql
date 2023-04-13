/*
SELECT o1.localidad, o1.estudio, o1.indice_ocupacion
FROM Oferta o1
WHERE o1.curso_academico = 2021
GROUP BY o1.curso_academico, o1.localidad, o1.estudio, o1.indice_ocupacion
HAVING	 o1.indice_ocupacion >= ALL (
  SELECT o2.indice_ocupacion
  FROM Oferta o2
  WHERE o1.localidad = o2.localidad AND o1.curso_academico = o2.curso_academico
  ORDER BY o2.indice_ocupacion DESC
  LIMIT 2
 );
 
 SELECT o1.localidad, o1.estudio, o1.indice_ocupacion
 FROM (
  SELECT o2.localidad, o2.estudio, o2.indice_ocupacion, o2.curso_academico
  FROM Oferta o2
  HAVING COUNT(*) <= 2
  GROUP BY o2.localidad, o2.estudio, o2.indice_ocupacion
  ORDER BY o2.indice_ocupacion DESC)
 WHERE o2.curso_academico = 2021
 HAVING COUNT(o2.localidad)
 
 
 SELECT */
 
SELECT *
FROM Resultados

