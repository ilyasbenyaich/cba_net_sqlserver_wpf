using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using CbaModel;
using System.Collections.ObjectModel;

namespace CbaView
{
    class ProductsCollection : ObservableCollection<Product>
    {
        private CbaEntities _context;

        public ProductsCollection(IEnumerable<Product> products, CbaEntities context)
            : base(products)
        {
            _context = context;
        }

        protected override void InsertItem(int index, Product item)
        {
            _context.AddToProduct(item);
            base.InsertItem(index, item);
        }

        protected override void RemoveItem(int index)
        {
            _context.DeleteObject(this[index]);
            base.RemoveItem(index);
        }
    }
}
