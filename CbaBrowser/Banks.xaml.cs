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
    /// Interaction logic for Banks.xaml
    /// </summary>
    public partial class Banks : UserControl
    {
        public Banks()
        {
            InitializeComponent();
        }

        private CbaEntities db = new CbaEntities();
        private BanksCollection BankData;
        private ListCollectionView BankView;

        private void UC_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
            var bankSource = ((CollectionViewSource)(this.Resources["BankSource"]));

            var banks = from b in db.Bank
                          orderby b.CreatedOn descending
                          select b;


            this.BankData = new BanksCollection(banks, db);

            bankSource.Source = this.BankData;
            this.BankView = ((ListCollectionView)(bankSource.View));
            this.BankView.Refresh();


        }

        private void btnSave_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            try
            {
                db.SaveChanges();
                db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Bank);
                MessageBox.Show("Saved");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnAdd_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            this.BankView.AddNew();
            this.BankView.CommitNew();
            db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Bank);
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            if (this.BankView.CurrentPosition > -1)
            {
                this.BankView.RemoveAt(this.BankView.CurrentPosition);
                //db.Refresh(System.Data.Objects.RefreshMode.ClientWins, db.Ledger);
            }
        }
        

    }
}
