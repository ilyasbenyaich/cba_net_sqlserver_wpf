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
    /// Interaction logic for Currencies.xaml
    /// </summary>
    public partial class Currencies : UserControl
    {
        public Currencies()
        {
            InitializeComponent();
        }

        private CbaEntities db = new CbaEntities();
        private CurrenciesCollection CurrenciesData;
        private ListCollectionView View;

        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
            var currencySource = ((CollectionViewSource)(this.Resources["CurrencySource"]));
            var currencies = from c in db.Currency
                             where c.Name != null
                             select c;

            this.CurrenciesData = new CurrenciesCollection(currencies, db);
            currencySource.Source = this.CurrenciesData;
            this.View = ((ListCollectionView)(currencySource.View));
            
        }

        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {
                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Currency);
                MessageBox.Show("Saved");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
    }
}
