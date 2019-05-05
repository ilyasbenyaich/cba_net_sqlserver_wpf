using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
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
    /// Interaction logic for Page1.xaml
    /// </summary>
    public partial class Main : Page
    {
        public Main()
        {
            InitializeComponent();
        }

        private void MainDock_Loaded(object sender, RoutedEventArgs e)
        {
            

        }

        private void CurrenciesRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            Currencies currenciesUserCtrl = new Currencies();
            DockPanel.SetDock(currenciesUserCtrl, Dock.Left);
            MainDock.Children.Add(currenciesUserCtrl);
          
        }

        private void CalendarsRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            Calendars calendarsUserCtrl = new Calendars();
            DockPanel.SetDock(calendarsUserCtrl, Dock.Left);
            MainDock.Children.Add(calendarsUserCtrl);
            
        }

        private void ChartsRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            Charts chartsUserCtrl = new Charts();
            DockPanel.SetDock(chartsUserCtrl, Dock.Left);
            MainDock.Children.Add(chartsUserCtrl);
        }


        private void BanksRBT_Click(object sender, RoutedEventArgs e)
        {

            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            Banks banksUserCtrl = new Banks();
            DockPanel.SetDock(banksUserCtrl, Dock.Left);
            MainDock.Children.Add(banksUserCtrl);

        }

        private void TaxesRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            Taxes taxesUserControl = new Taxes();
            DockPanel.SetDock(taxesUserControl, Dock.Left);
            MainDock.Children.Add(taxesUserControl);
            
        }

        private void JournalsRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            Journals journalsUserControl = new Journals();
            DockPanel.SetDock(journalsUserControl, Dock.Left);
            MainDock.Children.Add(journalsUserControl);
        }

        private void AddressesRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            Addresses addressesUserControl = new Addresses();
            DockPanel.SetDock(addressesUserControl, Dock.Left);
            MainDock.Children.Add(addressesUserControl);
        }

        /*
        private void OrganizationsRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            Organizations organizationsUserControl = new Organizations();
            DockPanel.SetDock(organizationsUserControl, Dock.Left);
            MainDock.Children.Add(organizationsUserControl);
        }
        */

        private void LegalEntitiesRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            LegalEntities legalEntitiesUserControl = new LegalEntities();
            DockPanel.SetDock(legalEntitiesUserControl, Dock.Left);
            MainDock.Children.Add(legalEntitiesUserControl);
        }

        private void RatesRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            Rates ratesUserControl = new Rates();
            DockPanel.SetDock(ratesUserControl, Dock.Left);
            MainDock.Children.Add(ratesUserControl);
        }

        private void BudgetRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            Budgets budgetsUserControl = new Budgets();
            DockPanel.SetDock(budgetsUserControl, Dock.Left);
            MainDock.Children.Add(budgetsUserControl);
        }

        private void ProductFamilyRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            ProductFamilies productFamiliesUserControl = new ProductFamilies();
            DockPanel.SetDock(productFamiliesUserControl, Dock.Left);
            MainDock.Children.Add(productFamiliesUserControl);
        }

        private void BusinessPartnerRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            BusinessPartners businessPartnersUserControl = new BusinessPartners();
            DockPanel.SetDock(businessPartnersUserControl, Dock.Left);
            MainDock.Children.Add(businessPartnersUserControl);
        }

        private void ProductSubFamilyRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            ProductSubFamilies productSubFamiliesUserControl = new ProductSubFamilies();
            DockPanel.SetDock(productSubFamiliesUserControl, Dock.Left);
            MainDock.Children.Add(productSubFamiliesUserControl);
        }

        private void ProductRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            Products productsUserControl = new Products();
            DockPanel.SetDock(productsUserControl, Dock.Left);
            MainDock.Children.Add(productsUserControl);
        }


        private void PurchaseOrderRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            PurchaseOrders purchaseOrdersUserControl = new PurchaseOrders();
            DockPanel.SetDock(purchaseOrdersUserControl, Dock.Left);
            MainDock.Children.Add(purchaseOrdersUserControl);
        }

        private void RequestForQuoteRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            RequestForQuotes requestForQuotesUserControl = new RequestForQuotes();
            DockPanel.SetDock(requestForQuotesUserControl, Dock.Left);
            MainDock.Children.Add(requestForQuotesUserControl);
        }


        private void GoodsReceiptRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            GoodsReceipts goodsReceiptsUserControl = new GoodsReceipts();
            DockPanel.SetDock(goodsReceiptsUserControl, Dock.Left);
            MainDock.Children.Add(goodsReceiptsUserControl);
        }

        private void BillRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            Bills billsUserControl = new Bills();
            DockPanel.SetDock(billsUserControl, Dock.Left);
            MainDock.Children.Add(billsUserControl);
        }

        private void QuoteRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            Quotes quotesUserControl = new Quotes();
            DockPanel.SetDock(quotesUserControl, Dock.Left);
            MainDock.Children.Add(quotesUserControl);
        }

        
        private void SaleOrderRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            SaleOrders saleOrdersUserControl = new SaleOrders();
            DockPanel.SetDock(saleOrdersUserControl, Dock.Left);
            MainDock.Children.Add(saleOrdersUserControl);
        }

        private void ShipmentRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            Shipments shipmentUserControl = new Shipments();
            DockPanel.SetDock(shipmentUserControl, Dock.Left);
            MainDock.Children.Add(shipmentUserControl);
        }

        private void  InvoiceRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            RemoveDockChildren();
            Invoices invoiceUserControl = new Invoices();
            DockPanel.SetDock(invoiceUserControl, Dock.Left);
            MainDock.Children.Add(invoiceUserControl);
        }

        private void RemoveDockChildren()
        {
            DockPanel leftDock = this.MainDock;
            UIElementCollection uic = MainDock.Children;
            int numOfElements = MainDock.Children.Count;
            MainDock.Children.RemoveRange(2, numOfElements - 1);
        }

        /*
        private void BudgetRBT_Click(object sender, RoutedEventArgs e)
        {
            DockPanel MainDock = this.MainDock;
            DataGrid budgetsDataGrid = new DataGrid();
            using (CbaEntities cbaEntities = new CbaEntities())
            {

                var budgets = (from c in cbaEntities.Budget
                                select new { c.Name , c.Status }).ToList();
                budgetsDataGrid.ItemsSource = budgets;

            }

            RemoveDockChildren();
            DockPanel.SetDock(budgetsDataGrid, Dock.Left);
            MainDock.Children.Add(budgetsDataGrid);
            Rectangle detailsArea = new Rectangle();
            detailsArea.Fill = Brushes.White;
            MainDock.Children.Add(detailsArea);
            budgetsDataGrid.MouseDoubleClick += new MouseButtonEventHandler(budgetsDataGrid_MouseDoubleClick);
        }
        
        

        private void currenciesDataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            
             //var grid = sender as DataGrid;
             DataGridRow row = ItemsControl.ContainerFromElement((DataGrid)sender, e.OriginalSource as DependencyObject) as DataGridRow;
             
            if (row == null)
             {
                 return;
             }
             else
             {
                 MessageBox.Show(string.Format("Value of  selected currency at {0}" , row.Item.ToString()));
             }
             
        }


        private void calendarsDataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e) 
        {
            DataGridRow row = ItemsControl.ContainerFromElement((DataGrid)sender, e.OriginalSource as DependencyObject) as DataGridRow;

            if (row == null)
            {
                return;
            }
            else
            {
                MessageBox.Show(string.Format("Value of  selected calendar {0}", row.Item.ToString()));
            } 
        }

        private void chartsDataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e) 
        {
            DataGridRow row = ItemsControl.ContainerFromElement((DataGrid)sender, e.OriginalSource as DependencyObject) as DataGridRow;

            if (row == null)
            {
                return;
            }
            else
            {
                MessageBox.Show(string.Format("Value of  selected chart  {0}", row.Item.ToString()));
            }
        }

        private void ledgersDataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e) 
        {
            DataGridRow row = ItemsControl.ContainerFromElement((DataGrid)sender, e.OriginalSource as DependencyObject) as DataGridRow;

            if (row == null)
            {
                return;
            }
            else
            {
                MessageBox.Show(string.Format("Value of  selected ledger {0}", row.Item.ToString()));
            } 
        }

        private void taxesDataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        { 
            DataGridRow row = ItemsControl.ContainerFromElement((DataGrid)sender, e.OriginalSource as DependencyObject) as DataGridRow;

            if (row == null)
            {
                return;
            }
            else
            {
                MessageBox.Show(string.Format("Value of  selected ledger {0}", row.Item.ToString()));
            } 
        }

        private void journalsDataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e) 
        {
            DataGridRow row = ItemsControl.ContainerFromElement((DataGrid)sender, e.OriginalSource as DependencyObject) as DataGridRow;

            if (row == null)
            {
                return;
            }
            else
            {
                MessageBox.Show(string.Format("Value of  selected journal {0}", row.Item.ToString()));
            } 
        }

        private void budgetsDataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        { 
            DataGridRow row = ItemsControl.ContainerFromElement((DataGrid)sender, e.OriginalSource as DependencyObject) as DataGridRow;

            if (row == null)
            {
                return;
            }
            else
            {
                MessageBox.Show(string.Format("Value of  selected budget {0}", row.Item.ToString()));
            } 
        }
         */
    }
    
}
