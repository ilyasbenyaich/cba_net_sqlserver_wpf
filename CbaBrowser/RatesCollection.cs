using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CbaModel;
using System.Collections.ObjectModel;

namespace CbaView
{
    class RatesCollection:ObservableCollection<Rate>
    {
        private CbaEntities _context;

        public RatesCollection(IQueryable<Rate> rates, CbaEntities context)
        : base (rates)
        {
            _context = context;
        }

        protected override void InsertItem(int index, Rate item)
        {
            _context.AddToRate(item);
            base.InsertItem(index, item);
        }

        protected override void RemoveItem(int index)
        {
            _context.DeleteObject(this[index]);
            base.RemoveItem(index);
        }
    }
}
