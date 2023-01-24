using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using CPUFramework;
using RecipeBizObjects;
using System.Data;
using NUnit.Framework;
using System.Data.SqlClient;
namespace RecipeTest
{//
    internal class DapperTest
    {
        int totalrecipe = 0;
        string connstring = "";
        int maxrecipenumcalories = 0;
        int maxrecipeid = 0;
        int maxcuisineId = 0;
        int maxcreatedbyusersId = 0;

        [SetUp]
        public void Setup()
        {
            connstring = DataUtility.SetConnectionString("srosenfeld.database.windows.net,1433", "RecipeDB", "srosenfeldadmin", "CPU123!@#");
            DataTable dt = SQLUtility.GetDataTable(connstring, "select total = count(*)from recipe");
            totalrecipe = (int)dt.Rows[0]["total"];

            dt = SQLUtility.GetDataTable(connstring, "select top 1 r.recipeId, r.recipename, r.numCalories from recipe r order by r.NumCalories desc");
            maxrecipenumcalories = (int)dt.Rows[0]["NumCalories"];
            maxrecipeid = (int)dt.Rows[0]["RecipeId"];

            dt = SQLUtility.GetDataTable(connstring, "select top 1 r.recipeId, r.recipename, r.NumCalories, ct.CuisineId from recipe r join CuisineType ct on ct.CuisineId = r.CuisineId order by r.NumCalories desc");
            maxcuisineId = (int)dt.Rows[0]["CuisineId"];

            dt = SQLUtility.GetDataTable(connstring, "select top 1 r.recipeId, r.recipename, u.UsersId from recipe r join Users u on u.UsersId = r.CreatedByUsersId");
            maxcreatedbyusersId = (int)dt.Rows[0]["UsersId"];
        }
        //load
        private bizRecipe LoadRecipe(int Id)
        {
            bizRecipe recipe = bizRecipe.Get(Id);

            return recipe;
        }

        //load list
        private List<bizRecipe> LoadListRecipe()
        {
            return bizRecipe.GetAll();
        }
        //insert 
        private bizRecipe InsertNewRecipe()
        {
            bizRecipe recipe = new bizRecipe();
            recipe.CreatedByUsersId = maxcreatedbyusersId;
            recipe.CuisineId = maxcuisineId;
            recipe.RecipeName = "Passion Fruit Shake";
            recipe.DateCreated = System.DateTime.Now;
            recipe.DatePublished = System.DateTime.Now;
            recipe.DateArchived = null;
            recipe.NumCalories = 80;
            recipe.NumOfIngredients = 4;
            recipe.NumOfSteps = 3;
            recipe.ImageCode = "Test128";

            recipe.Save();
            return recipe;
        }

        //update
        private void ChangeRecipe()
        {
            bizRecipe recipe = new bizRecipe();
            recipe.RecipeName = "Plum Granita";
            recipe.CreatedByUsersId = maxcreatedbyusersId;
            recipe.CuisineId = maxcuisineId;
            recipe.DateCreated = System.DateTime.Now;
            recipe.DatePublished = System.DateTime.Now;
            recipe.DateArchived = null;
            recipe.NumCalories = 77;
            recipe.NumOfIngredients = 4;
            recipe.NumOfSteps = 3;
            recipe.ImageCode = "Test146";
            recipe.Save();
        }
        //update
        private void SwapRecipeName(bizRecipe recipe)
        {
            string recipename = recipe.RecipeName;
            string recipestatusname = recipe.RecipeStatusName;
            recipe.RecipeName = recipestatusname;
            recipe.RecipeStatusName = recipename;
            recipe.Save();
        }
        //delete
        private int DeleteRecipe(int Id = 0)
        {
            bizRecipe r;
            if (Id == 0)
            {

                r = this.InsertNewRecipe();
            }
            else
            {
                r = this.LoadRecipe(Id);
            }
            int id = r.RecipeId;
            r.Delete();
            return id;
        }
        [Test]
        public void TestLoadRecipeList()
        {
            List<bizRecipe> lst = this.LoadListRecipe();
            TestContext.WriteLine("Number of recipes = " + lst.Count);
            Assert.IsTrue(lst.Count == totalrecipe);
        }
        [Test]
        public void TestLoadRecipe()
        {
            bizRecipe r = this.LoadRecipe(maxrecipeid);
            TestContext.WriteLine(r.FullDescription());
            Assert.IsTrue(r.NumCalories == maxrecipenumcalories);
        }
        [Test]
        public void TestInsertNewrecipe()
        {
            bizRecipe r = this.InsertNewRecipe();
            TestContext.WriteLine("Expected RecipeId = " + (maxrecipeid) + " Value = " + r.RecipeId);
            TestContext.WriteLine("Expected NumCalories = " + (maxrecipenumcalories + 1) + " Value = " + r.NumCalories);
            Assert.IsTrue(r.RecipeId < maxrecipenumcalories);
        }
        [Test]
        public void TestUpdateRecipe()
        {
            bizRecipe recipe = this.LoadRecipe(maxrecipeid);
            string recipename = recipe.RecipeName;
            string recipestatusname = recipe.RecipeStatusName;
            this.SwapRecipeName(recipe);
            recipe = this.LoadRecipe(maxrecipeid);
            TestContext.WriteLine("Original " + recipename + " " + recipestatusname + " Current " + recipe.RecipeName + " " + recipe.RecipeStatusName);
            Assert.IsTrue(recipe.RecipeName == recipestatusname && recipe.RecipeStatusName == recipename);
        }
        [Test]
        public void TestDeleteNewRecipe()
        {
            int id = this.DeleteRecipe();
            bizRecipe r = this.LoadRecipe(id);
            Assert.IsTrue(r.RecipeId == 0);
        }
        [Test]
        public void TestChangeRecipe()
        {
            CPUException? ex = Assert.Throws<CPUException>(() => this.ChangeRecipe());
            TestContext.WriteLine(ex?.FriendlyMessage);
        }
        [Test]
        public void TestSearchRecipe()
        {
            List<bizRecipe> lst = bizRecipe.Search("Baked Sea Trout");
            TestContext.WriteLine("list count = " + lst.Count.ToString());
            Assert.IsTrue(lst.Count == 1);
        }
    }
}