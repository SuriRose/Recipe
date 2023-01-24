--AS Great job! 100% 
use RecipeDB
go
delete CookbookRecipe
delete Cookbook
delete RecipeMealCourse
delete MealCourse
delete Meal
delete PrepStep
delete RecipeIngredient
delete Recipe
delete Course
delete Users
delete CuisineType
delete MeasurementType
delete Ingredient
go

insert Ingredient(IngredientName)
select 'Sugar'
union select 'Salt' 
union select 'Black Pepper'
union select 'Spices'
union select 'Oil'
union select 'Chili Sauce'
union select 'Soy Sauce'
union select 'Broccoli'
union select 'Egg'
union select 'Ginger'
union select 'Spaghetti'
union select 'Black olives'
union select 'Red Cabbage'
union select 'Scallion'
union select 'Garlic'
union select 'Avocado'
union select 'Carrot'
union select 'chicken cutlets'
union select 'Romaine Lettuce'
union select 'Lemon Juice'
union select 'Water'
union select 'Plum'
union select 'Frozen strawberries'
union select 'Yogurt'
union select 'Orange Juice'
union select 'Feta Cheese'
union select 'Onion'
union select 'Sea trout fillet'
union select 'Cucumber'
union select 'Penne'
union select 'Vodka'
union select 'Tomato Sauce'
union select 'Parmesan  Cheese'
union select 'Basil'
union select 'Cherry Tomatoes'
union select 'Nish Nosh Crackers'
union select 'Tortilla Wrap'
union select 'Whip Cream'
union select 'Cinnamon'
union select 'Strawberries'
union select 'Flatbread'
union select 'Spinach'

insert MeasurementType (MeasurementName)
select 'Ounce'
union select 'Cup'
union select 'Teaspoon'
union select 'Tablespoon'
union select 'Dash'
union select 'Pound'

insert Users(Firstname, LastName, [Password])
select 'Rikki','Gold', 'GoldRikkih#67'
union select 'Breindy', 'Fried', 'BFried39'
union select 'Miriam', 'Weiss', 'MW9457!'
union select 'Dina', 'Davidson', '7694DD'
union select 'Dini', 'Klein' , 'DKlein7650'
union select 'Esther', 'Diamond', 'EDiamond#2300'

insert CuisineType(CuisineName)
select 'Thai'
union select 'Italian'
union select 'French'
union select 'Mediterranean'
union select 'Greek'
union select 'Zero Calorie'

insert Recipe(CuisineId, CreatedByUsersId, RecipeName, NumCalories,DateCreated, DatePublished, DateArchived, ImageCode)
select (select c.CuisineId from CuisineType c where c.CuisineName = 'Italian'), (select c.UsersId from Users c where c.LastName = 'Davidson'), 'Broccoli Soup', 110, '2022/01/19', null, null, 'BS123'
union select (select CuisineId from CuisineType c where c.CuisineName = 'Thai'), (select c.UsersId from Users c where c.LastName = 'Weiss'), 'Chicken Cutlets', 104,'2020/02/11', '2022/03/01', null, 'CC456'
union select (select c.CuisineId from CuisineType c where c.CuisineName = 'Mediterranean'), (select c.UsersId from Users c where c.LastName = 'Fried'), 'Romaine Lettuce Salad', 104,'2020/05/16', '2020/06/16', null, 'RLS78'
union select (select c.CuisineId from CuisineType c where c.CuisineName = 'Thai'), (select c.UsersId from Users c where c.LastName = 'Fried'), 'Thai Chili Broccoli', 104,'2020/02/21', '2020/02/29', null, 'TCB91'
union select (select c.CuisineId from CuisineType c where c.CuisineName = 'Italian'), (select c.UsersId from Users c where c.LastName = 'Davidson'), 'Plum Granita', 104, '2020/01/15', '2020/01/24', null, 'PG100'
union select (select c.CuisineId from CuisineType c where c.CuisineName = 'Greek'), (select c.UsersId from Users c where c.LastName = 'Gold'), 'Baked Sea Trout', 112, '2021/11/11', '2021/12/10', null, 'BST101'
union select (select c.CuisineId from CuisineType c where c.CuisineName = 'Greek'), (select c.UsersId from Users c where c.LastName = 'Klein' ), 'Greek Salad', 90, '2020/04/24', '2020/04/28', null, 'GS102'
union select (select c.CuisineId from CuisineType c where c.CuisineName = 'Mediterranean'), (select c.UsersId from Users c where c.LastName = 'Fried'),'Strawberry Smoothie', 130, '2019/06/22', null, '2022/03/09', 'SS103'
union select (select c.CuisineId from CuisineType c where c.CuisineName = 'French'), (select c.UsersId from Users c where c.LastName = 'Gold'), 'Feta and Spinach Flatbread', 298, '2022/01/11', null, null , 'FSF104'
union select (select c.CuisineId from CuisineType c where c.CuisineName = 'Italian'), (select c.UsersId from Users c where c.LastName = 'Diamond'), 'Penne a la vodka', 200, '2021/02/14', '2022/03/10', null , 'PALV105'
union select (select c.CuisineId from CuisineType c where c.CuisineName = 'Mediterranean'), (select c.UsersId from Users c where c.LastName = 'Weiss'), 'Nish Nosh Salad', 108, '2019/08/23', null, '2022/03/13' , 'NNS106'
union select (select c.CuisineId from CuisineType c where c.CuisineName = 'French'), (select c.UsersId from Users c where c.LastName = 'Gold'), 'Fruit Filled Crepes', 123, '2021/10/12', null, null , 'FFC107'

