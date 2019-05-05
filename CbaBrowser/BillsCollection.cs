using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CbaModel;
using System.Collections.ObjectModel;
using System.ComponentModel;

namespace CbaView
{
    class BillsCollection : ObservableCollection<Bill>
    {
        private CbaEntities _context;

        public BillsCollection(IEnumerable<Bill> bills, CbaEntities context)
            : base(bills)
        {
            _context = context;

            foreach (Bill b in bills)
            {
                b.BillLines.AssociationChanged +=new CollectionChangeEventHandler(BillLines_AssociationChanged);
            }
        }

        public CbaEntities Context
        {
            get { return _context; }
        }

        void BillLines_AssociationChanged(object sender , CollectionChangeEventArgs e)
        {
            if (e.Action == CollectionChangeAction.Remove)
            {
                this.Context.DeleteObject((BillLines)e.Element);
            }
        }

        protected override void InsertItem(int index, Bill item)
        {
            item.BillLines.AssociationChanged +=new CollectionChangeEventHandler(BillLines_AssociationChanged);
            _context.AddToBill(item);
            base.InsertItem(index, item);
        }

        protected override void RemoveItem(int index)
        {
            Bill bill = this[index];
            bill.BillLines.AssociationChanged -= BillLines_AssociationChanged;

            for (int i = bill.BillLines.Count; i >= 0; i--)
            {
                this.Context.DeleteObject(bill.BillLines.ElementAt(i));
            }
            this.Context.DeleteObject(this[index]);
            base.RemoveItem(index);
        }
    }
}
