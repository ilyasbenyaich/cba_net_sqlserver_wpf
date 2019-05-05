using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CbaModel;
using System.Collections.ObjectModel;
using System.ComponentModel;

namespace CbaView
{
    class PurchaseOrdersCollection:ObservableCollection<PurchaseOrder>
    {
        private CbaEntities _context;

        public PurchaseOrdersCollection(IEnumerable<PurchaseOrder> purchaseOrders, CbaEntities context)
            : base(purchaseOrders)
        {
            _context = context;

            foreach (PurchaseOrder p in purchaseOrders)
            {
                p.PurchaseOrderLines.AssociationChanged +=new CollectionChangeEventHandler(PurchaseOrderLines_AssociationChanged);
            }
        }

        public CbaEntities Context
        {
            get { return _context; }
        }

        void PurchaseOrderLines_AssociationChanged(object sender , CollectionChangeEventArgs e)
        {
            if (e.Action == CollectionChangeAction.Remove)
            {
                this.Context.DeleteObject((PurchaseOrderLines)e.Element);
            }
        }

        protected override void InsertItem(int index, PurchaseOrder item)
        {
            item.PurchaseOrderLines.AssociationChanged +=new CollectionChangeEventHandler(PurchaseOrderLines_AssociationChanged);
            _context.AddToPurchaseOrder(item);
            base.InsertItem(index, item);
        }

        protected override void RemoveItem(int index)
        {
            PurchaseOrder purchase = this[index];
            purchase.PurchaseOrderLines.AssociationChanged -= PurchaseOrderLines_AssociationChanged;

            for (int i = purchase.PurchaseOrderLines.Count; i >= 0; i--)
            {
                this.Context.DeleteObject(purchase.PurchaseOrderLines.ElementAt(i));
            }
            this.Context.DeleteObject(this[index]);
            base.RemoveItem(index);
        }
    }
}
