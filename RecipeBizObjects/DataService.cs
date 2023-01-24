using System.Data;
using System.Data.SqlClient;
using CPUFramework;

namespace RecipeBizObjects
{
    public static class DataService
    {
        //private static string connstring = "Server=.\\SQLExpress;Initial Catalog=RecipeDB;Trusted_Connection=yes;";
        //public static string SetConnectionString(string servername, string databasename, string username, string password)
        //{
        //    connstring = "Server=tcp:" + servername +
        //        ";Initial Catalog=" + databasename +
        //        ";Persist Security Info=False;User ID=" + username +
        //        ";Password=" + password +
        //        ";MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30";
        //    using (SqlConnection conn = new SqlConnection(connstring))
        //    {
        //        conn.Open();
        //    }
        //    return connstring;
        //}
        //internal static string ConnectionString
        //{
        //    get => connstring;
        //}
        public static DataTable GetRecipeCount()
        {
            //SqlCommand cmd = SQLUtility.GetSqlCommand(connstring, "RecipeCountGet");
            //cmd.Parameters["@MealId"].Value = true; 
            //cmd.Parameters["@All"].Value = true;
            //return SQLUtility.GetDataTable(cmd);
            return SQLUtility.GetDataTableFromSproc(DataUtility.ConnectionString, "RecipeCountGet");
        }
        public static DataTable GetRecipeList()
        {
            return SQLUtility.GetDataTableFromSproc(DataUtility.ConnectionString, "RecipeListGet");
        }
        public static DataTable GetRecipeDetail(int RecipeId)
        {
            SqlCommand cmd = SQLUtility.GetSqlCommand(DataUtility.ConnectionString, "RecipeGet");
            cmd.Parameters["@RecipeId"].Value = RecipeId;
            return SQLUtility.GetDataTable(cmd, DataUtility.ConnectionString);
        }

        public static DataTable GetIngredientDetail(int RecipeId)
        {
            SqlCommand cmd = SQLUtility.GetSqlCommand(DataUtility.ConnectionString, "IngredientDetailGet");
            cmd.Parameters["@RecipeId"].Value = RecipeId;
            return SQLUtility.GetDataTable(cmd, DataUtility.ConnectionString);
        }
        public static DataTable GetPrepStepDesc(int RecipeId)
        {
            SqlCommand cmd = SQLUtility.GetSqlCommand(DataUtility.ConnectionString, "PrepStepGet");
            cmd.Parameters["@RecipeId"].Value = RecipeId;
            return SQLUtility.GetDataTable(cmd, DataUtility.ConnectionString);
        }
        public static DataTable GetCuisineType(bool IncludeBlank = false)
        {
            SqlCommand cmd = SQLUtility.GetSqlCommand(DataUtility.ConnectionString, "CuisineTypeGet");
            cmd.Parameters["@All"].Value = 1;
            cmd.Parameters["@IncludeBlank"].Value = IncludeBlank;
            return SQLUtility.GetDataTable(cmd, DataUtility.ConnectionString);
        }
        public static DataTable GetCreatedByUsers(bool IncludeBlank = false)
        {
            SqlCommand cmd = SQLUtility.GetSqlCommand(DataUtility.ConnectionString, "CreatedByUsersGet");
            cmd.Parameters["@All"].Value = 1;
            cmd.Parameters["@IncludeBlank"].Value = IncludeBlank;
            return SQLUtility.GetDataTable(cmd, DataUtility.ConnectionString);
        }
    }
}

