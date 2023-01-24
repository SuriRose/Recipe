using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;
using Dapper;

namespace RecipeBizObjects
{
    public class bizRecipeIngredient : bizObject<bizRecipeIngredient>
    {
        int recipeidval = 0;
        string ingredientlistval = "";

        public int RecipeIngredientId
        {
            get => this.PrimaryKeyValue;
            set => this.PrimaryKeyValue = value;
        }
        public int RecipeId
        {
            get { return recipeidval; }
            set
            {
                recipeidval = value;
                InvokePropertyChanged();
            }
        }
        public string IngredientList
        {
            get { return ingredientlistval; }
            set
            {
                ingredientlistval = value;
                InvokePropertyChanged();
            }
        }
    }
}
