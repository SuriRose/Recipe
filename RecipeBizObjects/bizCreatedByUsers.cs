using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;

namespace RecipeBizObjects
{
    public class bizCreatedByUsers : bizObject<bizCreatedByUsers>
    {
        string usersnameval = "";
        public int UsersId
        {
            get => this.PrimaryKeyValue;
            set => this.PrimaryKeyValue = value;
        }
        public string UsersName
        {
            get { return usersnameval; }
            set
            {
                usersnameval = value;
                InvokePropertyChanged();
            }
        }
    }
}
