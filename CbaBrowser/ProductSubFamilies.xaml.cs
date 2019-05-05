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
    /// Interaction logic for ProductSubFamilies.xaml
    /// </summary>
    public partial class ProductSubFamilies : UserControl
    {
        public ProductSubFamilies()
        {
            InitializeComponent();
        }

        private CbaEntities db = new CbaEntities();
        private ProductSubFamilyCollection ProductSubFamilyData;
        private ListCollectionView ProductSubFamilyView;

        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
            var productSubFamilySource = (CollectionViewSource)(this.Resources["ProductSubFamilySource"]);
            var productFamilyLookup = (CollectionViewSource)(this.Resources["ProductFamilyLookup"]);

            var productSubFamilies = from psf in db.ProductSubFamily
                                     orderby psf.CreatedOn descending
                                     select psf;

            var productFamilies = from pf in db.ProductFamily
                                  select pf;

            this.ProductSubFamilyData = new ProductSubFamilyCollection(productSubFamilies, db);

            productSubFamilySource.Source = this.ProductSubFamilyData;

            productFamilyLookup.Source = productFamilies.ToList();

            this.ProductSubFamilyView = (ListCollectionView)(productSubFamilySource.View);

            this.ProductSubFamilyView.Refresh();
        }


        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {
                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.ProductSubFamily);
                MessageBox.Show("Saved");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnAdd_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.ProductSubFamilyView.AddNew();
            this.ProductSubFamilyView.CommitNew();
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.ProductSubFamily);
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.ProductSubFamilyView.CurrentPosition > -1)
            {
                this.ProductSubFamilyView.RemoveAt(this.ProductSubFamilyView.CurrentPosition);
                //db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Ledger);
            }
        }
    }
}
