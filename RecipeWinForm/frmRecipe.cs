using RecipeBizObjects;
using CPUFramework;

namespace RecipeWinForm
{
    public partial class frmRecipe : Form
    {
        public frmRecipe()
        {
            InitializeComponent();
            //DataUtility.SetConnectionString(string servername, string databasename, string username, string password);
            DataUtility.SetConnectionString("srosenfeld.database.windows.net,1433", "RecipeDB", "srosenfeldadmin", "CPU123!@#");
            BindForm();
            gRecipeList.CellDoubleClick += GRecipeName_CellDoubleClick;
            btnNewRecipe.Click += BtnNewRecipe_Click;
        }
        private void NewRecipe()
        {
            frmRecipeDetail f = new frmRecipeDetail();
            f.ShowForm(0);
        }
        private void BindForm()
        {
            this.FormatGrid(gBookMealRecipe);
            this.FormatGrid(gRecipeList);
            gBookMealRecipe.DataSource = DataService.GetRecipeCount();
            gRecipeList.DataSource = DataService.GetRecipeList();
        }
        private void FormatGrid(DataGridView gridobj, string PrimaryKeyFieldName = "")
        {
            gridobj.ReadOnly = true;
            gridobj.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            gridobj.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;
            gridobj.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            gridobj.RowHeadersWidth = 25;
            gridobj.AllowUserToAddRows = false;
            if (PrimaryKeyFieldName != "")
            {
                gridobj.Columns[PrimaryKeyFieldName].Visible = false;
            }
        }

        private void GRecipeName_CellDoubleClick(object? sender, DataGridViewCellEventArgs e)
        {
            int id = (int)gRecipeList.Rows[e.RowIndex].Cells["RecipeId"].Value;
            frmRecipeDetail f = new frmRecipeDetail();
            f.ShowForm(id);
        }
        private void BtnNewRecipe_Click(object? sender, EventArgs e)
        {
            NewRecipe();
        }
    }
}
  