insert RecipeIngredient(IngredientId, RecipeId, MeasurementTypeId, MeasurementQuantity, [Sequence])
select IngredientId, RecipeId, MeasurementTypeId,1 , 1 
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Chicken'
and r.RecipeName = 'Chicken Cutlets'
and m.MeasurementName = 'Pound'
union select IngredientId, RecipeId, MeasurementTypeId,1 , 1 
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'garlic'
and r.RecipeName = 'Chicken Cutlets'
and m.MeasurementName = 'tablespoon'
union select IngredientId, RecipeId, MeasurementTypeId, 1.2, 1 
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'black pepper'
and r.RecipeName = 'Chicken Cutlets'
and m.MeasurementName = 'tablespoon'
union select IngredientId, RecipeId, MeasurementTypeId,1 , 1 
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'soy sauce'
and r.RecipeName = 'Chicken Cutlets'
and m.MeasurementName = 'teaspoon'
union select IngredientId, RecipeId, MeasurementTypeId, 8, 1 
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Romaine Lettuce'
and r.RecipeName = 'Romaine Lettuce Salad'
and m.MeasurementName = 'Ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 6, 2
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Avocado'
and r.RecipeName = 'Romaine Lettuce Salad'
and m.MeasurementName = 'Ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 1, 3 
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Carrrot'
and r.RecipeName = 'Romaine Lettuce Salad'
and m.MeasurementName = 'Cup'
union select IngredientId, RecipeId, MeasurementTypeId, 12, 4 
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Red Cabbage'
and r.RecipeName = 'Romaine Lettuce Salad'
and m.MeasurementName = 'Ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 32, 1 
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Broccoli'
and r.RecipeName = 'Thai Chili Broccoli'
and m.MeasurementName = 'Ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 1.2, 1 
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'sesame oil'
and r.RecipeName = 'Thai Chili Broccoli'
and m.MeasurementName = 'cup'
union select IngredientId, RecipeId, MeasurementTypeId, 1.2, 1 
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'chili sauce'
and r.RecipeName = 'Thai Chili Broccoli'
and m.MeasurementName = 'cup'
union select IngredientId, RecipeId, MeasurementTypeId, 1.2, 1 
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'soy sauce'
and r.RecipeName = 'Thai Chili Broccoli'
and m.MeasurementName = 'cup'
union select IngredientId, RecipeId, MeasurementTypeId, 2, 1 
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'water'
and r.RecipeName = 'Plum Granita'
and m.MeasurementName = 'cup'
union select IngredientId, RecipeId, MeasurementTypeId, 3.4, 1 
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'sugar'
and r.RecipeName = 'Plum Granita'
and m.MeasurementName = 'cup'
union select IngredientId, RecipeId, MeasurementTypeId, 1, 1 
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'plum'
and r.RecipeName = 'Plum Granita'
and m.MeasurementName = 'cup'
union select IngredientId, RecipeId, MeasurementTypeId, 14, 1 
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'frozen strawberries'
and r.RecipeName = 'Strawberry Smoothie'
and m.MeasurementName = 'ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 2, 2 
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'yogurt'
and r.RecipeName = 'Strawberry Smoothie'
and m.MeasurementName = 'cup'
union select IngredientId, RecipeId, MeasurementTypeId, 1, 3
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'orange juice'
and r.RecipeName = 'Strawberry Smoothie'
and m.MeasurementName = 'cup'
union select IngredientId, RecipeId, MeasurementTypeId, 2, 1
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'cherry tomatoes'
and r.RecipeName = 'greek salad'
and m.MeasurementName = 'cup'
union select IngredientId, RecipeId, MeasurementTypeId, 11, 2
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'cucumber'
and r.RecipeName = 'greek salad'
and m.MeasurementName = 'ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 8, 3
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'feta cheese'
and r.RecipeName = 'greek salad'
and m.MeasurementName = 'ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 3, 4
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'romaine lettuce'
and r.RecipeName = 'greek salad'
and m.MeasurementName = 'cup'
union select IngredientId, RecipeId, MeasurementTypeId, 4, 5
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'red onion'
and r.RecipeName = 'greek salad'
and m.MeasurementName = 'ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 2, 1
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'cherry totmatoes'
and r.RecipeName = 'Baked sea trout'
and m.MeasurementName = 'cup'
union select IngredientId, RecipeId, MeasurementTypeId, 1.2, 1
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'onion'
and r.RecipeName = 'Baked sea trout'
and m.MeasurementName = 'cup'
union select IngredientId, RecipeId, MeasurementTypeId, 1.3, 1
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'oil'
and r.RecipeName = 'Baked sea trout'
and m.MeasurementName = 'cup'
union select IngredientId, RecipeId, MeasurementTypeId, 2, 1
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'sea trout fillet'
and r.RecipeName = 'Baked sea trout'
and m.MeasurementName = 'pound'
union select IngredientId, RecipeId, MeasurementTypeId, 1.4, 1
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'black pepper'
and r.RecipeName = 'Baked sea trout'
and m.MeasurementName = 'teaspoon'
union select IngredientId, RecipeId, MeasurementTypeId, 1.4, 1
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'salt'
and r.RecipeName = 'Baked sea trout'
and m.MeasurementName = 'teaspoon'
union select IngredientId, RecipeId, MeasurementTypeId, 2, 1
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'black olives'
and r.RecipeName = 'Baked sea trout'
and m.MeasurementName = 'teaspoon'
union select IngredientId, RecipeId, MeasurementTypeId, 2, 1
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'oil'
and r.RecipeName = 'Penne a la vodka'
and m.MeasurementName = 'tablespoon'
union select IngredientId, RecipeId, MeasurementTypeId, 8, 2
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'onion'
and r.RecipeName = 'Penne a la vodka'
and m.MeasurementName = 'ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 3.4, 3
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'vodka'
and r.RecipeName = 'Penne a la vodka'
and m.MeasurementName = 'cup'
union select IngredientId, RecipeId, MeasurementTypeId, 29, 4
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Tomato sauce'
and r.RecipeName = 'Penne a la vodka'
and m.MeasurementName = 'ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 1.2, 5
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Parmesan  Cheese'
and r.RecipeName = 'Penne a la vodka'
and m.MeasurementName = 'cup'
union select IngredientId, RecipeId, MeasurementTypeId, 16, 6
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Penne'
and r.RecipeName = 'Penne a la vodka'
and m.MeasurementName = 'ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 1.2, 7
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Basil'
and r.RecipeName = 'Penne a la vodka'
and m.MeasurementName = 'cup'
union select IngredientId, RecipeId, MeasurementTypeId, 2, 1
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Romaine lettuce'
and r.RecipeName = 'Nish Nosh Salad'
and m.MeasurementName = 'cup'
union select IngredientId, RecipeId, MeasurementTypeId, 16, 2
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Cherry Tomatoes'
and r.RecipeName = 'Nish Nosh Salad'
and m.MeasurementName = 'ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 1.2, 3
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'onion'
and r.RecipeName = 'Nish Nosh Salad'
and m.MeasurementName = 'cup'
union select IngredientId, RecipeId, MeasurementTypeId, 11, 4
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Nish Nosh Crackers'
and r.RecipeName = 'Nish Nosh Salad'
and m.MeasurementName = 'ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 10, 1
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Broccoli'
and r.RecipeName = 'Broccoli Soup'
and m.MeasurementName = 'ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 3, 2
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Squash'
and r.RecipeName = 'Broccoli Soup'
and m.MeasurementName = 'cup'
union select IngredientId, RecipeId, MeasurementTypeId, 5, 3
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'onion'
and r.RecipeName = 'Broccoli Soup'
and m.MeasurementName = 'ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 60, 1
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Tortilla wrap'
and r.RecipeName = 'Fruit Filled Crepes'
and m.MeasurementName = 'ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 13, 2
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Whip cream'
and r.RecipeName = 'Fruit Filled Crepes'
and m.MeasurementName = 'ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 16, 3
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Strawberries'
and r.RecipeName = 'Fruit Filled Crepes'
and m.MeasurementName = 'ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 1.3, 4
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Sugar'
and r.RecipeName = 'Fruit Filled Crepes'
and m.MeasurementName = 'cup'
union select IngredientId, RecipeId, MeasurementTypeId, 1, 5
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Cinnamon'
and r.RecipeName = 'Fruit Filled Crepes'
and m.MeasurementName = 'tablespoon'
union select IngredientId, RecipeId, MeasurementTypeId, 8, 3
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Feta Cheese'
and r.RecipeName = 'Feta and Spinach Flatbread'
and m.MeasurementName = 'ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 10, 4
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Spinach'
and r.RecipeName = 'Feta and Spinach Flatbread'
and m.MeasurementName = 'ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 50, 5
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Flatbread'
and r.RecipeName = 'Feta and Spinach Flatbread'
and m.MeasurementName = 'ounce'
union select IngredientId, RecipeId, MeasurementTypeId, 2, 6
from Ingredient i 
cross join Recipe r 
cross join MeasurementType m
where i.IngredientName = 'Basil'
and r.RecipeName = 'Feta and Spinach Flatbread'
and m.MeasurementName = 'cup'

