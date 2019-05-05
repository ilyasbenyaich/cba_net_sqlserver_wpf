using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CbaModel;
using System.Collections.ObjectModel;
using System.ComponentModel;

namespace CbaView
{
    class RequestForQuotesCollection:ObservableCollection<RequestForQuote>
    {
        private CbaEntities _context;

        public RequestForQuotesCollection(IEnumerable<RequestForQuote> requestForQuotes, CbaEntities context)
            : base(requestForQuotes)
        {
            _context = context;

            foreach (RequestForQuote r in requestForQuotes)
            {
                //p.PurchaseLines.AssociationChanged +=new CollectionChangeEventHandler(PurchaseLines_AssociationChanged);
                r.RequestForQuoteLines.AssociationChanged += new CollectionChangeEventHandler(RequestForQuoteLines_AssociationChanged);
            }
        }

        public CbaEntities Context
        {
            get { return _context; }
        }

        void RequestForQuoteLines_AssociationChanged(object sender , CollectionChangeEventArgs e)
        {
            if (e.Action == CollectionChangeAction.Remove)
            {
                this.Context.DeleteObject((RequestForQuoteLines)e.Element);
            }
        }

        protected override void InsertItem(int index, RequestForQuote item)
        {
            item.RequestForQuoteLines.AssociationChanged +=new CollectionChangeEventHandler(RequestForQuoteLines_AssociationChanged);
            _context.AddToRequestForQuote(item);
            base.InsertItem(index, item);
        }

        protected override void RemoveItem(int index)
        {
            RequestForQuote rfq = this[index];
            rfq.RequestForQuoteLines.AssociationChanged -= RequestForQuoteLines_AssociationChanged;

            for (int i = rfq.RequestForQuoteLines.Count; i >= 0; i--)
            {
                this.Context.DeleteObject(rfq.RequestForQuoteLines.ElementAt(i));
            }
            this.Context.DeleteObject(this[index]);
            base.RemoveItem(index);
        }
    }
}
