-- LL 100%
create or alter procedure dbo.IngredientDetailGet(
  @RecipeId int = 0,
  @All bit = 0,
  @Message varchar(100) = '' output
)
as
begin
declare @return int = 0
  select @RecipeId = isnull(@RecipeId, 0)
    select IngredientList = concat(i.IngredientName, ', ', MeasurementQuantity,  ' ', MeasurementName)
            from Ingredient i 
            join RecipeIngredient ri 
            on i.IngredientId = ri.IngredientId 
            join Recipe r 
            on r.RecipeId = ri.RecipeId
            join MeasurementType mt 
            on mt.MeasurementTypeId = ri.MeasurementTypeId  
            where r.RecipeId = @RecipeId 
            or @All = 1
            order by ri.[Sequence]

return @return
end
go 



