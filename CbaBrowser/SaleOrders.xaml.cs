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
    /// Interaction logic for SaleOrders.xaml
    /// </summary>
    public partial class SaleOrders : UserControl
    {
        public SaleOrders()
        {
            InitializeComponent();
        }

        private CbaEntities db = new CbaEntities();
        private SaleOrdersCollection SaleOrderData;
        private CollectionViewSource SaleOrderSource;
        private CollectionViewSource SaleOrderLinesSource;
        private ListCollectionView SaleOrderView;
        private BindingListCollectionView SaleOrderLinesView;

        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
                     

            this.SaleOrderSource = (CollectionViewSource)this.FindResource("SaleOrdersSource");
            this.SaleOrderLinesSource = (CollectionViewSource)this.FindResource("SaleOrderLinesSource");
            var legalEntityLookup = ((CollectionViewSource)(this.Resources["LegalEntityLookup"]));
            var businessPartnerLookup = ((CollectionViewSource)(this.Resources["BusinessPartnerLookup"]));
            var periodLookup = ((CollectionViewSource)(this.Resources["PeriodLookup"]));
            var productLookup = ((CollectionViewSource)(this.Resources["ProductLookup"]));



            var saleOrder = from s in db.SaleOrder.Include("SaleOrderLines")
                           orderby s.CreatedOn descending
                           select s;

            var legalEntity = from l in db.LegalEntity
                              select l;

            var businessPartner = from b in db.BusinessPartner
                                  select b;

            var period = from p in db.Period
                         select p;


            var product = from p in db.Product
                          select p;


            this.SaleOrderData = new SaleOrdersCollection(saleOrder, db);
            this.SaleOrderSource.Source = this.SaleOrderData;
            businessPartnerLookup.Source = businessPartner.ToList();
            legalEntityLookup.Source = legalEntity.ToList();
            periodLookup.Source = period.ToList();
            productLookup.Source = product.ToList();


            this.SaleOrderView = (ListCollectionView)(SaleOrderSource.View);
            this.SaleOrderView.CurrentChanged += new EventHandler(SaleOrderView_CurrentChanged);
            this.SaleOrderLinesView = (BindingListCollectionView)(SaleOrderLinesSource.View);
        }


        void SaleOrderView_CurrentChanged(object sender, EventArgs e)
        {
            this.SaleOrderLinesView = (BindingListCollectionView)(SaleOrderLinesSource.View);
        }

        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {

                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.SaleOrder);
                MessageBox.Show("Saved");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnAdd_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.SaleOrderView.AddNew();
            this.SaleOrderView.CommitNew();
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.SaleOrder);
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.SaleOrderView.CurrentPosition > -1)
            {
                this.SaleOrderView.RemoveAt(this.SaleOrderView.CurrentPosition);
            }
        }

        private void btnSaleOrderLinesdAdd_Click(object sender, RoutedEventArgs e)
        {
            this.SaleOrderLinesView.AddNew();
            this.SaleOrderLinesView.CommitNew();
        }

        private void btnSaleOrderLinesDelete_Click(object sender, RoutedEventArgs e)
        {
            if (this.SaleOrderLinesView.CurrentPosition > -1)
            {
                this.SaleOrderLinesView.RemoveAt(this.SaleOrderLinesView.CurrentPosition);
            }
        }
    
    }
}
