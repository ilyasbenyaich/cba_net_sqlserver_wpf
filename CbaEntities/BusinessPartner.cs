using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
namespace CbaModel
{
    public partial class BusinessPartner
    {
        public BusinessPartner()
        {
            this.CreatedOn = System.DateTime.Now;
            this.BusinessPartnerLegalEntityReference.AssociationChanged += new CollectionChangeEventHandler(LegalEntity_AssociationChanged);

        }

        private void LegalEntity_AssociationChanged(object sender , CollectionChangeEventArgs e)
        {
            if (e.Action == CollectionChangeAction.Remove)
            {
                OnPropertyChanging("LegalEntity");
            }
            else
            {
                OnPropertyChanging("LegalEntity");
            }

        }
       
    }
}
