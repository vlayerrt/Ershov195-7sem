using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace TourAgencyErshov
{
    /// <summary>
    /// Логика взаимодействия для HotelsPage.xaml
    /// </summary>
    public partial class HotelsPage : Page
    {
        public HotelsPage()
        {
            InitializeComponent();
            //DGridHotels.ItemsSource = model.TourAgencyEVEntities.GetContext().Hotels.ToList();
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditPage((sender as Button).DataContext as model.Hotel));

        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditPage(null));
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            var hotelsForRemoving = DGridHotels.SelectedItems.Cast<model.Hotel>().ToList();
            if ( MessageBox.Show($"Вы уверены, что хотите удалить следующие {hotelsForRemoving.Count()} элементов?", "Внимение", 
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    model.TourAgencyEVEntities.GetContext().Hotels.RemoveRange(hotelsForRemoving);
                    model.TourAgencyEVEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные успешно удалены");
                DGridHotels.ItemsSource = model.TourAgencyEVEntities.GetContext().Hotels.ToList();

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                model.TourAgencyEVEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                DGridHotels.ItemsSource = model.TourAgencyEVEntities.GetContext().Hotels.ToList();
            }
        }
    }
}
