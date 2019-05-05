using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CbaModel;
using System.Collections.ObjectModel;

namespace CbaView
{
    class TaxesCollection : ObservableCollection<Tax>
    {
        private CbaEntities _context;

        public TaxesCollection(IEnumerable<Tax> taxes, CbaEntities context)
            :base(taxes)
        {
            _context = context;
        }

        protected override void InsertItem(int index, Tax item)
        {
            // Tell the ObjectContext to start tracking this order entity
            _context.AddToTax(item);
            base.InsertItem(index, item);
        }

        protected override void RemoveItem(int index)
        {
            // Tell the ObjectContext to delete this order entity
            _context.DeleteObject(this[index]);
            base.RemoveItem(index);
        }
    }
}
