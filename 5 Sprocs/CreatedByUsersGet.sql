create or alter procedure dbo.CreatedByUsersGet(
    @UsersId int = 0,
    @All bit = 0,
    @IncludeBlank bit = 0,
    @Message varchar(100) = ' ' output
)
as
begin
    declare @return int  = 0
        select  @UsersId = isnull( @UsersId, 0), @all = isnull(@all, 0), @IncludeBlank = isnull(@IncludeBlank, 0)
        select u.UsersId, UsersName = concat( u.Firstname, ' ', u.LastName)  
from Users u  
where u.UsersId = @UsersId
or @All = 1
union select 0, ' ' where @IncludeBlank = 1
order by u.UsersId
return @return
end
go




