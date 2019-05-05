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
    /// Interaction logic for RequestForQuotes.xaml
    /// </summary>
    public partial class RequestForQuotes : UserControl
    {
        public RequestForQuotes()
        {
            InitializeComponent();
        }

        private CbaEntities db = new CbaEntities();
        private RequestForQuotesCollection RequestForQuoteData;
        private CollectionViewSource RequestForQuoteSource;
        private CollectionViewSource RequestForQuoteLinesSource;
        private ListCollectionView RequestForQuoteView;
        private BindingListCollectionView RequestForQuoteLinesView;

        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
                     

            this.RequestForQuoteSource = (CollectionViewSource)this.FindResource("RequestForQuotesSource");
            this.RequestForQuoteLinesSource = (CollectionViewSource)this.FindResource("RequestForQuoteLinesSource");
            var legalEntityLookup = ((CollectionViewSource)(this.Resources["LegalEntityLookup"]));
            var businessPartnerLookup = ((CollectionViewSource)(this.Resources["BusinessPartnerLookup"]));
            var periodLookup = ((CollectionViewSource)(this.Resources["PeriodLookup"]));
            var productLookup = ((CollectionViewSource)(this.Resources["ProductLookup"]));
            

            
            var requestForQuote = from r in db.RequestForQuote.Include("RequestForQuoteLines")
                           orderby r.CreatedOn descending
                           select r;

            var legalEntity = from l in db.LegalEntity
                              select l;

            var businessPartner = from b in db.BusinessPartner
                         select b;

            var period = from p in db.Period
                         select p;


            var product = from p in db.Product
                          select p;


            this.RequestForQuoteData = new RequestForQuotesCollection(requestForQuote, db);
            this.RequestForQuoteSource.Source = this.RequestForQuoteData;
            businessPartnerLookup.Source = businessPartner.ToList();
            legalEntityLookup.Source = legalEntity.ToList();
            periodLookup.Source = period.ToList();
            productLookup.Source = product.ToList();
            

            this.RequestForQuoteView = (ListCollectionView)(RequestForQuoteSource.View);
            this.RequestForQuoteView.CurrentChanged += new EventHandler(RequestForQuoteView_CurrentChanged);
            this.RequestForQuoteLinesView = (BindingListCollectionView)(RequestForQuoteLinesSource.View);
        }


        void RequestForQuoteView_CurrentChanged(object sender, EventArgs e)
        {
            this.RequestForQuoteLinesView = (BindingListCollectionView)(RequestForQuoteLinesSource.View);
        }

        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {

                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.RequestForQuote);
                MessageBox.Show("Saved");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnAdd_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.RequestForQuoteView.AddNew();
            this.RequestForQuoteView.CommitNew();
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.RequestForQuote);
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.RequestForQuoteView.CurrentPosition > -1)
            {
                this.RequestForQuoteView.RemoveAt(this.RequestForQuoteView.CurrentPosition);
            }
        }

        private void btnRequestForQuoteLinesdAdd_Click(object sender, RoutedEventArgs e)
        {
            this.RequestForQuoteLinesView.AddNew();
            this.RequestForQuoteLinesView.CommitNew();
        }

        private void btnRequestForQuoteLinesDelete_Click(object sender, RoutedEventArgs e)
        {
            if (this.RequestForQuoteLinesView.CurrentPosition > -1)
            {
                this.RequestForQuoteLinesView.RemoveAt(this.RequestForQuoteLinesView.CurrentPosition);
            }
        }
    
    }
}
