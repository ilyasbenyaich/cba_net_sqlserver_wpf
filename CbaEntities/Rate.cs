using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace CbaModel
{
    public partial class Rate
    {
        public Rate()
        {
            this.CreatedOn = System.DateTime.Now;
            this.ExchangeFromReference.AssociationChanged += new CollectionChangeEventHandler(CurrencyFrom_AssociationChanged);
            this.ExchangeToReference.AssociationChanged += new CollectionChangeEventHandler(CurrencyTo_AssociationChanged);
        }

        private void CurrencyFrom_AssociationChanged(object sender, CollectionChangeEventArgs e)
        {
            if (e.Action == CollectionChangeAction.Remove)
            {
                OnPropertyChanging("CurrencyRateFrom");
            }
            else
            {
                OnPropertyChanging("CurrencyRateFrom");
            }
        }

        private void CurrencyTo_AssociationChanged(object sender, CollectionChangeEventArgs e)
        {
            if (e.Action == CollectionChangeAction.Remove)
            {
                OnPropertyChanging("CurrencyRateTo");
            }
            else
            {
                OnPropertyChanging("CurrencyRateTo");
            }
        }
    }
}
