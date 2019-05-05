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
    /// Interaction logic for Journals.xaml
    /// </summary>
    public partial class Journals : UserControl
    {
        public Journals()
        {
            InitializeComponent();
        }

        private CbaEntities db = new CbaEntities();
        private JournalsCollection JournalData;
        private CollectionViewSource JournalSource;
        private CollectionViewSource JournalLinesSource;
        private ListCollectionView JournalView;
        private BindingListCollectionView JournalLinesView;

        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
            var journal = from j in db.Journal.Include("JournalLines")
                          orderby j.CreatedOn descending, j.JournalLegalEntity.Name, j.JournalCurrency.Code, j.JournalPeriod.Name
                          select j;

            this.JournalData = new JournalsCollection(journal, db);
            

            this.JournalSource = (CollectionViewSource)this.FindResource("JournalSource");
            this.JournalLinesSource = (CollectionViewSource)this.FindResource("JournalLinesSource");



            var legalEntityLookup = ((CollectionViewSource)(this.Resources["LegalEntityLookup"]));
            var currencyLookup = ((CollectionViewSource)(this.Resources["CurrencyLookup"]));
            var periodLookup = ((CollectionViewSource)(this.Resources["PeriodLookup"]));
            var accountLookup = ((CollectionViewSource)(this.Resources["AccountLookup"]));

            this.JournalSource.Source = this.JournalData;


            var legalEntity = from l in db.LegalEntity
                              select l;

            var currency = from cu in db.Currency
                          orderby cu.Code
                          select cu;

            var period = from p in db.Period
                         select p;

            var account = from a in db.Account
                          select a;

            legalEntityLookup.Source = legalEntity.ToList();
            currencyLookup.Source = currency.ToList();
            periodLookup.Source = period.ToList();
            accountLookup.Source = account.ToList();

            this.JournalView = (ListCollectionView)(JournalSource.View);
            this.JournalView.CurrentChanged += new EventHandler(JournalView_CurrentChanged);
            this.JournalLinesView = (BindingListCollectionView)(JournalLinesSource.View);
        }


        void JournalView_CurrentChanged(object sender, EventArgs e)
        {
            this.JournalLinesView = (BindingListCollectionView)(JournalLinesSource.View);
        }

        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {
                
                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Journal);
                MessageBox.Show("Saved");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnAdd_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.JournalView.AddNew();
            this.JournalView.CommitNew();
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Journal);
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.JournalView.CurrentPosition > -1)
            {
                this.JournalView.RemoveAt(this.JournalView.CurrentPosition);
            }
        }

        private void btnJournalLinesAdd_Click(object sender, RoutedEventArgs e)
        {
            this.JournalLinesView.AddNew();
            this.JournalLinesView.CommitNew();
        }

        private void btnJournalLinesDelete_Click(object sender, RoutedEventArgs e)
        {
            if (this.JournalLinesView.CurrentPosition > -1)
            {
                this.JournalLinesView.RemoveAt(this.JournalLinesView.CurrentPosition);
            }
        }
    }
}
