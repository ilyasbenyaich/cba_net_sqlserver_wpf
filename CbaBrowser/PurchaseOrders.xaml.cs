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
    /// Interaction logic for PurchaseOrders.xaml
    /// </summary>
    public partial class PurchaseOrders : UserControl
    {
        public PurchaseOrders()
        {
            InitializeComponent();
        }

        private CbaEntities db = new CbaEntities();
        private PurchaseOrdersCollection PurchaseOrderData;
        private CollectionViewSource PurchaseOrderSource;
        private CollectionViewSource PurchaseOrderLinesSource;
        private ListCollectionView PurchaseOrderView;
        private BindingListCollectionView PurchaseLinesView;

        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
                     

            this.PurchaseOrderSource = (CollectionViewSource)this.FindResource("PurchaseOrdersSource");
            this.PurchaseOrderLinesSource = (CollectionViewSource)this.FindResource("PurchaseOrderLinesSource");
            var legalEntityLookup = ((CollectionViewSource)(this.Resources["LegalEntityLookup"]));
            var businessPartnerLookup = ((CollectionViewSource)(this.Resources["BusinessPartnerLookup"]));
            var periodLookup = ((CollectionViewSource)(this.Resources["PeriodLookup"]));
            var productLookup = ((CollectionViewSource)(this.Resources["ProductLookup"]));



            var purchase = from p in db.PurchaseOrder.Include("PurchaseOrderLines")
                           orderby p.CreatedOn descending
                           select p;

            var legalEntity = from l in db.LegalEntity
                              select l;

            var businessPartner = from b in db.BusinessPartner
                                  select b;

            var period = from p in db.Period
                         select p;


            var product = from p in db.Product
                          select p;


            this.PurchaseOrderData = new PurchaseOrdersCollection(purchase, db);
            this.PurchaseOrderSource.Source = this.PurchaseOrderData;
            businessPartnerLookup.Source = businessPartner.ToList();
            legalEntityLookup.Source = legalEntity.ToList();
            periodLookup.Source = period.ToList();
            productLookup.Source = product.ToList();


            this.PurchaseOrderView = (ListCollectionView)(PurchaseOrderSource.View);
            this.PurchaseOrderView.CurrentChanged += new EventHandler(PurchaseOrderView_CurrentChanged);
            this.PurchaseLinesView = (BindingListCollectionView)(PurchaseOrderLinesSource.View);
        }


        void PurchaseOrderView_CurrentChanged(object sender, EventArgs e)
        {
            this.PurchaseLinesView = (BindingListCollectionView)(PurchaseOrderLinesSource.View);
        }

        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {

                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.PurchaseOrder);
                MessageBox.Show("Saved");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnAdd_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.PurchaseOrderView.AddNew();
            this.PurchaseOrderView.CommitNew();
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.PurchaseOrder);
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.PurchaseOrderView.CurrentPosition > -1)
            {
                this.PurchaseOrderView.RemoveAt(this.PurchaseOrderView.CurrentPosition);
            }
        }

        private void btnPurchaseLinesdAdd_Click(object sender, RoutedEventArgs e)
        {
            this.PurchaseLinesView.AddNew();
            this.PurchaseLinesView.CommitNew();
        }

        private void btnPurchaseLinesDelete_Click(object sender, RoutedEventArgs e)
        {
            if (this.PurchaseLinesView.CurrentPosition > -1)
            {
                this.PurchaseLinesView.RemoveAt(this.PurchaseLinesView.CurrentPosition);
            }
        }
    
    }
}
