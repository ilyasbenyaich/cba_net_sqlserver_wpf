using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace CbaModel
{
    public partial class Product
    {
        public Product()
        {
            this.CreatedOn = System.DateTime.Now;
            this.ProductSubfamilyReference.AssociationChanged += new CollectionChangeEventHandler(ProductSubFamily_AssociationChanged); 
        }

        void ProductSubFamily_AssociationChanged(object senser, CollectionChangeEventArgs e)
        {
            if (e.Action == CollectionChangeAction.Remove)
            {
                OnPropertyChanging("ProductSubfamily");
            }

            else
            {
                OnPropertyChanging("ProductSubfamily");
            }

        }
    }
}
