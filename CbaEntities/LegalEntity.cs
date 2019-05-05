using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;

namespace CbaModel
{
    public partial class LegalEntity
    {
        public LegalEntity()
        {
            this.LegalEntityChartReference.AssociationChanged += new CollectionChangeEventHandler(Chart_AssociationChanged);
            this.LegalEntityAddressReference.AssociationChanged += new CollectionChangeEventHandler(Address_AssociationChanged);
            this.CreatedOn = System.DateTime.Now;
        }

   

        private void Chart_AssociationChanged(object sender, System.ComponentModel.CollectionChangeEventArgs e)
        {
            if ((e.Action == System.ComponentModel.CollectionChangeAction.Remove))
            {
                OnPropertyChanging("Chart");
            }
            else
            {
                OnPropertyChanged("Chart");
            }
        }

        private void Address_AssociationChanged(object sender, System.ComponentModel.CollectionChangeEventArgs e)
        {
            if ((e.Action == System.ComponentModel.CollectionChangeAction.Remove))
            {
                OnPropertyChanging("Chart");
            }
            else
            {
                OnPropertyChanged("Chart");
            }
        }
    }
}
