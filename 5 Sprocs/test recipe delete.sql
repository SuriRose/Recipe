
declare @RecipeId int

select top 1 @RecipeId = r.RecipeId
from recipe r 
join PrepStep p 
on r.RecipeId = p.RecipeId
where p.PrepStepId is null
order by r.RecipeId

select * from recipe r where r.RecipeId = @RecipeId

exec RecipeDelete @RecipeId = @RecipeId

select * from Recipe r where r.RecipeId = @RecipeId

select * from cuisinetype where cuisineid = 131