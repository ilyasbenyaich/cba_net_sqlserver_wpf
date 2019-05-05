using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CbaModel;
using System.Collections.ObjectModel;
using System.ComponentModel;

namespace CbaView
{
    class SaleOrdersCollection : ObservableCollection<SaleOrder>
    {
        private CbaEntities _context;

        public SaleOrdersCollection(IEnumerable<SaleOrder> saleOrders, CbaEntities context)
            : base(saleOrders)
        {
            _context = context;

            foreach (SaleOrder s in saleOrders)
            {
                s.SaleOrderLines.AssociationChanged +=new CollectionChangeEventHandler(SaleOrderLines_AssociationChanged);
            }
        }

        public CbaEntities Context
        {
            get { return _context; }
        }

        void SaleOrderLines_AssociationChanged(object sender , CollectionChangeEventArgs e)
        {
            if (e.Action == CollectionChangeAction.Remove)
            {
                this.Context.DeleteObject((SaleOrderLines)e.Element);
            }
        }

        protected override void InsertItem(int index, SaleOrder item)
        {
            item.SaleOrderLines.AssociationChanged +=new CollectionChangeEventHandler(SaleOrderLines_AssociationChanged);
            _context.AddToSaleOrder(item);
            base.InsertItem(index, item);
        }

        protected override void RemoveItem(int index)
        {
            SaleOrder saleOrder = this[index];
            saleOrder.SaleOrderLines.AssociationChanged -= SaleOrderLines_AssociationChanged;

            for (int i = saleOrder.SaleOrderLines.Count; i >= 0; i--)
            {
                this.Context.DeleteObject(saleOrder.SaleOrderLines.ElementAt(i));
            }
            this.Context.DeleteObject(this[index]);
            base.RemoveItem(index);
        }
    }
}
