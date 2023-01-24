-- LL 100%
create or alter procedure dbo.RecipeUpdate(
    @RecipeId int output,
    @CuisineId int,
    @CreatedByUsersId int,
    @RecipeName varchar(100),
    @NumCalories int,
    @DateCreated date = null output,
    @DatePublished date = null output,
    @DateArchived date = null output,
    @RecipeStatusName varchar(100) = '' output,
    @NumOfIngredients int = 0,
    @NumOfSteps int = 0,
    @Code varchar(250) = '' output,
    @ImageCode varchar(10) = '' output,
    @Message varchar(1000) = '' output
)
as
begin
declare @return int  = 0
if @CuisineId = (select c.CuisineId from CuisineType c where c.CuisineName = 'Zero Calorie') and @NumCalories <> 0
begin
    select @return = 1, @Message = 'Number of calories must be zero when cuisine name is Zero Calorie'
    goto finished
end

if @RecipeId = 0
begin
        insert Recipe(CuisineId, CreatedByUsersId, RecipeName, NumCalories , DateCreated, DatePublished, DateArchived, ImageCode)
        values(@CuisineId, @createdByUsercreasId, @RecipeName, @NumCalories , @DateCreated, @DatePublished, @DateArchived, @ImageCode)

        select @RecipeId = scope_identity()
    end
    else
    begin
        update r 
        set
            CuisineId = @CuisineId, 
            CreatedByUsersId = @CreatedByUsersId, 
            RecipeName = @RecipeName, 
            NumCalories = @NumCalories,
            DateCreated = @DateCreated,
            DatePublished = @DatePublished,
            DateArchived = @DateArchived
        from recipe r 
        where r.RecipeId = @RecipeId
    end
    
    select @Code = Code from Recipe r where r.RecipeId = @RecipeId
    select @ImageCode =  ImageCode from Recipe r where r.RecipeId = @RecipeId
    finished:

    return @return
end 

