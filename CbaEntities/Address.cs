using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace CbaModel
{
    public partial class Address
    {
        public Address()
        {
            this.AddressCountryReference.AssociationChanged += new CollectionChangeEventHandler(Country_AssociationChanged);
            this.CreatedOn = System.DateTime.Now;

        }

        private void Country_AssociationChanged(object sender, System.ComponentModel.CollectionChangeEventArgs e)
        {
            if ((e.Action == System.ComponentModel.CollectionChangeAction.Remove))
            {
                OnPropertyChanging("Country");
            }
            else
            {
                OnPropertyChanged("Country");
            }
        }
    }
}
