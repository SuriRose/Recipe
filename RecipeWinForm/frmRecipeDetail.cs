using RecipeBizObjects;
using System.Data;
using CPUFramework;

namespace RecipeWinForm
{
    public partial class frmRecipeDetail : Form
    {
        bizRecipe recipe = new bizRecipe();
        public frmRecipeDetail()
        {
            InitializeComponent();
            BindForm();
            btnDelete.Click += BtnDelete_Click;
            btnSave.Click += BtnSave_Click;
            //bizRecipe.SetConnectionString();
        }

        public void ShowForm(int id)
        {
            // DataUtility.SetConnectionString("srosenfeld.database.windows.net,1433", "RecipeDB", "srosenfeldadmin", "CPU123!@#");
            //recipe = bizRecipe.Get(id);
            //temporary workaround until dapper issue is resolved
            //if (recipe == null)
            //{
            //    recipe = new bizRecipe();
            //}
            recipe = bizRecipe.Get(id);

            lstCuisineType.DataSource = DataService.GetCuisineType(true);
            lstCuisineType.ValueMember = "CuisineId";
            lstCuisineType.DisplayMember = "CuisineName";
            lstCuisineType.DataBindings.Add("SelectedValue", recipe, "CuisineId");

            lstCreatedByUsers.DataSource = DataService.GetCreatedByUsers(true);
            lstCreatedByUsers.ValueMember = "UsersId";
            lstCreatedByUsers.DisplayMember = "UsersName";
            lstCreatedByUsers.DataBindings.Add("SelectedValue", recipe, "createdByUsersId");

            txtRecipeName.DataBindings.Add("Text", recipe, "RecipeName");
            txtNumOfCalories.DataBindings.Add("Text", recipe, "NumCalories");
            txtNumOfIngredients.DataBindings.Add("Text", recipe, "NumOfIngredients");
            txtNumOfSteps.DataBindings.Add("Text", recipe, "NumOfSteps");
            label1.DataBindings.Add("Text", recipe, "DateCreated");
            label2.DataBindings.Add("Text", recipe, "DatePublished");
            label3.DataBindings.Add("Text", recipe, "DateArchived");
            label4.DataBindings.Add("Text", recipe, "RecipeStatusName");

            gIngredientList.DataSource = DataService.GetIngredientDetail(id);
            gPrepStep.DataSource = DataService.GetPrepStepDesc(id);

            this.StartPosition = FormStartPosition.CenterScreen;
            this.Show();
        }
        private void BindForm()
        {
            gIngredientList.DataSource = DataService.GetRecipeList();
            gPrepStep.DataSource = DataService.GetRecipeList();
            this.FormatGrid(gIngredientList, "RecipeId");
            this.FormatGrid(gPrepStep, "RecipeId");
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
        private void Delete()
        {
            try
            {
                recipe.Delete();
            }
            catch (CPUException ex) { MessageBox.Show(ex.FriendlyMessage, this.Text, MessageBoxButtons.OK); }
            this.Close();
        }
        private void Save()
        {
            try
            {
                recipe.Save();
            }
            catch (CPUException ex) { MessageBox.Show(ex.FriendlyMessage, this.Text, MessageBoxButtons.OK); }
            this.Close();
        }

        private void BtnDelete_Click(object? sender, EventArgs e)
        {
            Delete();
        }
        private void BtnSave_Click(object? sender, EventArgs e)
        {
            Save();
        }
    }
}
