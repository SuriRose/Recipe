create or alter procedure dbo.RecipeGet(
    @RecipeId int = 0,
    @All bit = 0,
    @Message varchar(100) = '' output,
    @Code varchar(250) = '',
    @ImageCode varchar(35) = '' output,
    @RecipeName varchar(35) = '' output
    )
as
begin
declare @return int = 0
    select @RecipeId = isnull(@RecipeId, 0), @Code = isnull(@Code, 0), @ImageCode = isnull(@ImageCode, ''), @RecipeName = isnull(@RecipeName, '')
    select r.RecipeId, r.RecipeName, r.NumCalories, NumOfIngredients = count(distinct ri.IngredientId), NumOfSteps = count(distinct p.StepDesc), r.DateCreated, r.DatePublished, r.DateArchived, r.RecipeStatusName, r.CreatedByUsersId, r.CuisineId, r.Code, r.ImageCode
            from Recipe r 
            left join Prepstep p 
            on r.RecipeId = p.RecipeId
            left join RecipeIngredient ri 
            on r.RecipeId = ri.RecipeId
            where r.RecipeId = @RecipeId 
            or @All = 1     
            or r.Code = @Code 
            or r.ImageCode = @ImageCode   
            or r.RecipeName = @RecipeName     
            group by r.RecipeId, r.RecipeName, r.NumCalories, r.DateCreated, r.DatePublished, r.DateArchived, r.RecipeStatusName, r.CreatedByUsersId, r.CuisineId, r.Code, r.ImageCode
            order by r.RecipeName 
return @return
end
go 
