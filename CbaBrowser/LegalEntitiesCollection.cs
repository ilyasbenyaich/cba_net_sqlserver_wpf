using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CbaModel;
using System.Collections.ObjectModel;

namespace CbaView
{
    class LegalEntitiesCollection: ObservableCollection<LegalEntity>
    {
        private CbaEntities _context;

        public LegalEntitiesCollection(IQueryable<LegalEntity> organizations, CbaEntities context)
            : base(organizations)
        {
            _context = context;
        }

        protected override void InsertItem(int index, LegalEntity item)
        {
            _context.AddToLegalEntity(item);
            base.InsertItem(index, item);
        }

        protected override void RemoveItem(int index)
        {
            _context.DeleteObject(this[index]);
            base.RemoveItem(index);
        }
    }
}
