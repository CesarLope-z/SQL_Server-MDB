--mostrar peliculas vistas por estudiantes
Select nombre,
(Select count (*) from vistas V
Where V.id_estudiantes=e.id_estudiantes) AS pelicula_vistas


select nombre, pelicula_vistas
from (select e.nombre, count(v.id_pelicula) as pelicula_vistas 
from estudiantes.e
join vistas v on e.id_estudiantes= v.id_estudiantes
group by e.nombre
) as resumen

select nombre, carrera 
from estudiantes
where id_estudiantes in(
select id_estudiantes
from vistas
group by id_estudiantes
having count(*) > 1
)