insert PrepStep(RecipeId, [Sequence], StepDesc)
select r.RecipeId, 1, 'Place the chicken cutlets in a baking pan. In a small bowl, combine soy sauce, garlic, and black pepper. Pour over chicken. Let marinate 15 minutes.' 
from Recipe r 
where r.RecipeName = 'Chicken Cutlets'
union select RecipeId, 2, 'Preheat oven to broil. Broil chicken for six minutes on each side. Remove from oven and let cool. Cut into cubes and set aside.'
from Recipe r 
where r.RecipeName = 'Chicken Cutlets'
union select r.RecipeId, 1, 'In a large bowl, combine lettuce, red cabbage, scallions, carrots, and avocado'
from Recipe r 
where r.RecipeName = 'Romaine Lettuce Salad'
union select r.recipeId, 1, 'Heat the sesame oil in a large frying pan over medium heat and add the broccoli. Cover and let steam until bright green and can be pieced easily with a fork, about 10 minutes.'
from Recipe r 
where r.RecipeName = 'Thai Chili Broccoli'
union select r.recipeId, 2,	'Combine the rest of the ingredients and pour over the broccoli. Cook uncovered for another three minutes.'
from Recipe r
where r.RecipeName = 'Thai Chili Broccoli'
union select r.RecipeId, 1, 'Mix together the plum puree and sugar. Pour this mixture into a loaf pan. Place the pan in the freezer.'
from Recipe r 
where r.RecipeName = 'Plum granita'
union select r.RecipeId, 2, 'After 30–60 minutes, take a fork and fluff up the ice crystals that have formed on the top of the mixture. Return the pan to the freezer and repeat this every 30 minutes or so.'
from Recipe r 
where r.RecipeName = 'Plum granita'
union select r.recipeId, 1, 'Heat 1/3 cup olive oil in a large frying pan over medium heat. Add the onions, and garlic. Cook, stirring occasionally.'
from recipe r 
where r.RecipeName = 'Baked sea trout'
union select r.recipeId, 2, 'Remove from the heat and stir in the black olives. Taste and add salt and pepper.'
from recipe r 
where r.RecipeName = 'Baked sea trout'
union select r.recipeId, 3, 'Spoon the sauce over the fish, making sure to cover it completely. Bake for about 20 minutes or until the fish flakes and is done.'
from recipe r 
where r.RecipeName = 'Baked sea trout'
union select r.recipeId, 4, 'Preheat the oven to 350 degrees Fahrenheit. Coat the bottom of a baking dish with a little olive oil. Place the fish in the dish, skin-side down.'
from recipe r 
where r.RecipeName = 'Baked sea trout'
union select r.recipeId, 1, 'Dice the cherry tomatoes, cucumber, red onion and feta cheese.'
from recipe r
where r.RecipeName = 'Greek Salad'
union select r.recipeId, 2,'In a large salad bowl, combine the tomatoes, cucumber, onion, pepper, olives, and cheese'
from recipe r 
where r.RecipeName = 'Greek Salad'
union select r.recipeId, 1, 'Place all ingredients in a large powerful blender and blend until smooth.'
from Recipe r 
where r.RecipeName = 'Strawberry Smoothie'
union select r.recipeId, 1, 'Cook Penne according to package instructions'
from Recipe r 
where r.RecipeName = 'Penne a la Vodka'
union select r.recipeId, 2, 'Heat oil over medium flame'
from Recipe r 
where r.RecipeName = 'Penne a la Vodka'
union select r.recipeId, 3, 'Sauté onion add vodka and Tomato sauce'
from Recipe r 
where r.RecipeName = 'Penne a la Vodka'
union select r.recipeId, 4, 'Add parmesan cheese and basil. Stir to combine. Toss with hot penne to serve.'
from Recipe r 
where r.RecipeName = 'Penne a la Vodka'
union select r.recipeId, 1, 'Chop cherry tomatoes in half and dice the onions'
from Recipe r 
where r.RecipeName = 'Nish Nosh Salad'
union select r.recipeId, 2, 'Combine all ingredients and toss with dressing.'
from Recipe r 
where r.RecipeName = 'Nish Nosh Salad'
union select r.recipeId, 1, 'Sauté onions in oil until translucent'
from Recipe r 
where r.RecipeName = 'Broccoli Soup'
union select r.recipeId, 2, 'Chop the squash and add it with the broccoli and cook for three hours, season with salt and pepper.'
from Recipe r 
where r.RecipeName = 'Broccoli Soup'
union select r.recipeId, 1, 'Combine the whip cream, sugar, and cinnamon. Pulse with a blender until smooth.'
from Recipe r 
where r.RecipeName = 'fruit Filled Crepes'
union select r.recipeId, 2, 'Add strawberries and place two tablespoons of the mixture on the wraps.'
from Recipe r 
where r.RecipeName = 'fruit Filled Crepes'
union select r.recipeId, 3, 'Roll up the wraps and top the wraps with remaining mixture and fruit.'
from Recipe r 
where r.RecipeName = 'Fruit Filled Crepes'
union select r.recipeId, 1, 'Combine all ingredients. Place cheese mixture and toppings onto the Flatbread.'
from Recipe r 
where r.RecipeName = 'Feta and Spinach Flatbread'
union select r.recipeId, 2, 'Bake for approximately 10 minutes until cheese has melted.'
from Recipe r 
where r.RecipeName = 'Feta and Spinach Flatbread'

