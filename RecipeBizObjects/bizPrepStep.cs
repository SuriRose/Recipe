using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RecipeBizObjects
{
    public class bizPrepStep : bizObject<bizPrepStep>
    {
        string prepstepdescval = "";
        int recipeidval = 0;
        public int PrepStepId
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
        public string PrepStepDesc
        {
            get { return prepstepdescval; }
            set
            {
                prepstepdescval = value;
                InvokePropertyChanged();
            }
        }
    }
}