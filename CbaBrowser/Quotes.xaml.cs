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
    /// Interaction logic for Quotes.xaml
    /// </summary>
    public partial class Quotes : UserControl
    {
        public Quotes()
        {
            InitializeComponent();
        }

        private CbaEntities db = new CbaEntities();
        private QuotesCollection QuoteData;
        private CollectionViewSource QuoteSource;
        private CollectionViewSource QuoteLinesSource;
        private ListCollectionView QuoteView;
        private BindingListCollectionView QuoteLinesView;

        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
                     

            this.QuoteSource = (CollectionViewSource)this.FindResource("QuotesSource");
            this.QuoteLinesSource = (CollectionViewSource)this.FindResource("QuoteLinesSource");
            var legalEntityLookup = ((CollectionViewSource)(this.Resources["LegalEntityLookup"]));
            var businessPartnerLookup = ((CollectionViewSource)(this.Resources["BusinessPartnerLookup"]));
            var periodLookup = ((CollectionViewSource)(this.Resources["PeriodLookup"]));
            var productLookup = ((CollectionViewSource)(this.Resources["ProductLookup"]));



            var quote = from q in db.Quote.Include("QuoteLines")
                           orderby q.CreatedOn descending
                           select q;

            var legalEntity = from l in db.LegalEntity
                              select l;

            var businessPartner = from b in db.BusinessPartner
                                  select b;

            var period = from p in db.Period
                         select p;


            var product = from p in db.Product
                          select p;


            this.QuoteData = new QuotesCollection(quote, db);
            this.QuoteSource.Source = this.QuoteData;
            businessPartnerLookup.Source = businessPartner.ToList();
            legalEntityLookup.Source = legalEntity.ToList();
            periodLookup.Source = period.ToList();
            productLookup.Source = product.ToList();


            this.QuoteView = (ListCollectionView)(QuoteSource.View);
            this.QuoteView.CurrentChanged += new EventHandler(QuoteView_CurrentChanged);
            this.QuoteLinesView = (BindingListCollectionView)(QuoteLinesSource.View);
        }


        void QuoteView_CurrentChanged(object sender, EventArgs e)
        {
            this.QuoteLinesView = (BindingListCollectionView)(QuoteLinesSource.View);
        }

        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {

                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Quote);
                MessageBox.Show("Saved");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnAdd_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.QuoteView.AddNew();
            this.QuoteView.CommitNew();
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Quote);
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.QuoteView.CurrentPosition > -1)
            {
                this.QuoteView.RemoveAt(this.QuoteView.CurrentPosition);
            }
        }

        private void btnQuoteLinesdAdd_Click(object sender, RoutedEventArgs e)
        {
            this.QuoteLinesView.AddNew();
            this.QuoteLinesView.CommitNew();
        }

        private void btnQuoteLinesDelete_Click(object sender, RoutedEventArgs e)
        {
            if (this.QuoteLinesView.CurrentPosition > -1)
            {
                this.QuoteLinesView.RemoveAt(this.QuoteLinesView.CurrentPosition);
            }
        }
    
    }
}
