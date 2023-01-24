/*
-AS Amazing job! You got it perfect:) Good luck with the rest of the work! 
Ingredient
    pk
    IngredientName varchar(35) not null
        constraint cannot be blank 
        constraint Ingredient unique

MeasurementType
    pk
    MeasurementName varchar(20) not null
        constraint MeasurementName cannnot be blank
        constraint MeasurementName unique

User
    pk
    Firstname varchar(30) not null
        constraint cannnot be blank
    LastName varchar(30) not null
        constraint cannnot be blank
    Password varchar(20) not null
        constraint cannnot be blank
        constraint unique (firstname, lastname, password)

CuisineType
    pk
    CuisineName varchar(30) not null
        constraint cannot be blank
        constraint CuisineName unique

Recipe
    pk
    CuisineId (fk Cuisine)
    StatusId (fk Status)
    CreatedByUserId (fk User)
    RecipeName varchar(30) not null
         constraint cannnot be blank
         constraint unique RecipeName
    NumCalories int not null
        constraint must be greater than zero
    DateCreated date default getdate() not null
        constraint must be between '01/05/2019' and getdate()
    DatePublished date
    DateArchived date 
    RecipeStatusName as case(
        when DateArchived is not null then 'Archived'
        when DateArchived is null and DatePublished is not null then 'Published'
        else 'Draft'
        end) persisted
        constraint DatePublished must be between DateCreated and getdate()
        constraint DateArchived must be between DatePublished and getdate()
         
RecipeIngredient
    pk
    IngredientId (fk Ingredient)
    RecipeId (fk Recipe)
    MeasurementTypeId (fk MeasurementType)
    MeasurementQuantity decimal (4,2) not null
        constraint must be greater than zero
    Sequence int not null
        constraint sequence must be greater than zero
    unique (RecipeId,IngredientId)

PrepStep
    pk
    RecipeId (fk Recipe)
    Sequence int not null
        constraint cannot be blank
        constraint sequence must be greater than zero
    StepDesc varchar(200) not null
        constraint StepDesc cannot be blank
    unique (RecipeId, Sequence)
 
Course
    pk
    CourseName varchar(20) not null
        constraint CourseName unique 
        constraint cannot be blank
    Sequence int not null
        constraint cannot be blank
        constraint sequence must be greater than zero

Meal
    pk
    UserId (fk User) 
    MealName varchar(20) not null
        constraint unique MealName
        constraint MealName cannot be blank
    DateCreated date default getdate() not null 
        constraint must be between '01/05/2019' and getdate()
    Active bit default 1 not null

MealCourse
    pk
    CourseId (fk Course)
    MealId (fk Meal)
        constraint unique (Course, Meal)

RecipeMealCourse
    pk
    RecipeId  (fk Recipe)
    MealCourseId (fk MealCourse)
    unique (MealCourseId)  
    MainDish bit not null 

Cookbook
    pk
    UserId (fk User)
    CookbookName varchar(35) not null
        constraint CookbookName unique 
        constraint CookbookName cannot be blank
    Price decimal(5,2) not null 
        constraint must be greater than zero
    DateCreated date default getdate() not null 
        constraint DateCreated must be between '01/05/2019' and getdate()
    Active bit default 1 not null 

CookbookRecipe
    pk
    RecipeId (fk Recipe)
    CookbookId (fk Cookbook)
    Sequence int not null 
        constraint sequence must be greater than zero
    unique (RecipeId,CookbookId)
*/