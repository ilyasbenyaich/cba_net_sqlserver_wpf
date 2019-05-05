using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CbaModel;
using System.Collections.ObjectModel;
using System.ComponentModel;

namespace CbaView
{
    class CalendarsCollection : ObservableCollection<Calendar>
    {
        private CbaEntities _context;
        public CbaEntities Context
        {
            get { return _context; }
        }


        public CalendarsCollection(IEnumerable<Calendar> calendars, CbaEntities context):
            base(calendars)
        {
            _context = context;

            foreach (Calendar c in calendars)
            {
                c.CalendarPeriods.AssociationChanged += new System.ComponentModel.CollectionChangeEventHandler(Periods_AssociationChanged);
            }
        }

        void Periods_AssociationChanged(object sender, System.ComponentModel.CollectionChangeEventArgs e)
        {
            if (e.Action == CollectionChangeAction.Remove)
            {
                this.Context.DeleteObject((Period)e.Element);
            }
        }

        protected override void InsertItem(int index, Calendar item)
        {
            item.CalendarPeriods.AssociationChanged += new CollectionChangeEventHandler(Periods_AssociationChanged);
            _context.AddToCalendar(item);
            base.InsertItem(index, item);
        }

        protected override void RemoveItem(int index)
        {
            Calendar calendar = this[index];
            calendar.CalendarPeriods.AssociationChanged -= Periods_AssociationChanged;

            for (int i = calendar.CalendarPeriods.Count - 1; i >= 0; i--)
            {
                this.Context.DeleteObject(calendar.CalendarPeriods.ElementAt(i));
            }
            this.Context.DeleteObject(this[index]);
            base.RemoveItem(index);
        }
    }
}