insert Course(CourseName, [Sequence])
select 'Appetizer', 1
union select 'Soup', 2
union select 'Main', 3
union select 'Dessert', 5

insert Meal(UsersId, MealName, DateCreated)
select c.UsersId, 'Occasions', '01/12/2022' from Users c where c.LastName = 'Davidson'
union select c.UsersId, 'Chanukah Meal', '01/04/2021' from Users c where c.LastName = 'Weiss'
union select c.UsersId, 'Birthday Celebration', '09/10/2020' from Users c where c.LastName = 'Gold'

insert MealCourse(CourseId, MealId)
select CourseId, MealId
from Course c 
cross join Meal m 
where c.CourseName = 'Soup'
and m.MealName = 'Occasions'
union select CourseId, MealId
from Course c 
cross join Meal m 
where c.CourseName = 'main'
and m.MealName = 'Occasions'
union select CourseId, MealId
from Course c 
cross join Meal m 
where c.CourseName = 'Main'
and m.MealName = 'Occasions'
union select CourseId, MealId
from Course c 
cross join Meal m
where c.CourseName ='main'
and m.MealName = 'Occasions'
union select CourseId, MealId
from Course c 
cross join Meal m 
where c.CourseName = 'Dessert'
and m.MealName = 'Occasions'
union select CourseId, MealId
from Course c 
cross join Meal m 
where c.CourseName = 'Main'
and m.MealName = 'Chanukah Meal'
union select CourseId, MealId
from Course c 
cross join Meal m 
where c.CourseName = 'Dessert'
and m.MealName = 'Chanukah Meal'
union select CourseId, MealId
from Course c 
cross join Meal m 
where c.CourseName = 'Appetizer'
and m.MealName = 'Birthday Celebration'
union select CourseId, MealId
from Course c 
cross join Meal m 
where c.CourseName = 'Main'
and m.MealName = 'Birthday Celebration'
union select CourseId, MealId
from Course c 
cross join Meal m 
where c.CourseName = 'Main'
and m.MealName = 'Birthday Celebration'
union select CourseId, MealId
from Course c 
cross join Meal m 
where c.CourseName = 'Dessert'
and m.MealName = 'Birthday Celebration'

