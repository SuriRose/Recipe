declare @createdByUserId int = 0, @CuisineId int = 0, @RecipeId int = 0
--delete recipe where RecipeName = 'Cream puffs'
--select top 1 @createdByUserId = r.CreatedByUsersId from recipe r order by CreatedByUsersId
--select top 1 @CuisineId = r.CuisineId from Recipe r order by CuisineId

exec RecipeUpdate
@RecipeId = @RecipeId output,
@CuisineId = @CuisineId output,
@CreatedByUsersId = @createdByUserId output,
@RecipeName = "Cream Puffs",
@NumCalories = 200
--,@DateCreated = '01-02-2020',
--@DatePublished = null,
--@DateArchived = null

select * from Recipe r where r.RecipeId = @RecipeId

