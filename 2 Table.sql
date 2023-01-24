--AS Fantastic work! 100%
use RecipeDB 
go
drop table if exists CookbookRecipe
drop table if exists Cookbook 
drop table if exists RecipeMealCourse
drop table if exists MealCourse
drop table if exists Meal
drop table if exists Course
drop table if exists PrepStep
drop table if exists RecipeIngredient
drop table if exists Recipe 
drop table if exists CuisineType
drop table if exists Users
drop table if exists MeasurementType
drop table if exists Ingredient
go
create table dbo.Ingredient(
    IngredientId int not null identity primary key,
    IngredientName varchar(35) not null constraint u_Ingredient_IngredientName unique
        constraint ck_Ingredient_IngredientName_cannot_be_blank check(IngredientName <> '')
)
go
create table dbo.MeasurementType(
    MeasurementTypeId int not null identity primary key,
    MeasurementName varchar(20) not null
        constraint ck_MeasurementType_MeasurementName_cannnot_be_blank check(MeasurementName <> '')
        constraint u_MeasurementType_MeasurementName unique
)
go
create table dbo.Users(
    UsersId int not null identity primary key,
    Firstname varchar(30) not null
        constraint ck_Users_FirstName_cannnot_be_blank check(Firstname <> ''),
    LastName varchar(30) not null
        constraint ck_Users_LastName_cannnot_be_blank check(LastName <> ''),
    [Password] varchar(20) not null
        constraint Users_Password_cannnot_be_blank check(Password <> ''),
        constraint u_Users_FirstName_LastName_Password unique (Firstname, Lastname, [Password])
) 
go
create table dbo.CuisineType(
    CuisineId int not null identity primary key,
    CuisineName varchar(30) not null 
        constraint u_CuisineType_CuisineName unique
        constraint ck_CuisineType_CuisineName_cannot_be_blank check(CuisineName <> '')        
)
go
create table dbo.Recipe(
    RecipeId int not null identity primary key,
    CuisineId int not null constraint f_CuisineType_Recipe foreign key references CuisineType(CuisineId),
    CreatedByUsersId int not null constraint f_CreatedByUsers_Recipe foreign key references Users(UsersId),
    RecipeName varchar(30) not null
         constraint ck_Recipe_RecipeName_cannnot_be_blank check(RecipeName <> '')
         constraint u_Recipe_RecipeName unique,
    NumCalories int not null
        constraint ck_Recipe_NumCalories_must_be_greater_than_zero check(NumCalories > 0),
    DateCreated date default getdate() not null
        constraint ck_DateCreated_must_be_between_01_05_2019_and_current_date check(DateCreated between '01/05/2019' and getdate()),
    DatePublished date, constraint ck_Recipe_DatePublished_must_be_less_or_equal_to_current_date check(DatePublished <= getdate()),
    DateArchived date
        constraint ck_Recipe_DateArchived_must_be_less_or_equal_to_current_date check(DateArchived <= getdate()),
    ImageCode varchar(10) not null constraint u_Recipe_ImageCode unique,
    RecipeStatusName as case
            when DateArchived is not null then 'Archived' 
            when DateArchived is null and DatePublished is not null then 'Published'
            else 'Draft'
        end persisted,
     constraint ck_DatePublished_must_be_greater_or_equal_to_DateCreated check(DatePublished >= DateCreated),
     constraint ck_DateArchived_must_be_greater_or_equal_to_DatePublished check(DateArchived >= DatePublished),
     constraint ck_DateArchived_must_be_greater_or_equal_to_DateCreated check(DateArchived >= DateCreated)
)
go  
alter table Recipe drop column if exists Code
go
alter table Recipe add Code as replace(concat(RecipeName, '-', NumCalories), ' ', '-') persisted
go

