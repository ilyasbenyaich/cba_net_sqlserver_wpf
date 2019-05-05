using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.ObjectModel;
using System.ComponentModel;
using CbaModel;

namespace CbaView
{
    class ProductFamiliesCollection:ObservableCollection<ProductFamily>
    {
        private CbaEntities _context;

        public ProductFamiliesCollection(IEnumerable<ProductFamily> productFamilies, CbaEntities context)
            : base(productFamilies)
        {
            _context = context;

        }

   
       protected override void InsertItem(int index, ProductFamily item)
        {
            _context.AddToProductFamily(item);
            base.InsertItem(index, item);
        }

        protected override void RemoveItem(int index)
        {
            ProductFamily pf = this[index];
            base.RemoveItem(index);
        }
    
    }
}
