-- Vista

create view top_bottom_tasas_exito as
select *
from (
  select Titulacion.nombre as asignatura, Centro.nombre as centro, Titulacion.tasa_exito,
  row_number() over (partition by Centro.nombre order by Titulacion.tasa_exito desc) 
  as num_asignatura
  from Titulacion
    join Centro on Titulacion.id_centro = Centro.id_centro
  where Titulacion.nombre ilike '%ingeniería informática%' 
  and (Centro.nombre ilike '%eina%' or Centro.nombre ilike '%eupt%')
) as tasas_exito
where num_asignatura <= 10 or num_asignatura > (count(*) over() - 10);

