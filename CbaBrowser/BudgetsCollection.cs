using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CbaModel;
using System.Collections.ObjectModel;
using System.ComponentModel;

namespace CbaView
{
    class BudgetsCollection : ObservableCollection<Budget>
    {
        private CbaEntities _context;

        public BudgetsCollection(IEnumerable<Budget> budgets, CbaEntities context)
            : base(budgets)
        {
            _context = context;

            foreach (Budget b in budgets)
            {
                b.BudgetLines.AssociationChanged += new CollectionChangeEventHandler(BudgetLines_AssociationChanged);
            }
        }

        public CbaEntities Context
        {
            get { return _context; }
        }

       void BudgetLines_AssociationChanged(object sender, CollectionChangeEventArgs e)
        {
            if (e.Action == CollectionChangeAction.Remove)
            {
               this.Context.DeleteObject((BudgetLines)e.Element);
            }
        }

        protected override void InsertItem(int index, Budget item)
        {
            item.BudgetLines.AssociationChanged += new CollectionChangeEventHandler(BudgetLines_AssociationChanged);
            _context.AddToBudget(item);
            base.InsertItem(index, item);
        }

        protected override void RemoveItem(int index)
        {
            Budget budget = this[index];
            budget.BudgetLines.AssociationChanged -= BudgetLines_AssociationChanged;

            for (int i = budget.BudgetLines.Count - 1; i >= 0; i--)
            {
                this.Context.DeleteObject(budget.BudgetLines.ElementAt(i));
            }
            this.Context.DeleteObject(this[index]);
            base.RemoveItem(index);
        }

    }
}