Create table dbo.RecipeIngredient(
    RecipeIngredientId int not null identity primary key,
    IngredientId int not null constraint f_Ingredient_RecipeIngredient foreign key references Ingredient(IngredientId),
    RecipeId int not null constraint f_Recipe_RecipeIngredient foreign key references Recipe(RecipeId),
    MeasurementTypeId int not null constraint f_MeasurementType_RecipeIngredient foreign key references MeasurementType(MeasurementTypeId),
    MeasurementQuantity decimal(4,2) not null
        constraint ck_RecipeIngredient_MeasurementQuantity_must_be_greater_than_zero check(MeasurementQuantity > 0),
    [Sequence] int not null
        constraint ck_RecipeIngedient_Sequence_must_be_greater_than_zero check(Sequence > 0),
        constraint u_RecipeIngredient_RecipeId_IngredientId unique (RecipeId, IngredientId)    
)
go
create table dbo.PrepStep(
    PrepStepId int not null identity primary key,
    RecipeId int not null constraint f_PrepStep_Recipe foreign key references Recipe(RecipeId),
    [Sequence] int not null
        constraint ck_PrepStep_Sequence_must_be_greater_than_zero check(Sequence > 0),
    StepDesc varchar(300) not null
        constraint ck_PrepStep_StepDesc_cannot_be_blank check(StepDesc <> ''),
        constraint u_PrepStep_RecipeId_Sequence unique(RecipeId, Sequence)  
)
go
create table dbo.Course(
    CourseId int not null identity primary key,
    CourseName varchar(20) not null
        constraint u_Course_CourseName unique 
        constraint ck_Course_CourseName_cannot_be_blank check(CourseName <> ''),
    [Sequence] int not null
        constraint ck_Course_Sequence_must_be_greater_than_zero check(Sequence > 0)
)
go
create table dbo.Meal(
    MealId int not null identity primary key,
    UsersId int not null constraint f_Users_Meal foreign key references Users(UsersId),
    MealName varchar(20) not null
        constraint u_Meal_MealName unique, 
        constraint ck_Meal_MealName_cannot_be_blank check(MealName <> ''), 
    DateCreated date default getdate() not null 
        constraint ck_Meal_DateCreated_must_be_between_01_05_2019_and_current_date check(DateCreated between '01/05/2019' and getdate()),
    Active bit not null default 1    
)
go
create table dbo.MealCourse(
    MealCourseId int not null identity primary key,
    CourseId int not null constraint f_Course_MealCourse foreign key references Course(CourseId),
    MealId int not null constraint f_Meal_MealCourse foreign key references Meal(MealId)
        constraint u_MealCourse_Course_Meal unique(CourseId, MealId)
)
go
create table dbo.RecipeMealCourse(
    RecipeMealCourseId int not null identity primary key,
    RecipeId int not null constraint f_Recipe_RecipeMealCourse foreign key references Recipe(RecipeId),
    MealCourseId int not null constraint f_MealCourse_RecipeMealCourse foreign key references MealCourse(MealCourseId),
    MainDish bit not null 
        constraint u_RecipeMealCourse_MealCourseId_RecipeId unique (MealCourseId, RecipeId), 
    
)
go
create table dbo.Cookbook(
    CookbookId int not null identity primary key,
    UsersId int not null 
        constraint f_Users_Cookbook foreign key references Users(UsersId), 
    CookbookName varchar(35) not null 
        constraint u_Cookbook_CookbookName unique
        constraint ck_Cookbook_CookbookName_cannot_be_blank check(CookbookName <> ''), 
    Price decimal(5,2) not null 
        constraint ck_Cookbook_Price_must_be_greater_than_zero check(Price > 0), 
    DateCreated date default getdate() not null 
        constraint ck_CookbookDateCreated_must_be_between_01_05_2019_and_current_date check(DateCreated between '01/05/2019' and getdate()), 
    Active bit not null default 1
)
go 
create table dbo.CookbookRecipe(
    CookbookRecipeId int not null identity primary key, 
    RecipeId int not null constraint f_Recipe_CookbookRecipe foreign key references Recipe(RecipeId), 
    CookbookId  int not null constraint f_Cookbook_CookbookRecipe foreign key references Cookbook(CookbookId), 
    [Sequence] int not null 
        constraint ck_CookbookRecipe_Sequence_must_be_greater_than_zero check(Sequence > 0), 
        constraint u_Cookbook_RecipeId_CookbookId unique (RecipeId,CookbookId)
)
go 
