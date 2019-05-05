using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;

namespace CbaModel
{
    public partial class GoodsReceipt
    {
        public GoodsReceipt()
        {
            this.GoodsReceiptLegalEntityReference.AssociationChanged += new CollectionChangeEventHandler(LegalEntity_AssociationChanged);
            this.GoodsReceiptBusinessPartnerReference.AssociationChanged += new CollectionChangeEventHandler(BusinessPartner_AssociationChanged);
            this.GoodsReceiptPeriodReference.AssociationChanged += new CollectionChangeEventHandler(Period_AssociationChanged);
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
