using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace CbaModel
{
    public partial class Tax
    {
        public Tax()
        {
            //this.TaxTReference.AssociationChanged += new CollectionChangeEventHandler(Territory_AssociationChanged);
            this.CreatedOn = System.DateTime.Now;
        }
       
        private void Territory_AssociationChanged(object sender, System.ComponentModel.CollectionChangeEventArgs e)
        {
            if ((e.Action == System.ComponentModel.CollectionChangeAction.Remove))
            {
                OnPropertyChanging("TaxTerritory");
            }
            else
            {
                OnPropertyChanged("TaxTerritory");
            }
        }
         
    }
}