Insert RecipeMealCourse(RecipeId, MealCourseId, MainDish)
select RecipeId, MealCourseId, 0
from Recipe r 
cross join Meal m 
join MealCourse mc 
on m.MealId = mc.MealId
join Course c 
on c.CourseId = mc.CourseId 
where r.RecipeName = 'Broccoli Soup'
and m.MealName = 'Occasions'
and c.CourseName = 'Soup'
union select RecipeId, MealCourseId, 1
from Recipe r 
cross join Meal m 
join MealCourse mc 
on m.MealId = mc.MealId
join Course c 
on c.CourseId = mc.CourseId 
where r.RecipeName = 'Chicken Cutlets'
and m.MealName = 'Occasions'
and c.CourseName = 'Main'
union select RecipeId, MealCourseId, 0
from Recipe r  
cross join Meal m 
join MealCourse mc 
on m.MealId = mc.MealId
join Course c 
on c.CourseId = mc.CourseId 
where r.RecipeName = 'Romaine Lettuce Salad'
and m.MealName = 'Occasions'
and c.CourseName = 'Main'
union select RecipeId, MealCourseId, 0 
from Recipe r  
cross join Meal m 
join MealCourse mc 
on m.MealId = mc.MealId
join Course c 
on c.CourseId = mc.CourseId  
where r.RecipeName = 'Thai Chili Broccoli'
and m.MealName = 'Occasions'
and c.CourseName ='Main'
union select RecipeId, MealCourseId, 0 
from Recipe r 
cross join Meal m 
join MealCourse mc 
on m.MealId = mc.MealId
join Course c 
on c.CourseId = mc.CourseId 
where r.RecipeName = 'Plum granita'
and m.MealName = 'Occasions'
and c.CourseName = 'Dessert'
union select RecipeId, MealCourseId, 1
from Recipe r 
cross join Meal m 
join MealCourse mc 
on m.MealId = mc.MealId
join Course c 
on c.CourseId = mc.CourseId 
where r.RecipeName = 'Baked sea trout'
and m.MealName = 'Chanukah Meal'
and c.CourseName = 'Main'
union select RecipeId, MealCourseId, 0
from Recipe r 
cross join Meal m 
join MealCourse mc 
on m.MealId = mc.MealId
 join Course c 
 on c.CourseId = mc.CourseId
