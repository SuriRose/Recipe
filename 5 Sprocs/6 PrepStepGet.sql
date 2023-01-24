-- LL 100%
create or alter procedure dbo.PrepstepGet(
  @RecipeId int = 0,
  @All bit = 0,
  @Message varchar(100) = '' output,
  @PrepStepDesc varchar(100) = '' output 
)
as
begin
declare @return int = 0
    select @RecipeId = isnull(@RecipeId, 0), @PrepStepDesc = isnull(@PrepStepDesc, '')
     select PrepStepDesc = concat(p.[Sequence], '. ', p.StepDesc)
            from prepstep p 
            join Recipe r 
            on r.RecipeId = p.RecipeId
            where r.RecipeId = @RecipeId
            or @All = 1
            or r.RecipeId = @RecipeId    
            order by p.[Sequence]
            return @return 
end
go 


