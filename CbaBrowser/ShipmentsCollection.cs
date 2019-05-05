using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CbaModel;
using System.Collections.ObjectModel;
using System.ComponentModel;

namespace CbaView
{
    class ShipmentsCollection : ObservableCollection<Shipment>
    {
        private CbaEntities _context;

        public ShipmentsCollection(IEnumerable<Shipment> shipments, CbaEntities context)
            : base(shipments)
        {
            _context = context;

            foreach (Shipment s in shipments)
            {
                s.ShipmentLines.AssociationChanged +=new CollectionChangeEventHandler(ShipmentLines_AssociationChanged);
            }
        }

        public CbaEntities Context
        {
            get { return _context; }
        }

        void ShipmentLines_AssociationChanged(object sender , CollectionChangeEventArgs e)
        {
            if (e.Action == CollectionChangeAction.Remove)
            {
                this.Context.DeleteObject((ShipmentLines)e.Element);
            }
        }

        protected override void InsertItem(int index, Shipment item)
        {
            item.ShipmentLines.AssociationChanged +=new CollectionChangeEventHandler(ShipmentLines_AssociationChanged);
            _context.AddToShipment(item);
            base.InsertItem(index, item);
        }

        protected override void RemoveItem(int index)
        {
            Shipment shipment = this[index];
            shipment.ShipmentLines.AssociationChanged -= ShipmentLines_AssociationChanged;

            for (int i = shipment.ShipmentLines.Count; i >= 0; i--)
            {
                this.Context.DeleteObject(shipment.ShipmentLines.ElementAt(i));
            }
            this.Context.DeleteObject(this[index]);
            base.RemoveItem(index);
        }
    }
}
