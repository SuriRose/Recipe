using System.Data;
using System.Data.SqlClient;
using CPUFramework;
using Dapper;
using System.ComponentModel.DataAnnotations;

namespace RecipeBizObjects
{
    public class bizRecipe : bizObject<bizRecipe>
    {
        int cuisineidval = 0;
        int createdbyusersval = 0;
        string recipenameval = "";
        int numcaloriesval = 0;
        int numofingredientsval = 0;
        int numofstepsval = 0;
        int numval = 0;
        DateTime datecreatedval = DateTime.Now;
        DateTime? datepublishedval;
        DateTime? datearchivedval;
        string recipestatusnameval = "";
        string codeval = "";
        string imagecodeval = "";
        string cuisinetypeval = "";
        private List<bizRecipeIngredient> lstRecipeIngredient;
        private List<bizPrepStep> lstPrepStep;
        public bizRecipe()
        {
            this.DynamParamForUpdate.Output(this, x => x.DateCreated);
            this.DynamParamForUpdate.Output(this, x => x.DatePublished, DbType.DateTime, 20);
            this.DynamParamForUpdate.Output(this, x => x.DateArchived, size: 20);
            this.DynamParamForUpdate.Output(this, x => x.RecipeId);
            this.DynamParamForUpdate.Output(this, x => x.RecipeStatusName);
            this.DynamParamForUpdate.Output(this, x => x.Code);
        }
        public static List<bizRecipe> Search(string criteria)
        {
            DynamicParameters dp = new DynamicParameters();
            dp.Add("@SearchCriteria", criteria);
            return SQLUtility.ExecuteGetMultipleDapper<bizRecipe>("RecipeSearch", dp);
        }
        
        public int RecipeId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }
        [Required]
        [Display(Name = "Cusine")]
        public int CuisineId
        {
            get
            {
                return cuisineidval;
            }
            set
            {
                cuisineidval = value;
                InvokePropertyChanged();
            }
        }
        [Required]
        [Display(Name = "Created By")]
        public int CreatedByUsersId
        {
            get
            {
                return createdbyusersval;
            }
            set
            {
                createdbyusersval = value;
                InvokePropertyChanged();
            }
        }

        [Required]
        [Display(Name = "Recipe Name")]
        public string RecipeName
        {
            get { return recipenameval; }
            set
            {
                recipenameval = value;
                InvokePropertyChanged();
            }
        }
        [Required]
        [Display(Name = "Number Of Calories")]
        public int NumCalories
        {
            get { return numcaloriesval; }
            set
            {
                numcaloriesval = value;
                InvokePropertyChanged();
            }
        }
        [Required]
        [Display(Name = "Number Of Ingredients")]
        public int NumOfIngredients
        {
            get { return numofingredientsval; }
            set
            {
                numofingredientsval = value;
                InvokePropertyChanged();
            }
        }
        [Required]
        [Display(Name = "Number Of Steps")]
        public int NumOfSteps
        {
            get { return numofstepsval; }
            set
            {
                numofstepsval = value;
                InvokePropertyChanged();
            }
        }
        [Display(Name = "Date Created")]
        public DateTime DateCreated
        {
            get
            {
                return datecreatedval;
            }
            set
            {
                datecreatedval = value;
                InvokePropertyChanged();
            }
        }
        [Display(Name = "Date Published")]
        public DateTime? DatePublished
        {
            get
            {
                return datepublishedval;
            }
            set
            {
                datepublishedval = value;
                InvokePropertyChanged();
            }
        }
        [Display(Name = "Date Archived")]
        public DateTime? DateArchived
        {
            get
            {
                return datearchivedval;
            }
            set
            {
                datearchivedval = value;
                InvokePropertyChanged();
            }
        }
        [Required]
        [Display(Name = "Status")]
        public string RecipeStatusName
        {
            get
            {
                return recipestatusnameval;
            }
            set
            {
                recipestatusnameval = value;
                InvokePropertyChanged();
            }
        }
        public string Code
        {
            get { return codeval; }
            set
            {
                codeval = value;
                InvokePropertyChanged();
            }
        }
        public string ImageCode
        {
            get { return imagecodeval; }
            set
            {
                imagecodeval = value;
                InvokePropertyChanged();
            }
        }
        public List<bizPrepStep> PrepStepList(bool refresh)
        {
            if (refresh == true || lstPrepStep == null)
            {
                return bizPrepStep.GetList("RecipeId", this.PrimaryKeyValue);
            }
            return lstPrepStep;
        }
        public List<bizRecipeIngredient> RecipeIngredientList(bool refresh)
        {
            if (refresh == true || lstRecipeIngredient == null)
            {
                return bizRecipeIngredient.GetList("RecipeId", this.PrimaryKeyValue);
            }
            return lstRecipeIngredient;
        }
        public List<bizCuisineType> CuisineTypeList()
        {
            return bizCuisineType.GetAll();
        }
        public List<bizCreatedByUsers> CreatedByUsersList()
        {
            return bizCreatedByUsers.GetAll();
        }
        public string FullDescription() { return this.RecipeId + " " + this.RecipeName; }
        protected DynamicParameters DynamParamForUpdate { get; } = new();
    }
}