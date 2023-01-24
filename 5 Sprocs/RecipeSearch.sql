-- LL 100%
create or alter procedure dbo.RecipeSearch(
    @SearchCriteria varchar(1000) = '' output,
    @Message varchar(1000) = '' output
)
as begin
    declare @return int = 0
        select * from recipe r where r.RecipeName like '%' + @SearchCriteria + '%'
    return @return
end 
go
--exec RecipeSearch @SearchCriteria = 'feta'
