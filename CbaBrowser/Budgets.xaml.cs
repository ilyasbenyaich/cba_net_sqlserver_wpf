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
    /// Interaction logic for Budgets.xaml
    /// </summary>
    public partial class Budgets : UserControl
    {
        public Budgets()
        {
            InitializeComponent();
        }

        private CbaEntities db = new CbaEntities();
        private BudgetsCollection BudgetData;
        private CollectionViewSource BudgetSource;
        private CollectionViewSource BudgetLinesSource;
        private ListCollectionView BudgetView;
        private BindingListCollectionView BudgetLinesView;

        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
                     

            this.BudgetSource = (CollectionViewSource)this.FindResource("BudgetResource");
            this.BudgetLinesSource = (CollectionViewSource)this.FindResource("BudgetLinesResource");
            var calendarLookup = ((CollectionViewSource)(this.Resources["CalendarLookup"]));
            var legalEntityLookup = ((CollectionViewSource)(this.Resources["LegalEntityLookup"]));
            var periodLookup = ((CollectionViewSource)(this.Resources["PeriodLookup"]));
            var accountLookup = ((CollectionViewSource)(this.Resources["AccountLookup"]));

            
            var budget = from b in db.Budget.Include("BudgetLines")
                         orderby b.CreatedOn descending
                         select b;

            var calendar = from c in db.Calendar
                           select c;


            var legalEntity = from l in db.LegalEntity
                              select l;

            var period = from p in db.Period
                         select p;

            var account = from a in db.Account
                          select a;


            this.BudgetData = new BudgetsCollection(budget, db);
            this.BudgetSource.Source = this.BudgetData;
            legalEntityLookup.Source = legalEntity.ToList();
            periodLookup.Source = period.ToList();
            accountLookup.Source = account.ToList();
            calendarLookup.Source = calendar.ToList();

            this.BudgetView = (ListCollectionView)(BudgetSource.View);
            this.BudgetView.CurrentChanged += new EventHandler(BudgetView_CurrentChanged);
            this.BudgetLinesView = (BindingListCollectionView)(BudgetLinesSource.View);
        }


        void BudgetView_CurrentChanged(object sender, EventArgs e)
        {
            this.BudgetLinesView = (BindingListCollectionView)(BudgetLinesSource.View);
        }

        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {

                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Budget);
                MessageBox.Show("Saved");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnAdd_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.BudgetView.AddNew();
            this.BudgetView.CommitNew();
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Budget);
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.BudgetView.CurrentPosition > -1)
            {
                this.BudgetView.RemoveAt(this.BudgetView.CurrentPosition);
            }
        }

        private void btnBudgetLinesAdd_Click(object sender, RoutedEventArgs e)
        {
            this.BudgetLinesView.AddNew();
            this.BudgetLinesView.CommitNew();
        }

        private void btnBudgetLinesDelete_Click(object sender, RoutedEventArgs e)
        {
            if (this.BudgetLinesView.CurrentPosition > -1)
            {
                this.BudgetLinesView.RemoveAt(this.BudgetLinesView.CurrentPosition);
            }
        }
    }
}
