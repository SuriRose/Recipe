create or alter procedure dbo.RecipeDelete(
    @RecipeId int,
    @Message varchar(100) = '' output
    )
as 
begin 
    declare @return int  = 0

    delete p 
    from PrepStep p 
    join recipe r 
    on r.RecipeId = p.RecipeId
    where r.RecipeId = @RecipeId

    delete rmc 
    from RecipeMealCourse rmc 
    join recipe r 
    on r.RecipeId = rmc.RecipeId
    where r.RecipeId = @RecipeId

    delete cr 
    from CookbookRecipe cr
    join recipe r 
    on r.RecipeId = cr.RecipeId
    where r.RecipeId = @RecipeId

    delete RecipeIngredient
    from RecipeIngredient ri
    join recipe r 
    on r.RecipeId = ri.RecipeId
    where r.RecipeId = @RecipeId

    delete r 
    from recipe r 
    where r.RecipeId = @RecipeId
    
    return @return
end
go 
