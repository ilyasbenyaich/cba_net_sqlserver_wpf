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
    /// Interaction logic for Bills.xaml
    /// </summary>
    public partial class Bills : UserControl
    {
        public Bills()
        {
            InitializeComponent();
        }

        private CbaEntities db = new CbaEntities();
        private BillsCollection BillData;
        private CollectionViewSource BillSource;
        private CollectionViewSource BillLinesSource;
        private ListCollectionView BillView;
        private BindingListCollectionView BillLinesView;

        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
                     

            this.BillSource = (CollectionViewSource)this.FindResource("BillsSource");
            this.BillLinesSource = (CollectionViewSource)this.FindResource("BillLinesSource");
            var legalEntityLookup = ((CollectionViewSource)(this.Resources["LegalEntityLookup"]));
            var businessPartnerLookup = ((CollectionViewSource)(this.Resources["BusinessPartnerLookup"]));
            var periodLookup = ((CollectionViewSource)(this.Resources["PeriodLookup"]));
            var productLookup = ((CollectionViewSource)(this.Resources["ProductLookup"]));



            var bill = from b in db.Bill.Include("BillLines")
                           orderby b.CreatedOn descending
                           select b;

            var legalEntity = from l in db.LegalEntity
                              select l;

            var businessPartner = from b in db.BusinessPartner
                                  select b;

            var period = from p in db.Period
                         select p;


            var product = from p in db.Product
                          select p;


            this.BillData = new BillsCollection(bill, db);
            this.BillSource.Source = this.BillData;
            businessPartnerLookup.Source = businessPartner.ToList();
            legalEntityLookup.Source = legalEntity.ToList();
            periodLookup.Source = period.ToList();
            productLookup.Source = product.ToList();


            this.BillView = (ListCollectionView)(BillSource.View);
            this.BillView.CurrentChanged += new EventHandler(BillView_CurrentChanged);
            this.BillLinesView = (BindingListCollectionView)(BillLinesSource.View);
        }


        void BillView_CurrentChanged(object sender, EventArgs e)
        {
            this.BillLinesView = (BindingListCollectionView)(BillLinesSource.View);
        }

        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {

                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Bill);
                MessageBox.Show("Saved");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnAdd_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.BillView.AddNew();
            this.BillView.CommitNew();
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Bill);
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.BillView.CurrentPosition > -1)
            {
                this.BillView.RemoveAt(this.BillView.CurrentPosition);
            }
        }

        private void btnBillLinesdAdd_Click(object sender, RoutedEventArgs e)
        {
            this.BillLinesView.AddNew();
            this.BillLinesView.CommitNew();
        }

        private void btnBillLinesDelete_Click(object sender, RoutedEventArgs e)
        {
            if (this.BillLinesView.CurrentPosition > -1)
            {
                this.BillLinesView.RemoveAt(this.BillLinesView.CurrentPosition);
            }
        }
    
    }
}
