using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CbaModel;
using System.Collections.ObjectModel;

namespace CbaView
{
    class BanksCollection : ObservableCollection<Bank>
    {
        private CbaEntities _context;

        public BanksCollection(IEnumerable<Bank> banks, CbaEntities context)
            : base(banks)
        {
            _context = context;
        }

        protected override void InsertItem(int index, Bank item)
        {
            // Tell the ObjectContext to start tracking this order entity
            _context.AddToBank(item);
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
