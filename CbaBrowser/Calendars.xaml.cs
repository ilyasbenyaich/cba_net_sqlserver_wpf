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
    /// Interaction logic for Calendars.xaml
    /// </summary>
    public partial class Calendars : UserControl
    {
       

        private CbaEntities db = new CbaEntities();
        private CalendarsCollection CalendarData;
        private CollectionViewSource CalendarSource;
        private CollectionViewSource PeriodSource;
        private ListCollectionView CalendarView;
        private BindingListCollectionView PeriodView;

        public Calendars()
        {
            InitializeComponent();
        }

        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
            

            var calendars = from c in db.Calendar.Include("CalendarPeriods")
                            orderby c.CreatedOn
                            select c;

            this.CalendarData = new CalendarsCollection(calendars, db);

            this.CalendarSource = (CollectionViewSource)this.FindResource("CalendarSource");
            this.PeriodSource = (CollectionViewSource)this.FindResource("PeriodSource");

            CalendarSource.Source = this.CalendarData;

            this.CalendarView = ((ListCollectionView)(CalendarSource.View));
            this.CalendarView.CurrentChanged += new EventHandler(CalendarView_CurrentChanged);
            this.PeriodView = (BindingListCollectionView)(PeriodSource.View);
            //this.CalendarView.Refresh();
        }

        void CalendarView_CurrentChanged(object sender, EventArgs e)
        {
            this.PeriodView = (BindingListCollectionView)(PeriodSource.View);
        }

        private void btnPeriodAdd_Click(object sender, RoutedEventArgs e)
        {
            this.PeriodView.AddNew();
            this.PeriodView.CommitNew();
        }

        private void btnPeriodDelete_Click(object sender, RoutedEventArgs e)
        {
            if (this.PeriodView.CurrentPosition > -1)
            {
                this.PeriodView.RemoveAt(this.PeriodView.CurrentPosition);
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
            this.CalendarView.AddNew();
            this.CalendarView.CommitNew();
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Calendar);
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.CalendarView.CurrentPosition > -1)
            {
                this.CalendarView.RemoveAt(this.CalendarView.CurrentPosition);

            }
        }
    }
}
