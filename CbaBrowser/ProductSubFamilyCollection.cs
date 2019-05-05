using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.ObjectModel;
using CbaModel;
using System.ComponentModel;


namespace CbaView
{
    class ProductSubFamilyCollection : ObservableCollection<ProductSubFamily>
    {
        private CbaEntities _context;

        public ProductSubFamilyCollection(IEnumerable<ProductSubFamily> productSubFamilies , CbaEntities context)
            :base (productSubFamilies)
         {
             _context = context;
        }

        protected override void InsertItem(int index, ProductSubFamily item)
        {
            _context.AddToProductSubFamily(item);
            base.InsertItem(index, item);
        }

        protected override void RemoveItem(int index)
        {
            _context.DeleteObject(this[index]);
            base.RemoveItem(index);
        }
    }
}
