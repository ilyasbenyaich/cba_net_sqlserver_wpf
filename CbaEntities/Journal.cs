using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace CbaModel
{
    public partial class Journal
    {
        public Journal()
        {
            this.JournalLegalEntityReference.AssociationChanged += new CollectionChangeEventHandler(LegalEntity_AssociationChanged);
            this.JournalCurrencyReference.AssociationChanged += new CollectionChangeEventHandler(Currency_AssociationChanged);
            this.JournalPeriodReference.AssociationChanged += new CollectionChangeEventHandler(Period_AssociationChanged);
            this.CreatedOn = System.DateTime.Now;
            this.Status = "U";
            this.Source = "M";
            
        }

        private void LegalEntity_AssociationChanged(object sender, System.ComponentModel.CollectionChangeEventArgs e)
        {
            if ((e.Action == System.ComponentModel.CollectionChangeAction.Remove))
            {
                OnPropertyChanging("LegalEntity");
            }
            else
            {
                OnPropertyChanged("LegalEntity");
            }
        }

        private void Currency_AssociationChanged(object sender, System.ComponentModel.CollectionChangeEventArgs e)
        {
            if ((e.Action == System.ComponentModel.CollectionChangeAction.Remove))
            {
                OnPropertyChanging("Currency");
            }
            else
            {
                OnPropertyChanged("Currency");
            }
        }

        private void Period_AssociationChanged(object sender, System.ComponentModel.CollectionChangeEventArgs e)
        {
            if ((e.Action == System.ComponentModel.CollectionChangeAction.Remove))
            {
                OnPropertyChanging("Period");
            }
            else
            {
                OnPropertyChanged("Period");
            }
        }

        public void GetTotalJournalCredit()
        {
            decimal newTotalJournalCredit = 0;
   
            if(this.JournalLines.IsLoaded || EntityState == System.Data.EntityState.Added)
            {
                foreach (JournalLines item in this.JournalLines)
                {
                    if(item.DebitCreditFlag.Equals("C"))
                    {
                    // Calculate line totals for loaded items.
                        newTotalJournalCredit += item.Amount;
                    }
                }

                this.TotalCredit = newTotalJournalCredit;
            }

        }


        public void GetTotalJournalDebit()
        {
            decimal newTotalJournalDebit = 0;

            if (this.JournalLines.IsLoaded || EntityState == System.Data.EntityState.Added)
            {
                foreach (JournalLines item in this.JournalLines)
                {
                    if (item.DebitCreditFlag.Equals("D"))
                    {
                        // Calculate line totals for loaded items.
                        newTotalJournalDebit  += item.Amount;
                    }
                }

                this.TotalDebit = newTotalJournalDebit;
            }

        }

        public void SetBalancedFlag()
        {
            string balancedFlag = "F";

            if (this.TotalCredit == this.TotalDebit)
            {
                balancedFlag = "T";
            }

            this.BalancedFlag = balancedFlag;
        }
      

    }
}
