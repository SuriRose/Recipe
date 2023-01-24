-- LL 100%
create or alter procedure dbo.CuisineTypeGet(
    @CuisineId int = 0,
    @all bit = 0,
    @IncludeBlank bit = 0,
    @Message varchar(100) = ' ' output
)
as
begin
declare @return int  = 0
select @CuisineId = isnull(@CuisineId, 0), @all = isnull(@all, 0), @IncludeBlank = isnull(@IncludeBlank, 0)
select c.CuisineId, c.CuisineName 
from CuisineType c 
where c.CuisineId = @CuisineId
or @all = 1
union select 0, ' ' where @IncludeBlank = 1
order by c.CuisineId
return @return
end
go

--exec CuisineTypeGet
--exec CuisineTypeGet @all = 1
--exec CuisineTypeGet @all = 1, @IncludeBlank = 1

