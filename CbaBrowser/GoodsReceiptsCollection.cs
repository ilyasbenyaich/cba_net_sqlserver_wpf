using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CbaModel;
using System.Collections.ObjectModel;
using System.ComponentModel;

namespace CbaView
{
    class GoodsReceiptsCollection : ObservableCollection<GoodsReceipt>
    {
        private CbaEntities _context;

        public GoodsReceiptsCollection(IEnumerable<GoodsReceipt> goodsReceipts, CbaEntities context)
            : base(goodsReceipts)
        {
            _context = context;

            foreach (GoodsReceipt g in goodsReceipts)
            {
                g.GoodsReceiptLines.AssociationChanged +=new CollectionChangeEventHandler(GoodsReceiptLines_AssociationChanged);
            }
        }

        public CbaEntities Context
        {
            get { return _context; }
        }

        void GoodsReceiptLines_AssociationChanged(object sender , CollectionChangeEventArgs e)
        {
            if (e.Action == CollectionChangeAction.Remove)
            {
                this.Context.DeleteObject((GoodsReceiptLines)e.Element);
            }
        }

        protected override void InsertItem(int index, GoodsReceipt item)
        {
            item.GoodsReceiptLines.AssociationChanged +=new CollectionChangeEventHandler(GoodsReceiptLines_AssociationChanged);
            _context.AddToGoodsReceipt(item);
            base.InsertItem(index, item);
        }

        protected override void RemoveItem(int index)
        {
            GoodsReceipt goodsReceipt = this[index];
            goodsReceipt.GoodsReceiptLines.AssociationChanged -= GoodsReceiptLines_AssociationChanged;

            for (int i = goodsReceipt.GoodsReceiptLines.Count; i >= 0; i--)
            {
                this.Context.DeleteObject(goodsReceipt.GoodsReceiptLines.ElementAt(i));
            }
            this.Context.DeleteObject(this[index]);
            base.RemoveItem(index);
        }
    }
}
