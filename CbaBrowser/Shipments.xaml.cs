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
    /// Interaction logic for Shipments.xaml
    /// </summary>
    public partial class Shipments : UserControl
    {
        public Shipments()
        {
            InitializeComponent();
        }

        private CbaEntities db = new CbaEntities();
        private ShipmentsCollection ShipmentData;
        private CollectionViewSource ShipmentSource;
        private CollectionViewSource ShipmentLinesSource;
        private ListCollectionView ShipmentView;
        private BindingListCollectionView ShipmentLinesView;

        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
                     

            this.ShipmentSource = (CollectionViewSource)this.FindResource("ShipmentsSource");
            this.ShipmentLinesSource = (CollectionViewSource)this.FindResource("ShipmentLinesSource");
            var legalEntityLookup = ((CollectionViewSource)(this.Resources["LegalEntityLookup"]));
            var businessPartnerLookup = ((CollectionViewSource)(this.Resources["BusinessPartnerLookup"]));
            var periodLookup = ((CollectionViewSource)(this.Resources["PeriodLookup"]));
            var productLookup = ((CollectionViewSource)(this.Resources["ProductLookup"]));



            var shipment = from s in db.Shipment.Include("ShipmentLines")
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


            this.ShipmentData = new ShipmentsCollection(shipment, db);
            this.ShipmentSource.Source = this.ShipmentData;
            businessPartnerLookup.Source = businessPartner.ToList();
            legalEntityLookup.Source = legalEntity.ToList();
            periodLookup.Source = period.ToList();
            productLookup.Source = product.ToList();


            this.ShipmentView = (ListCollectionView)(ShipmentSource.View);
            this.ShipmentView.CurrentChanged += new EventHandler(ShipmentView_CurrentChanged);
            this.ShipmentLinesView = (BindingListCollectionView)(ShipmentLinesSource.View);
        }


        void ShipmentView_CurrentChanged(object sender, EventArgs e)
        {
            this.ShipmentLinesView = (BindingListCollectionView)(ShipmentLinesSource.View);
        }

        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {

                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Shipment);
                MessageBox.Show("Saved");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnAdd_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.ShipmentView.AddNew();
            this.ShipmentView.CommitNew();
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Shipment);
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.ShipmentView.CurrentPosition > -1)
            {
                this.ShipmentView.RemoveAt(this.ShipmentView.CurrentPosition);
            }
        }

        private void btnShipmentLinesdAdd_Click(object sender, RoutedEventArgs e)
        {
            this.ShipmentLinesView.AddNew();
            this.ShipmentLinesView.CommitNew();
        }

        private void btnShipmentLinesDelete_Click(object sender, RoutedEventArgs e)
        {
            if (this.ShipmentLinesView.CurrentPosition > -1)
            {
                this.ShipmentLinesView.RemoveAt(this.ShipmentLinesView.CurrentPosition);
            }
        }
    
    }
}
