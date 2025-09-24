CREATE TABLE Categoria (
    CategoriaId INT PRIMARY KEY,        -- identificador
    CategoriaNombre VARCHAR(15) UNIQUE  -- nombre de la categoría, único
);


create procedure insertar_categorias
@id int
@nombreCategoria varchar(15)
as 
if(select count(*) from categoria 
  where categoriaId=@id or categoriaNombre=@nombreCategoria
)=0
insert into categoria(categoriaNombre)
values(@NombreCategoria)
else 
print('Error categoria ya existe')

--las variables llevan antes la palabra 'declare'
