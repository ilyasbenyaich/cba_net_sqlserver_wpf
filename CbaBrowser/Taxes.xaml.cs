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
    /// Interaction logic for Tax.xaml
    /// </summary>
    public partial class Taxes : UserControl
    {
        public Taxes()
        {
            InitializeComponent();
        }

        private CbaEntities db = new CbaEntities();
        private TaxesCollection TaxData;
        private ListCollectionView View;

        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
            var taxSource = ((CollectionViewSource)(this.Resources["TaxSource"]));
            var countryLookup = ((CollectionViewSource)(this.Resources["CountryLookup"]));
 

            var taxes =  from t in db.Tax
                          orderby t.CreatedOn descending
                          select t;


            var country = from c in db.Territory
                            orderby c.Name
                            select c;

            this.TaxData = new TaxesCollection(taxes, db);

            taxSource.Source = this.TaxData;
            countryLookup.Source = country.ToList();

            this.View = ((ListCollectionView)(taxSource.View));
            this.View.Refresh();


        }

        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {
                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Tax);
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
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Tax);
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
