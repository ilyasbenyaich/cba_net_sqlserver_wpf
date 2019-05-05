using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CbaModel;
using System.Collections.ObjectModel;
using System.ComponentModel;

namespace CbaView
{
    class InvoicesCollection : ObservableCollection<Invoice>
    {
        private CbaEntities _context;

        public InvoicesCollection(IEnumerable<Invoice> invoices, CbaEntities context)
            : base(invoices)
        {
            _context = context;

            foreach (Invoice i in invoices)
            {
                i.InvoiceLines.AssociationChanged +=new CollectionChangeEventHandler(InvoiceLines_AssociationChanged);
            }
        }

        public CbaEntities Context
        {
            get { return _context; }
        }

        void InvoiceLines_AssociationChanged(object sender , CollectionChangeEventArgs e)
        {
            if (e.Action == CollectionChangeAction.Remove)
            {
                this.Context.DeleteObject((InvoiceLines)e.Element);
            }
        }

        protected override void InsertItem(int index, Invoice item)
        {
            item.InvoiceLines.AssociationChanged +=new CollectionChangeEventHandler(InvoiceLines_AssociationChanged);
            _context.AddToInvoice(item);
            base.InsertItem(index, item);
        }

        protected override void RemoveItem(int index)
        {
            Invoice invoice = this[index];
            invoice.InvoiceLines.AssociationChanged -= InvoiceLines_AssociationChanged;

            for (int i = invoice.InvoiceLines.Count; i >= 0; i--)
            {
                this.Context.DeleteObject(invoice.InvoiceLines.ElementAt(i));
            }
            this.Context.DeleteObject(this[index]);
            base.RemoveItem(index);
        }
    }
}
