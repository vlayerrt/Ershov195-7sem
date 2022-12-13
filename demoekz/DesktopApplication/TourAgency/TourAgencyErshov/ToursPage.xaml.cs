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
    /// Логика взаимодействия для ToursPage.xaml
    /// </summary>
    public partial class ToursPage : Page
    {
        public ToursPage()
        {
            InitializeComponent();

            var alltypes = model.TourAgencyEVEntities.GetContext().TourTypes.ToList();
            alltypes.Insert(0, new model.TourType
            {
                TourTypeName = "Все типы"
            });
            ComboType.ItemsSource = alltypes;

            CheckActual.IsChecked = true;
            ComboType.SelectedIndex = 0;


            UpdateTours();
           /* var currentTours = model.TourAgencyEVEntities.GetContext().Tours.ToList();
            LVTours.ItemsSource = currentTours;*/
        }

        private void UpdateTours()
        {
            var currentTours = model.TourAgencyEVEntities.GetContext().Tours.ToList();

           //if (ComboType.SelectedIndex > 0)
                //currentTours = currentTours.Where(p => p.TourTypeID.Contains(ComboType.SelectedItem as model.TourType)).ToList();

            currentTours = currentTours.Where(p => p.TourName.ToLower().Contains(TBoxSearch.Text.ToLower())).ToList();

            if (CheckActual.IsChecked.Value)
            {
                currentTours = currentTours.Where(p => p.IsActualBool).ToList();
            }
            LVTours.ItemsSource = currentTours.OrderBy(p => p.TicketsCount).ToList();
        }

        private void TBoxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateTours();
        }

        private void ComboType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateTours();
        }

        private void CheckActual_Checked(object sender, RoutedEventArgs e)
        {
            UpdateTours();
        }

        private void CheckActual_Unchecked(object sender, RoutedEventArgs e)
        {
            UpdateTours();
        }
    }
}
