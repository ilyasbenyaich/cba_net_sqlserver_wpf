using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace CbaModel
{
    partial class Budget
    {
        public Budget()
        {
            this.CreatedOn = System.DateTime.Now;
            this.BudgetCalendarReference.AssociationChanged += new CollectionChangeEventHandler(Calendar_AssociationChanged);
            //this.BudgetLegalReference.AssociationChanged += new CollectionChangeEventHandler(Ledger_AssociationChanged);

        }

        private void Calendar_AssociationChanged(object sender, CollectionChangeEventArgs e)
        {
            if(e.Action == System.ComponentModel.CollectionChangeAction.Remove)
            {
                OnPropertyChanging("Calendar");
            }
            else
            {
                OnPropertyChanging("Calendar");
            }
        }

        private void Ledger_AssociationChanged(object sender, CollectionChangeEventArgs e)
        {
            if (e.Action == System.ComponentModel.CollectionChangeAction.Remove)
            {
                OnPropertyChanging("Ledger");
            }
            else
            {
                OnPropertyChanging("Ledger");
            }
        }
    }
}
