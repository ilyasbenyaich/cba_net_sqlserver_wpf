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
    /// Interaction logic for BusinessPartners.xaml
    /// </summary>
    public partial class BusinessPartners : UserControl
    {
        public BusinessPartners()
        {
            InitializeComponent();
        }

        private CbaEntities db = new CbaEntities();
        private BusinessPartnersCollection BusinessPartnerData;
        private ListCollectionView BusinessPartnerView;

        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
            var businessPartnerSource = ((CollectionViewSource)(this.Resources["BusinessPartnerSource"]));
            var legalEntityLookup = ((CollectionViewSource)(this.Resources["LegalEntityLookup"]));

            var businessPartner = from v in db.BusinessPartner
                          orderby v.CreatedOn
                          select v;

            var legalEntities = from o in db.LegalEntity
                          select o;

            this.BusinessPartnerData = new BusinessPartnersCollection(businessPartner, db);

            businessPartnerSource.Source = this.BusinessPartnerData;
            legalEntityLookup.Source = legalEntities.ToList();
            
            this.BusinessPartnerView = ((ListCollectionView)(businessPartnerSource.View));
            this.BusinessPartnerView.Refresh();


        }

        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {
                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.BusinessPartner);
                MessageBox.Show("Saved");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnAdd_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.BusinessPartnerView.AddNew();
            this.BusinessPartnerView.CommitNew();
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.BusinessPartner);
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.BusinessPartnerView.CurrentPosition > -1)
            {
                this.BusinessPartnerView.RemoveAt(this.BusinessPartnerView.CurrentPosition);
                //db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Ledger);
            }
        }

    }
}
