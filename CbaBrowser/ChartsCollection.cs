using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CbaModel;
using System.Collections.ObjectModel;
using System.ComponentModel;

namespace CbaView
{
    class ChartsCollection : ObservableCollection<Chart>
    {
        private CbaEntities _context;
        public CbaEntities Context
        {
            get { return _context; }
        }

        public ChartsCollection(IEnumerable<Chart> charts, CbaEntities context)
            : base(charts)
        {
            _context = context;

            foreach (Chart c in charts)
            {
                c.ChartAccount.AssociationChanged += new System.ComponentModel.CollectionChangeEventHandler(Accounts_AssociationChanged);
            }
        }

        void Accounts_AssociationChanged(object sender, System.ComponentModel.CollectionChangeEventArgs e)
        {
            if (e.Action == CollectionChangeAction.Remove)
            {
                this.Context.DeleteObject((Account)e.Element);
            }
        }

        protected override void InsertItem(int index, Chart item)
        {
            item.ChartAccount.AssociationChanged += new CollectionChangeEventHandler(Accounts_AssociationChanged);
            _context.AddToChart(item);
            base.InsertItem(index, item);
        }

        protected override void RemoveItem(int index)
        {
            Chart chart = this[index];
            chart.ChartAccount.AssociationChanged -= Accounts_AssociationChanged;

            for (int i = chart.ChartAccount.Count - 1; i >= 0; i--)
            {
                this.Context.DeleteObject(chart.ChartAccount.ElementAt(i));
            }
            this.Context.DeleteObject(this[index]);
            base.RemoveItem(index);
        }
    }
}
