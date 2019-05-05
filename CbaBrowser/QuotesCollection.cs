using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CbaModel;
using System.Collections.ObjectModel;
using System.ComponentModel;

namespace CbaView
{
    class QuotesCollection : ObservableCollection<Quote>
    {
        private CbaEntities _context;

        public QuotesCollection(IEnumerable<Quote> quotes, CbaEntities context)
            : base(quotes)
        {
            _context = context;

            foreach (Quote q in quotes)
            {
                q.QuoteLines.AssociationChanged +=new CollectionChangeEventHandler(QuoteLines_AssociationChanged);
            }
        }

        public CbaEntities Context
        {
            get { return _context; }
        }

        void QuoteLines_AssociationChanged(object sender , CollectionChangeEventArgs e)
        {
            if (e.Action == CollectionChangeAction.Remove)
            {
                this.Context.DeleteObject((BillLines)e.Element);
            }
        }

        protected override void InsertItem(int index, Quote item)
        {
            item.QuoteLines.AssociationChanged +=new CollectionChangeEventHandler(QuoteLines_AssociationChanged);
            _context.AddToQuote(item);
            base.InsertItem(index, item);
        }

        protected override void RemoveItem(int index)
        {
            Quote quote = this[index];
            quote.QuoteLines.AssociationChanged -= QuoteLines_AssociationChanged;

            for (int i = quote.QuoteLines.Count; i >= 0; i--)
            {
                this.Context.DeleteObject(quote.QuoteLines.ElementAt(i));
            }
            this.Context.DeleteObject(this[index]);
            base.RemoveItem(index);
        }
    }
}
