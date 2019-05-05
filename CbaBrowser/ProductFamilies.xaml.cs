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
    /// Interaction logic for ProductFamilies.xaml
    /// </summary>
    public partial class ProductFamilies : UserControl
    {
        public ProductFamilies()
        {
            InitializeComponent();
        }

        private CbaEntities db = new CbaEntities();
        private ProductFamiliesCollection ProductFamilyData;
        private CollectionViewSource ProductFamilySource;
        private ListCollectionView ProductFamilyView;


        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
           

            var productFamilies = from pf in db.ProductFamily
                            orderby pf.CreatedOn
                            select pf;

            this.ProductFamilyData = new ProductFamiliesCollection(productFamilies, db);
            this.ProductFamilySource = (CollectionViewSource)this.FindResource("ProductFamilySource");
            ProductFamilySource.Source = this.ProductFamilyData;
            this.ProductFamilyView = ((ListCollectionView)(ProductFamilySource.View));
  
           
        }

        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {
                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.ProductFamily);
                MessageBox.Show("Saved");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnAdd_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.ProductFamilyView.AddNew();
            this.ProductFamilyView.CommitNew();
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Chart);
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.ProductFamilyView.CurrentPosition > -1)
            {
                this.ProductFamilyView.RemoveAt(this.ProductFamilyView.CurrentPosition);
   
           }
        }
    
    }
}
