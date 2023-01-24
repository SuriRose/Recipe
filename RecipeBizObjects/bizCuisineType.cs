using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;

namespace RecipeBizObjects
{
    public class bizCuisineType : bizObject<bizCuisineType>
    {
        string cuisinenameval = "";
        public int CuisineId
        {
            get => this.PrimaryKeyValue;
            set => this.PrimaryKeyValue = value;
        }
        public string CuisineName
        {
            get { return cuisinenameval; }
            set
            {
                cuisinenameval = value;
                InvokePropertyChanged();
            }
        }
    }
}
