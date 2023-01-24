-- LL 100%
create or alter procedure dbo.RecipeCountGet(
   @Message varchar(1000) = '' output
)
as
begin
    declare @return int = 0
    select Recipes = count(distinct r.RecipeId), Meals = count(distinct m.MealId), Cookbooks = count(distinct c.CookbookId) 
    from Meal m 
    cross join Cookbook c 
    cross join recipe r 

return @return
end
go 





