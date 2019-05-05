﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace CbaModel
{
    public partial class RequestForQuote
    {
        public RequestForQuote()
        {
            this.RequestForQuoteLegalEntityReference.AssociationChanged += new CollectionChangeEventHandler(LegalEntity_AssociationChanged);
            this.RequestForQuoteBusinessPartnerReference.AssociationChanged += new CollectionChangeEventHandler(BusinessPartner_AssociationChanged);
            this.RequestForQuotePeriodReference.AssociationChanged += new CollectionChangeEventHandler(Period_AssociationChanged);
            this.CreatedOn = System.DateTime.Now;
            this.DocumentStatus = "O";
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

        private void BusinessPartner_AssociationChanged(object sender, System.ComponentModel.CollectionChangeEventArgs e)
        {
            if ((e.Action == System.ComponentModel.CollectionChangeAction.Remove))
            {
                OnPropertyChanging("BusinessPartner");
            }
            else
            {
                OnPropertyChanged("BusinessPartner");
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
    }
}