where r.RecipeName = 'Greek Salad'
and m.MealName = 'Chanukah Meal'
and c.CourseName = 'Main'
union select RecipeId, MealCourseId, 0 
from Recipe r 
cross join Meal m 
join MealCourse mc 
on m.MealId = mc.MealId
join Course c 
on c.CourseId = mc.CourseId
where r.RecipeName = 'Strawberry Smoothie'
and m.MealName = 'Chanukah Meal'
and c.CourseName = 'Dessert'
union select RecipeId, MealCourseId, 1
from Recipe r 
cross join Meal m 
join MealCourse mc 
on m.MealId = mc.MealId
join Course c 
on c.CourseId = mc.CourseId
where r.RecipeName = 'Penne a la vodka'
and m.MealName = 'Birthday Celebration'
and c.CourseName = 'Main'
union select RecipeId, MealCourseId, 0
from Recipe r 
cross join Meal m 
join MealCourse mc 
on m.MealId = mc.MealId
join Course c 
on c.CourseId = mc.CourseId 
where r.RecipeName = 'Nish Nosh Salad'
and m.MealName = 'Birthday Celebration'
and c.CourseName = 'Main'
union select RecipeId, MealCourseId, 0
from Recipe r  
cross join Meal m 
join MealCourse mc 
on m.MealId = mc.MealId
join Course c 
on c.CourseId = mc.CourseId 
where r.RecipeName = 'Fruit Filled Crepes'
and m.MealName = 'Birthday Celebration'
and c.CourseName = 'Dessert'

