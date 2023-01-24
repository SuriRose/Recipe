--AS Good job! 100%
--Home Page
---One resultset with number of recipes, meals, and cookbooks
select Recipes = count(distinct r.RecipeId), Meals = count(distinct m.MealId), Cookbooks =count(distinct c.CookbookId)
from recipe r
cross join Cookbook c
cross join Meal m 

--List of all Recipes that are either published or archived, published recipes should appear at the top.
---In the resultset show the Recipe with its status, dates it was published and archived (blank if not archived), user, number of calories and number of ingredients.
select r.RecipeName, r.RecipeStatusName, r.DatePublished, DateArchived = isnull(convert(varchar, r.DateArchived), ''), u.Firstname, u.LastName, r.NumCalories, NumOfIngredients = Count(i.IngredientId)
from recipe r
join RecipeIngredient ri 
on r.RecipeId = ri.RecipeId
join Ingredient i 
on i.IngredientId = ri.IngredientId
join Users u 
on u.UsersId = r.CreatedByUsersId
where r.DatePublished is not null or r.DateArchived is not null  
group by r.RecipeName, r.NumCalories , r.DatePublished, r.DateArchived, r.recipeStatusName, u.Firstname, u.LastName
order by r.DatePublished desc

--Recipe details page: Show for a specific recipe (three lists):
---a) Recipe header: recipe name, number of calories, number of ingredients and number of steps.
select r.RecipeName, r.NumCalories, NumOfIngredients = count(distinct ri.IngredientId), NumOfSteps = count(distinct p.StepDesc)
from Recipe r 
join Prepstep p 
on r.RecipeId = p.RecipeId
join RecipeIngredient ri 
on r.RecipeId = ri.RecipeId
where r.RecipeName = 'Penne a la Vodka'
group by r.RecipeName, r.NumCalories

---b) List of ingredients: show the ingredient, measurement type and quantity in one column, sorted by sequence. 
select IngredientList = concat(i.IngredientName, ', ', MeasurementQuantity,  ' ', MeasurementName)
from Ingredient i 
join RecipeIngredient ri 
on i.IngredientId = ri.IngredientId 
join Recipe r 
on r.RecipeId = ri.RecipeId
join MeasurementType mt 
on mt.MeasurementTypeId = ri.MeasurementTypeId  
where r.RecipeName = 'Penne a la Vodka'
order by ri.[Sequence]

---c) List of prep steps sorted by sequence.
select p.StepDesc
from prepstep p 
join Recipe r 
on r.RecipeId = p.RecipeId
where r.RecipeName = 'Penne a la Vodka'
order by p.[Sequence]

/*Meal list page:
All active meals, number of courses and number of recipes per each meal*/ 
select m.MealName, NumOfCourses = count(distinct mc.CourseId), NumOfRecipes = count(distinct rmc.RecipeId)
from MealCourse mc 
join Meal m 
on m.MealId = mc.MealId
join RecipeMealCourse rmc 
on mc.MealCourseId = rmc.MealCourseId
where m.Active = 1 
group by m.MealName

--Meal details page: Show for a specific meal:
--a) Meal header: meal name, user, date created.
select m.MealName, u.Firstname, u.LastName, m.DateCreated
from Meal m 
join Users u 
on u.UsersId = m.UsersId
where m.MealName = 'Chanukah Meal'
order by u.LastName

/*b) List of all recipes. 
            Display in one column the course type, recipe, and for the main course show which dishes are main and which are side. 
                ex: 
                    Appetizer: Mixed Greens
                        Main: Main dish - Onion Pastrami Chicken*/
select RecipeList =
     case 
        when rmc.MainDish = 1 then concat(c.CourseName, ': ', 'Main dish', ' - ', r.RecipeName) 
        when rmc.MainDish = 0 then concat(c.CourseName, ': ', 'Side dish', ' - ', r.RecipeName)
        else concat(c.CourseName, ': ', r.RecipeName)
    end 
from meal m 
join MealCourse mc 
on mc.MealId = m.MealId
join course c 
on c.CourseId = mc.CourseId
join RecipeMealCourse rmc 
on rmc.MealCourseId = mc.MealCourseId
join Recipe r 
on r.RecipeId = rmc.RecipeId
where m.mealname  = 'Chanukah Meal'
order by c.CourseName desc, r.RecipeName

---Cookbook list page: Show all active cookbooks and number of recipes per book.
select c.CookbookName, NumOfRecipes = count(cr.RecipeId)
from cookbook c 
join CookbookRecipe cr
on c.CookbookId = cr.CookbookId  
where c.Active = 1
group by c.CookbookName

