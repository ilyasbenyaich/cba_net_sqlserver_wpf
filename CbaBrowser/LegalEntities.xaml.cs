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
    /// Interaction logic for LegalEntities.xaml
    /// </summary>
    public partial class LegalEntities : UserControl
    {
        public LegalEntities()
        {
            InitializeComponent();
        }

        private CbaEntities db = new CbaEntities();
        private LegalEntitiesCollection LegalEntityData;
        private ListCollectionView LegalEntityView;

        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
            var legalEntitySource = (CollectionViewSource)(this.Resources["LegalEntityResource"]);
            var chartLookup = (CollectionViewSource)(this.Resources["ChartLookup"]);

            var legalEntities = from o in db.LegalEntity
                                orderby o.CreatedOn descending
                                select o;

            var charts = from l in db.Chart
                          select l;

            this.LegalEntityData = new LegalEntitiesCollection(legalEntities, db);

            legalEntitySource.Source = this.LegalEntityData;

            chartLookup.Source = charts.ToList();

            this.LegalEntityView = (ListCollectionView)(legalEntitySource.View);

            this.LegalEntityView.Refresh();
        }


        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {
                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.LegalEntity);
                MessageBox.Show("Saved");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnAdd_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.LegalEntityView.AddNew();
            this.LegalEntityView.CommitNew();
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.LegalEntity);
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.LegalEntityView.CurrentPosition > -1)
            {
                this.LegalEntityView.RemoveAt(this.LegalEntityView.CurrentPosition);
                //db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Ledger);
            }
        }
    }
}
