
--tabla estudiantes con id, nombre, carrera
create table estudiantes(
	idEstudiantes int primary key,
	nombre varchar(50),
	carrera varchar(30)
)

--tabla cursos, idCurso, nombreCurso, creditos
create table cursos(
	idCursos int primary key,
	nombreCurso varchar(30),
	creditos int 
)
create table inscripciones(
	idEstudiantes int,
	idCursos int,
	nota decimal(4,2),
	primary key(idEstudiantes, idCursos),
	foreign key (idEstudiantes) references estudiantes(idEstudiantes),
	foreign key (idCursos) references cursos(idCursos)
)

INSERT INTO estudiantes VALUES
(1, 'Ana', 'Ingeniería'),
(2, 'Carlos', 'Medicina'),
(3, 'Luisa', 'Ingeniería'),
(4, 'Pedro', 'Derecho');

INSERT INTO cursos VALUES
(101, 'Matemáticas', 4),
(102, 'Biología', 3),
(103, 'Programación', 5),
(104, 'Derecho Civil', 4);

INSERT INTO inscripciones VALUES
(1, 101, 8.5),
(1, 103, 9.0),
(2, 102, 7.0),
(3, 101, 6.5),
(3, 103, 8.0),
(4, 104, 7.5);


select c.nombreCurso, e.nombre from inscripciones i
inner join estudiantes e on i.idEstudiantes = e.idEstudiantes
inner join cursos c on i.idCursos = c.idCursos

--mostrar estudiantes que llevan la carrera de ingenieria y los cursos que llevan 

select c.nombreCurso, e.carrera, e.nombre from inscripciones i 
inner join estudiantes e on i.idEstudiantes = e.idEstudiantes
inner join cursos c on i.idCursos = c.idCursos
where e.carrera = 'Ingeniería'


-- lista de cursos con los nombres de estudiantes y sus notas

select c.nombreCurso, e.nombre, nota from inscripciones i
inner join cursos c on c.idCursos = i.idCursos
inner join estudiantes e on i.idEstudiantes = e.idEstudiantes


select nombre, creditos from inscripciones i
inner join cursos c on c.idCursos = i.idCursos
inner join estudiantes e on i.idEstudiantes = e.idEstudiantes
where creditos > 4 --si hay un campo que no se repite se puede asignar directamente


select * from inscripciones i
inner join cursos c on c.idCursos = i.idCursos
inner join estudiantes e on i.idEstudiantes = e.idEstudiantes

