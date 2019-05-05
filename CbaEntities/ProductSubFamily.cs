using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace CbaModel
{
    public partial class ProductSubFamily
    {
        public ProductSubFamily()
        {
            this.CreatedOn = System.DateTime.Now;
            this.ProductFamilyReference.AssociationChanged += new CollectionChangeEventHandler(ProductFamily_AssociationChanged);
        }

        void ProductFamily_AssociationChanged(object sender, CollectionChangeEventArgs e)
        {
            if (e.Action == CollectionChangeAction.Remove)
            {
                OnPropertyChanging("Family");
            }

            else
            {
                OnPropertyChanging("Family");
            }
        }
    }
}
