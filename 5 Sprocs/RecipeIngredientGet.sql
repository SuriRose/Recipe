create or alter procedure dbo.RecipeIngredientGet(
  @RecipeId int = 0,
  @All bit = 0,
  @Message varchar(100) = '' output,
  @IngredientList varchar(100) = '' output
)
as
begin
declare @return int = 0
  select @RecipeId = isnull(@RecipeId, 0), @IngredientList = isnull(@IngredientList, '')
    select IngredientList = concat(i.IngredientName, ', ', MeasurementQuantity,  ' ', MeasurementName), RecipeCount = count(r.RecipeId)
            from RecipeIngredient ri 
            join Recipe r
            on  ri.RecipeId = r.RecipeId 
            join Ingredient i 
            on i.IngredientId = ri.IngredientId
            join MeasurementType mt 
            on mt.MeasurementTypeId = ri.MeasurementTypeId  
            where r.RecipeId = @RecipeId 
            or @All = 1
            group by r.RecipeId, i.IngredientName, MeasurementQuantity, MeasurementName, ri.[Sequence]
            order by ri.[Sequence]

return @return
end
go 

