using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CbaModel;
using System.Collections.ObjectModel;
using System.ComponentModel;

namespace CbaView
{
    class JournalsCollection : ObservableCollection<Journal>
    {
        private CbaEntities _context;
        public CbaEntities Context
        {
            get { return _context; }
        }

        public JournalsCollection(IEnumerable<Journal> journals, CbaEntities context)
            : base(journals)
        {
            _context = context;

            foreach (Journal j in journals)
            {
                j.JournalLines.AssociationChanged += new System.ComponentModel.CollectionChangeEventHandler(JournalLines_AssociationChanged);
                j.GetTotalJournalCredit();
                j.GetTotalJournalDebit();
                j.SetBalancedFlag();
            }
        }

        void JournalLines_AssociationChanged(object sender, System.ComponentModel.CollectionChangeEventArgs e)
        {
            if (e.Action == CollectionChangeAction.Remove)
            {
                this.Context.DeleteObject((JournalLines)e.Element);
            }
        }

        protected override void InsertItem(int index, Journal item)
        {
            item.JournalLines.AssociationChanged += new CollectionChangeEventHandler(JournalLines_AssociationChanged);
            _context.AddToJournal(item);
            item.GetTotalJournalCredit();
            item.GetTotalJournalDebit();
            item.SetBalancedFlag();
            base.InsertItem(index, item);
        }

        protected override void RemoveItem(int index)
        {
            Journal journal = this[index];
            journal.JournalLines.AssociationChanged -= JournalLines_AssociationChanged;

            for (int i = journal.JournalLines.Count - 1; i >= 0; i--)
            {
                this.Context.DeleteObject(journal.JournalLines.ElementAt(i));
            }
            this.Context.DeleteObject(this[index]);
            base.RemoveItem(index);
        }

        

        
    }
}
