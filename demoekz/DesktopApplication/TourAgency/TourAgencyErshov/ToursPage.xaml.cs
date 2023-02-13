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
        int _currentPage = 1, _countInPage = 10, _maxPages;
        public ToursPage()
        {
            InitializeComponent();

            var alltypes = model.TourAgencyEVEntities.GetContext().TourType.ToList();
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
            var currentTours = model.TourAgencyEVEntities.GetContext().Tour.ToList();

           //if (ComboType.SelectedIndex > 0)
                //currentTours = currentTours.Where(p => p.TourType.Contains(ComboType.SelectedItem as model.TourType)).ToList();

            currentTours = currentTours.Where(p => p.TourName.ToLower().Contains(TBoxSearch.Text.ToLower())).ToList();

            if (CheckActual.IsChecked.Value)
            {
                currentTours = currentTours.Where(p => p.IsActualBool).ToList();
            }
            LVTours.ItemsSource = currentTours.OrderBy(p => p.TicketsCount).ToList();
            _maxPages = (int)Math.Ceiling(currentTours.Count * 1.0 / _countInPage);
            currentTours = currentTours.Skip((_currentPage - 1) * _countInPage).Take(_countInPage).ToList();

            LblPages.Content = $"{_currentPage}/{_maxPages}";


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

        private void RefreshData()
        {
            var data = model.TourAgencyEVEntities.GetContext().Tour.ToList();

            // List<Models.Ingredient> listIngredients = _context.Ingredient.ToList();            

            _maxPages = (int)Math.Ceiling(data.Count * 1.0 / _countInPage);
            data = data.Skip((_currentPage - 1) * _countInPage).Take(_countInPage).ToList();

            LblPages.Content = $"{_currentPage}/{_maxPages}";

            LVTours.ItemsSource = data;

            ManageButtonsEnable();
            GeneratePageNumbers();
        }
        private void GeneratePageNumbers()
        {
            SPanelPages.Children.Clear();

            for (int i = 1; i <= _maxPages; i++)
            {
                Button btn = new Button();
                btn.Content = i.ToString();
                btn.Width = 28;
                btn.Click += NavigateToSelectedPage;
                SPanelPages.Children.Add(btn);
            }
        }

        private void NavigateToSelectedPage(object sender, RoutedEventArgs e)
        {
            Button btn = sender as Button;
            string pageStr = btn.Content.ToString();
            int page = int.Parse(pageStr);
            _currentPage = page;
            RefreshData();
        }

        private void BtnFirstPage_Click(object sender, RoutedEventArgs e)
        {
            _currentPage = 1;
            RefreshData();
        }

        private void BtnPreviousPage_Click(object sender, RoutedEventArgs e)
        {
            _currentPage--;
            RefreshData();
        }

        private void BtnNextPage_Click(object sender, RoutedEventArgs e)
        {
            _currentPage++;
            RefreshData();
        }

        private void BtnLastPage_Click(object sender, RoutedEventArgs e)
        {
            _currentPage = _maxPages;
            RefreshData();
        }

        private void ManageButtonsEnable()
        {
            BtnLastPage.IsEnabled = BtnNextPage.IsEnabled = true;
            BtnFirstPage.IsEnabled = BtnPreviousPage.IsEnabled = true;

            if (_currentPage == 1)
            {
                BtnFirstPage.IsEnabled = BtnPreviousPage.IsEnabled = false;
            }

            if (_currentPage == _maxPages)
            {
                BtnLastPage.IsEnabled = BtnNextPage.IsEnabled = false;
            }
        }

    }
}
