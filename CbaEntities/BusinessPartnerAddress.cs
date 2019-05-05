using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;

namespace CbaModel
{
    public partial class BusinessPartnerAddress
    {
        public BusinessPartnerAddress()
        {
            this.BusinessPartnerAddressBusinessPartnerReference.AssociationChanged += new CollectionChangeEventHandler(BusinessPartner_AssociationChanged);
            this.CreatedOn = System.DateTime.Now;
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
    }

}
