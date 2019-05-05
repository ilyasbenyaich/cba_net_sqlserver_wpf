using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CbaModel;
using System.Collections.ObjectModel;

namespace CbaView
{
    class CurrenciesCollection : ObservableCollection<Currency>
    {
        private CbaEntities _context;

        public CurrenciesCollection(IEnumerable<Currency> currencies, CbaEntities context)
            : base(currencies)
        {
            _context = context;
        }


    }
}
