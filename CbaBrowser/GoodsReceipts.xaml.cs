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
    /// Interaction logic for GoodsReceipts.xaml
    /// </summary>
    public partial class GoodsReceipts : UserControl
    {
        public GoodsReceipts()
        {
            InitializeComponent();
        }

        private CbaEntities db = new CbaEntities();
        private GoodsReceiptsCollection GoodsReceiptData;
        private CollectionViewSource GoodsReceiptSource;
        private CollectionViewSource GoodsReceiptLinesSource;
        private ListCollectionView GoodsReceiptView;
        private BindingListCollectionView GoodsReceiptLinesView;

        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
                     

            this.GoodsReceiptSource = (CollectionViewSource)this.FindResource("GoodsReceiptsSource");
            this.GoodsReceiptLinesSource = (CollectionViewSource)this.FindResource("GoodsReceiptLinesSource");
            var legalEntityLookup = ((CollectionViewSource)(this.Resources["LegalEntityLookup"]));
            var businessPartnerLookup = ((CollectionViewSource)(this.Resources["BusinessPartnerLookup"]));
            var periodLookup = ((CollectionViewSource)(this.Resources["PeriodLookup"]));
            var productLookup = ((CollectionViewSource)(this.Resources["ProductLookup"]));



            var goodsReceipt = from p in db.GoodsReceipt.Include("GoodsReceiptLines")
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


            this.GoodsReceiptData = new GoodsReceiptsCollection(goodsReceipt, db);
            this.GoodsReceiptSource.Source = this.GoodsReceiptData;
            businessPartnerLookup.Source = businessPartner.ToList();
            legalEntityLookup.Source = legalEntity.ToList();
            periodLookup.Source = period.ToList();
            productLookup.Source = product.ToList();


            this.GoodsReceiptView = (ListCollectionView)(GoodsReceiptSource.View);
            this.GoodsReceiptView.CurrentChanged += new EventHandler(GoodsReceiptView_CurrentChanged);
            this.GoodsReceiptLinesView = (BindingListCollectionView)(GoodsReceiptLinesSource.View);
        }


        void GoodsReceiptView_CurrentChanged(object sender, EventArgs e)
        {
            this.GoodsReceiptLinesView = (BindingListCollectionView)(GoodsReceiptLinesSource.View);
        }

        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {

                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.GoodsReceipt);
                MessageBox.Show("Saved");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnAdd_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.GoodsReceiptView.AddNew();
            this.GoodsReceiptView.CommitNew();
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.GoodsReceipt);
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.GoodsReceiptView.CurrentPosition > -1)
            {
                this.GoodsReceiptView.RemoveAt(this.GoodsReceiptView.CurrentPosition);
            }
        }

        private void btnGoodsReceiptLinesdAdd_Click(object sender, RoutedEventArgs e)
        {
            this.GoodsReceiptLinesView.AddNew();
            this.GoodsReceiptLinesView.CommitNew();
        }

        private void btnGoodsReceiptLinesDelete_Click(object sender, RoutedEventArgs e)
        {
            if (this.GoodsReceiptLinesView.CurrentPosition > -1)
            {
                this.GoodsReceiptLinesView.RemoveAt(this.GoodsReceiptLinesView.CurrentPosition);
            }
        }
    
    }
}
