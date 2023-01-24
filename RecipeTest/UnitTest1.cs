//using NUnit.Framework;
//using System.Data;
//using CPUFramework;
//using System.Data.SqlClient;
//using RecipeBizObjects;
//using Dapper;

//namespace RecipeTest
//{
//    public class Tests
//    {
//        int totalrecipe = 0;
//        string connstring = "";
//        int maxrecipenumcalories = 0;
//        int maxrecipeid = 0;
//        int recipewithcreatedbyusersid = 0;
//        int maxcuisineid = 0;
//        int maxcreatedbyusersid = 0;
//        [SetUp]
//        public void Setup()
//        {
//            connstring = DataUtility.SetConnectionString("srosenfeld.database.windows.net,1433", "RecipeDB", "srosenfeldadmin", "CPU123!@#");
//            DataTable dt = SQLUtility.GetDataTable(connstring, "select total = count(*) from recipe");
//            totalrecipe = (int)dt.Rows[0]["total"];

//            //code below without datatable and only dt / dt2 ?
//            dt = SQLUtility.GetDataTable(connstring, "select top 1 r.recipeId, r.recipename, r.NumCalories from recipe r order by r.recipeId desc");
//            maxrecipenumcalories = (int)dt.Rows[0]["NumCalories"];
//            maxrecipeid = (int)dt.Rows[0]["RecipeId"];

//            dt = SQLUtility.GetDataTable(connstring, "select top 1 * from CreatedByUsersId order by CreatedByUsersId desc");
//            recipewithcreatedbyusersid = (int)dt.Rows[0]["CreatedByUsersId"];
//            //dt = SQLUtility.GetDataTable(connstring, "select top 1 * from party p order by partyId desc");
//            //maxpartyid = (int)dt.Rows[0]["partyId"];
//        }

//        [Test]
//        public void TestRecipeList()
//        {
//            DataTable dt = DataService.GetRecipeList();
//            TestContext.WriteLine("Num Recipes " + dt.Rows.Count.ToString());
//            Assert.IsTrue(dt.Rows.Count == totalrecipe);
//        }
//        [Test]
//        public void TestCuisineTypeList()
//        {
//            DataTable dt = DataService.GetCuisineType();
//            TestContext.WriteLine("Number of CuisineType = " + dt.Rows.Count.ToString());
//            Assert.IsTrue(dt.Rows.Count == 6);
//        }
//        [Test]
//        public void TestLoadRecipe()
//        {
//            bizRecipe recipe = bizRecipe.Get(maxrecipeid);
//            TestContext.WriteLine("Recipe FullDescription = " + recipe.FullDescription());
//            Assert.IsTrue(recipe.NumCalories == maxrecipenumcalories);
//        }
//        [Test]
//        public void TestNewRecipe()
//        {
//            bizRecipe recipe = new bizRecipe();
//            recipe.RecipeName = "Boston Cream Pie";
//            recipe.CuisineId = maxcuisineid;
//            recipe.CreatedByUsersId = maxcreatedbyusersid;
//            recipe.NumCalories = 45;
//            recipe.NumOfIngredients = 5;
//            recipe.NumOfSteps = 4;
//            recipe.RecipeStatusName = "Draft";
//            recipe.Save();
//            TestContext.WriteLine("New recipe num = " + recipe.NumCalories.ToString() + ".Should be " + (maxrecipenumcalories + 1));
//            Assert.IsTrue(recipe.CreatedByUsersId == maxcreatedbyusersid + 1);
//        }
//        [Test]
//        public void TestChangeNumCalories()
//        {
//            bizRecipe recipe = bizRecipe.Get(maxrecipeid);
//            recipe.NumCalories = recipe.NumCalories = 0;
//            Assert.Throws<CPUException>(() => recipe.Save(), "Num of calories cannot be zero when cuisine type is not Zero Calorie");

//            TestContext.WriteLine(recipe.FullDescription());
//        }
//        [Test]
//        public void TestDeleteRecipeWithCreatedByUsersId()
//        {
//            bizRecipe recipe = bizRecipe.Get(recipewithcreatedbyusersid);
//            recipe.Delete();
//            Assert.Throws<CPUException>(() => recipe.Delete());
//        }
//    }
//}