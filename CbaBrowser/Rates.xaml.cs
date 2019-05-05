using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using CbaModel;

namespace CbaView
{
    /// <summary>
    /// Interaction logic for Rates.xaml
    /// </summary>
    public partial class Rates : UserControl
    {
        public Rates()
        {
            InitializeComponent();
        }

        private CbaEntities db = new CbaEntities();
        private ListCollectionView RatesView;
        private RatesCollection RatesData;

        private void UC_Loaded(object sender , System.Windows.RoutedEventArgs e)
        {
            var rateResource = (CollectionViewSource)(this.Resources["RateResource"]);
            var currencyFromResource = (CollectionViewSource)(this.Resources["CurrencyFromLookup"]);
            var currencyToResource = (CollectionViewSource)(this.Resources["CurrencyToLookup"]);

            var rate = from r in db.Rate
                       orderby r.CreatedOn descending
                       select r;

            var currencyFrom = from cf in db.Currency
                               select cf;

            var currencyTo = from ct in db.Currency
                             select ct;

            this.RatesData = new RatesCollection(rate, db);
            rateResource.Source = this.RatesData;
            currencyFromResource.Source = currencyFrom.ToList();
            currencyToResource.Source = currencyTo.ToList();
            this.RatesView = (ListCollectionView)(rateResource.View);
            this.RatesView.Refresh();
        }

        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {
                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Rate);
                MessageBox.Show("Saved");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnAdd_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.RatesView.AddNew();
            this.RatesView.CommitNew();
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Rate);
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.RatesView.CurrentPosition > -1)
            {
                this.RatesView.RemoveAt(this.RatesView.CurrentPosition);
                //db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Ledger);
            }
        }
        
    }
}