/*Cookbook details page:
Show for specific cookbook:
    a) Cookbook header: cookbook name, user, date created, price, number of recipes.*/
select c.CookbookName, u.Lastname, u.Firstname, c.DateCreated, c.Price, NumOfRecipes = count(cr.RecipeId)
from cookbook c 
join CookbookRecipe cr 
on c.CookbookId = cr.CookbookId
join Users u 
on u.UsersId = c.UsersId
where c.CookbookName = 'The Chefs Secret'
group by c.CookbookName, u.lastname, u.firstname, c.DateCreated, c.Price

---b) List of all recipes in the correct order. Include recipe name, cuisine and number of ingredients and steps.  Note: User will click on recipe to see all ingredients and steps.
select r.RecipeName, ct.CuisineName, NumOfIngredients = count(distinct ri.IngredientId), NumOfSteps = count(distinct p.StepDesc), c.cookbookname
from Recipe r 
join CuisineType ct  
on ct.CuisineId = r.CuisineId
join RecipeIngredient ri 
on r.RecipeId = ri.RecipeId
join PrepStep p 
on r.RecipeId = p.RecipeId
join CookbookRecipe cr 
on r.RecipeId = cr.CookbookRecipeId
join Cookbook c 
on c.CookbookId = cr.CookbookId
where c.CookbookName = 'The Chefs Secret'
group by r.RecipeName, ct.CuisineName, c.cookbookname, cr.[Sequence]
order by cr.[Sequence]

--For site administration:
--List of how many recipes each user created per status. Show 0 if none
select NumOfRecipesCreated = count(r.RecipeName),RecipeStatusName, u.Firstname, u.Lastname
from Users u 
left join Recipe r 
on u.UsersId = r.CreatedByUsersId
group  by RecipeStatusName, u.firstname , u.lastname
order by u.LastName

---List of how many meals each user created and whether they're active or inactive. Show 0 if none
select NumOfMealsCreated = count(distinct m.MealName), u.Firstname , u.Lastname,
Active = case
    when m.Active = 1 then 'Active'
    when m.Active = 0 then 'Inactive'
    else ''
end 
from Users u 
left join Meal m  
on u.UsersId = m.UsersId
group by u.firstname , u.lastname, m.Active
order by u.LastName

--List of how many cookbooks each user created and whether they're active or inactive. Show 0 if none
select NumOfCookbooksCreated = count(distinct c.CookbookName), u.Firstname, u.Lastname,
Active = case 
    when c.Active = 1 then 'Active'
    when c.Active = 0 then 'Inactive'
    else ''
end 
from Users u 
left join Cookbook c
on u.UsersId = c.UsersId
group by u.firstname, u.lastname, c.Active
order by u.LastName

--List of archived recipes that were never published.
select r.RecipeName from recipe r 
where r.RecipeStatusName = 'archived'
and r.DatePublished is null 

---For a specific company user:
--Show number of his/her recipes, meals and cookbooks. 
select u.Firstname, u.LastName, NumOfRecipes = Count(distinct r.recipename), NumOfMeals = count(distinct mc.MealId), NumOfCookbooks = Count(distinct cr.CookbookId)
from Recipe r
join Users u 
on u.UsersId = r.CreatedByUsersId
left join RecipeMealCourse rmc 
on r.RecipeId = rmc.RecipeId
left join MealCourse mc
on mc.MealCourseId = rmc.MealCourseId
left join CookbookRecipe cr 
on r.recipeId = cr.RecipeId
where u.LastName = 'Weiss' 
group by u.LastName, u.Firstname

---List of his/her recipes, display the status and the number of months between the status it's in and the one before that. Show null if recipe has the status drafted.
select r.RecipeName, r.RecipeStatusName, NumOfMonthsDiff = 
    case 
        when r.RecipeStatusName = 'Published' then DATEDIFF (month, r.DateCreated, r.DatePublished)
        when r.RecipeStatusName = 'Archived' and r.DatePublished is null then DATEDIFF (month, r.DateCreated, r.DateArchived)
        when r.RecipeStatusName = 'Archived'  then DATEDIFF (month, r.DatePublished, r.DateArchived)
        else null 
    end 
from Recipe r 
join Users u 
on u.UsersId = r.CreatedByUsersId
where u.lastname = 'Weiss'

---Count of his/her recipes per cuisine. Show 0 for none.
select NumOfRecipesPerCuisine = count(r.recipename), c.CuisineName, u.lastname, u.firstname
from Recipe r 
left join CuisineType c 
on c.CuisineId = r.CuisineId
join Users u 
on u.UsersId = r.CreatedByUsersId
where u.lastname = 'Weiss'
group by c.CuisineName, u.lastname, u.firstname

