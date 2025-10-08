use Northwind
go

create trigger Disp_seguridad
on database for DROP_TABLE, ALTER_TABLE
as
begin
RAISERROR('No se permite borrar ni modificar', 16, 1)
Rollback transaction
end