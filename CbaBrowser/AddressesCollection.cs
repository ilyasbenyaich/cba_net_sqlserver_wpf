using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CbaModel;
using System.Collections.ObjectModel;

namespace CbaView
{
    class AddressesCollection:ObservableCollection<Address>
    {
        private CbaEntities _context;

        public AddressesCollection(IEnumerable<Address> addresses, CbaEntities context) :
            base(addresses)
        {
            _context = context;
        }

        protected override void InsertItem(int index, Address item)
        {
            _context.AddToAddress(item);
            base.InsertItem(index, item);
        }

        protected override void RemoveItem(int index)
        {
            _context.DeleteObject(this[index]);
            base.RemoveItem(index);
        }

    }
}
