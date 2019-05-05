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
    /// Interaction logic for Addresses.xaml
    /// </summary>
    public partial class Addresses : UserControl
    {
        public Addresses()
        {
            InitializeComponent();
        }

        private CbaEntities db = new CbaEntities();
        private AddressesCollection AddressData;
        private ListCollectionView View;

        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {

            var addressSource = ((CollectionViewSource)(this.Resources["AddressSource"]));
            var countryLookup = ((CollectionViewSource)(this.Resources["CountryLookup"]));

            var addresses = from a in db.Address
                            orderby a.CreatedOn descending
                            select a;

            var country = from c in db.Territory
                          orderby c.Name
                          select c;

            this.AddressData = new AddressesCollection(addresses, db);

            addressSource.Source = this.AddressData;
            countryLookup.Source = country.ToList();

            this.View = ((ListCollectionView)(addressSource.View));

            this.View.Refresh();

        }

        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {
                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Address);
                MessageBox.Show("Saved");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnAdd_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.View.AddNew();
            this.View.CommitNew();
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Address);
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.View.CurrentPosition > -1)
            {
                this.View.RemoveAt(this.View.CurrentPosition);
                //db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Ledger);
            }
        }
        

    }
}
