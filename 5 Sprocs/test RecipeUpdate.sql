declare @RecipeId int, @CuisineId int, @createdByUsersId int, @RecipeName varchar(100), @NumCalories int ,@DateCreated date , @DatePublished datetime2, @DateArchived date

select top 1 
@RecipeId = r.RecipeId, @CuisineId = r.CuisineId, @createdByUsersId = r.CreatedByUsersId, @RecipeName = r.RecipeName, @NumCalories = r.NumCalories, @DateCreated = r.DateCreated, @DatePublished = r.DatePublished, @DateArchived = r.DateArchived
from Recipe r 
order by r.RecipeId desc

select * from Recipe r where r.RecipeId = @RecipeId

exec RecipeUpdate
@RecipeId = @RecipeId,
@CuisineId = @CuisineId,
@createdByUsersId = @createdByUsersId,
@RecipeName = "Mocha Cheesecake",
@NumCalories = 98,
@DateCreated = @DateCreated,
@DatePublished = @DatePublished,
@DateArchived = @DateArchived

select * from recipe  r where r.RecipeId = @RecipeId