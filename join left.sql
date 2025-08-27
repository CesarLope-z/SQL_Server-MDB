--INNER JOIN
--LEFT JOIN
/*
SE QUIERE MOSTRAR INFO SOBRE EL AUTOR Y EL TRADUCTOR DE CADA LIBRO
es decir sus apellidos
tambien mantener la info basica de cada libro

autor y traductor: apellidos
libro: id, title y type

el ON hace la conexion, con la llave foranea con la primaria

*/
select b.id, b.title, b.type, 
		a.apellido as author, 
		t.apellido as translator
from books b
left join authors a
on b.author_id = t.id
left join tanslators t
order by b.id