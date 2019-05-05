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
    /// Interaction logic for Invoices.xaml
    /// </summary>
    public partial class Invoices : UserControl
    {
        public Invoices()
        {
            InitializeComponent();
        }

        private CbaEntities db = new CbaEntities();
        private InvoicesCollection InvoiceData;
        private CollectionViewSource InvoiceSource;
        private CollectionViewSource InvoiceLinesSource;
        private ListCollectionView InvoiceView;
        private BindingListCollectionView InvoiceLinesView;

        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
                     

            this.InvoiceSource = (CollectionViewSource)this.FindResource("InvoicesSource");
            this.InvoiceLinesSource = (CollectionViewSource)this.FindResource("InvoiceLinesSource");
            var legalEntityLookup = ((CollectionViewSource)(this.Resources["LegalEntityLookup"]));
            var businessPartnerLookup = ((CollectionViewSource)(this.Resources["BusinessPartnerLookup"]));
            var periodLookup = ((CollectionViewSource)(this.Resources["PeriodLookup"]));
            var productLookup = ((CollectionViewSource)(this.Resources["ProductLookup"]));



            var invoice = from s in db.Invoice.Include("InvoiceLines")
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


            this.InvoiceData = new InvoicesCollection(invoice, db);
            this.InvoiceSource.Source = this.InvoiceData;
            businessPartnerLookup.Source = businessPartner.ToList();
            legalEntityLookup.Source = legalEntity.ToList();
            periodLookup.Source = period.ToList();
            productLookup.Source = product.ToList();


            this.InvoiceView = (ListCollectionView)(InvoiceSource.View);
            this.InvoiceView.CurrentChanged += new EventHandler(InvoiceView_CurrentChanged);
            this.InvoiceLinesView = (BindingListCollectionView)(InvoiceLinesSource.View);
        }


        void InvoiceView_CurrentChanged(object sender, EventArgs e)
        {
            this.InvoiceLinesView = (BindingListCollectionView)(InvoiceLinesSource.View);
        }

        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {

                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Invoice);
                MessageBox.Show("Saved");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnAdd_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.InvoiceView.AddNew();
            this.InvoiceView.CommitNew();
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Invoice);
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.InvoiceView.CurrentPosition > -1)
            {
                this.InvoiceView.RemoveAt(this.InvoiceView.CurrentPosition);
            }
        }

        private void btnInvoiceLinesdAdd_Click(object sender, RoutedEventArgs e)
        {
            this.InvoiceLinesView.AddNew();
            this.InvoiceLinesView.CommitNew();
        }

        private void btnInvoiceLinesDelete_Click(object sender, RoutedEventArgs e)
        {
            if (this.InvoiceLinesView.CurrentPosition > -1)
            {
                this.InvoiceLinesView.RemoveAt(this.InvoiceLinesView.CurrentPosition);
            }
        }
    
    }
}
