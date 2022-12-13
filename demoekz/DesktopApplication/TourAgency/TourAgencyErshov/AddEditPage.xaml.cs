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
    /// Логика взаимодействия для AddEditPage.xaml
    /// </summary>
    public partial class AddEditPage : Page
    {
        private model.Hotel _currentHotel = new model.Hotel();
        public AddEditPage(model.Hotel  selectedHotel)
        {
            InitializeComponent();

            if (selectedHotel != null)
                _currentHotel = selectedHotel;

            DataContext = _currentHotel;
            ComboCountries.ItemsSource = model.TourAgencyEVEntities.GetContext().Countries.ToList();
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (string.IsNullOrWhiteSpace(_currentHotel.HotelName))
                errors.AppendLine("Укажите Навзание отеля");
            if (_currentHotel.Stars < 1 || _currentHotel.Stars > 5)
                errors.AppendLine("Рейтинг - от 1 до 5");
            if (_currentHotel.Country == null)
                errors.AppendLine("Выберите страну");

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            if (_currentHotel.HotelID == 0)
                model.TourAgencyEVEntities.GetContext().Hotels.Add(_currentHotel);

            try
            {
                model.TourAgencyEVEntities.GetContext().SaveChanges();
                MessageBox.Show("Информация успешно сохранена.");
                Manager.MainFrame.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}