insert Cookbook(UsersId, CookbookName, Price, DateCreated)
select c.UsersId, 'The Chefs Secret' , 42.99, '01/08/2022' from Users c where c.Lastname = 'Fried'
union select c.UsersId, 'Dining In' , 38.99, '06/12/2020' from Users c where c.Lastname = 'Klein' 

insert CookbookRecipe(RecipeId, CookbookId, [Sequence])
select RecipeId, CookbookId, 1
from Recipe r 
cross join Cookbook c 
where c.CookbookName = 'The Chefs Secret'
and r.RecipeName = 'Chicken Cutlets'
union select RecipeId, CookbookId, 2
from Recipe r 
cross join Cookbook c 
where c.CookbookName = 'The Chefs Secret'
and r.RecipeName = 'Romaine Lettuce Salad'
union select RecipeId, CookbookId, 3
from Recipe r 
cross join Cookbook c 
where c.CookbookName = 'The Chefs Secret'
and r.RecipeName = 'Thai Chili Broccoli'
union select RecipeId, CookbookId, 4
from Recipe r 
cross join Cookbook c 
where c.CookbookName = 'The Chefs Secret'
and r.RecipeName = 'Plum Granita'
union select RecipeId, CookbookId, 5
from Recipe r 
cross join Cookbook c 
where c.CookbookName = 'The Chefs Secret'
and r.RecipeName = 'Dining In'
union select RecipeId, CookbookId, 6
from Recipe r 
cross join Cookbook c 
where c.CookbookName = 'The Chefs Secret'
and r.RecipeName = 'Greek Salad'
union select RecipeId, CookbookId, 7
from Recipe r 
cross join Cookbook c 
where c.CookbookName = 'Dining In'
and r.RecipeName = 'Strawberry Smoothie'
union select RecipeId, CookbookId, 1
from Recipe r 
cross join Cookbook c 
where c.CookbookName = 'Dining In'
and r.RecipeName = 'Feta and Spinach Flatbread'
union select RecipeId, CookbookId, 2
from Recipe r 
cross join Cookbook c 
where c.CookbookName = 'Dining In'
and r.RecipeName = 'Penne a la Vodka'
union select RecipeId, CookbookId, 3
from Recipe r 
cross join Cookbook c 
where c.CookbookName = 'Dining In'
and r.RecipeName = 'Nish Nosh Salad'
union select RecipeId, CookbookId, 4
from Recipe r 
cross join Cookbook c 
where c.CookbookName = 'Dining In'
and r.RecipeName = 'Broccoli Soup'
union select RecipeId, CookbookId, 5
from Recipe r 
cross join Cookbook c 
where c.CookbookName = 'Dining In'
and r.RecipeName = 'Fruit Filled Crepes'

