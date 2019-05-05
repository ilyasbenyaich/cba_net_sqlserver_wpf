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
    /// Interaction logic for Charts.xaml
    /// </summary>
    public partial class Charts : UserControl
    {
        public Charts()
        {
            InitializeComponent();
        }


        private CbaEntities db = new CbaEntities();
        private ChartsCollection ChartsData;
        private CollectionViewSource ChartSource;
        private CollectionViewSource AccountSource;
        private ListCollectionView ChartView;
        private BindingListCollectionView AccountView;

        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
           

            var charts = from c in db.Chart.Include("ChartAccount")
                            orderby c.CreatedOn
                            select c;

            this.ChartsData = new ChartsCollection(charts, db);

            this.ChartSource = (CollectionViewSource)this.FindResource("ChartSource");
            this.AccountSource = (CollectionViewSource)this.FindResource("AccountSource");

            ChartSource.Source = this.ChartsData;
            
            this.ChartView = ((ListCollectionView)(ChartSource.View));
            this.ChartView.CurrentChanged += new EventHandler(ChartView_CurrentChanged);
            this.AccountView = (BindingListCollectionView)(AccountSource.View);
           
        }

        void ChartView_CurrentChanged(object sender, EventArgs e)
        {
            this.AccountView = (BindingListCollectionView)(AccountSource.View);
        }

        private void btnAccountAdd_Click(object sender, RoutedEventArgs e)
        {
            this.AccountView.AddNew();
            this.AccountView.CommitNew();
        }

        private void btnAccountDelete_Click(object sender, RoutedEventArgs e)
        {
            if (this.AccountView.CurrentPosition > -1)
            {
                this.AccountView.RemoveAt(this.AccountView.CurrentPosition);
            }
        }

        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {
                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Calendar);
                MessageBox.Show("Saved");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnAdd_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.ChartView.AddNew();
            this.ChartView.CommitNew();
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Chart);
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.ChartView.CurrentPosition > -1)
            {
                this.ChartView.RemoveAt(this.ChartView.CurrentPosition);
   
           }
        }
    }
    
}
