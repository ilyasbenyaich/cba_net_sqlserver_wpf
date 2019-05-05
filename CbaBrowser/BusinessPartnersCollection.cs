using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CbaModel;
using System.Collections.ObjectModel;

namespace CbaView
{
    class BusinessPartnersCollection : ObservableCollection<BusinessPartner>
    {
        private CbaEntities _context;

        public BusinessPartnersCollection(IEnumerable<BusinessPartner> businessPartners, CbaEntities context)
            : base(businessPartners) 
        {
            _context = context;
        }

        protected override void InsertItem(int index, BusinessPartner item)
        {
            _context.AddToBusinessPartner(item);
            base.InsertItem(index, item);
        }

        protected override void RemoveItem(int index)
        {
            _context.DeleteObject(this[index]);
            base.RemoveItem(index);
        }
    }
}
