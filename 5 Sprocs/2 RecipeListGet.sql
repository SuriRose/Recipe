-- LL 100%
create or alter procedure dbo.RecipeListGet(
    @All bit = 0,
    @Message varchar(1000) = '' output
)
as
begin
declare @return int = 0
    select  r.RecipeId, r.RecipeName, r.RecipeStatusName, r.NumCalories, r.DateCreated, r.DatePublished, r.DateArchived
    from  Recipe r 
    return @return
end
go


