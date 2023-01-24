-- LL this should be labeled test recipe insert
declare @RecipeId int, @CuisineId int, @CreatedByUsersId int = 0, @DateCreated date, @DatePublished datetime2, @DateArchived date, @RecipeStatusName varchar(100)

select top 1 @RecipeId = @RecipeId from Recipe r order by RecipeId
select top 1 @CreatedByUsersId = @CreatedByUsersId from Users u 
select top 1 @DatePublished = @DatePublished from Recipe r 
select top 1 @DateArchived = @DateArchived from Recipe r 

exec RecipeUpdate
@RecipeId = @RecipeId,
@CuisineId = @CuisineId,
@CreatedByUsersId = @CreatedByUsersId,
@RecipeName = "Donut",
@NumCalories = 98,
@DateCreated = @DateCreated,
@DatePublished = @DatePublished,
@DateArchived = @DateArchived,
@RecipeStatusName = 'Published'

select * from recipe r order by r.RecipeId desc