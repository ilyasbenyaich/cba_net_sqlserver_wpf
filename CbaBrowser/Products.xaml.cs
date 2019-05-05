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
    /// Interaction logic for Products.xaml
    /// </summary>
    public partial class Products : UserControl
    {
        public Products()
        {
            InitializeComponent();
        }

        private CbaEntities db = new CbaEntities();
        private ListCollectionView ProductsView;
        private ProductsCollection ProductsData;

        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
            var productsSource = (CollectionViewSource)(this.Resources["ProductsSource"]);
            var productsSubFamilySource = (CollectionViewSource)(this.Resources["ProductsSubFamilyLookup"]);


            var products = from p in db.Product
                       orderby p.CreatedOn descending
                       select p;

            var productsSubFamily = from psf in db.ProductSubFamily
                                    select psf;


            this.ProductsData = new ProductsCollection(products, db);
            productsSource.Source = this.ProductsData;
            productsSubFamilySource.Source = productsSubFamily.ToList();

            this.ProductsView = (ListCollectionView)(productsSource.View);
            this.ProductsView.Refresh();
        }

        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {
                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Product);
                MessageBox.Show("Saved");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnAdd_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.ProductsView.AddNew();
            this.ProductsView.CommitNew();
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Rate);
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.ProductsView.CurrentPosition > -1)
            {
                this.ProductsView.RemoveAt(this.ProductsView.CurrentPosition);
                //db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Ledger);
            }
        }
    }
}
