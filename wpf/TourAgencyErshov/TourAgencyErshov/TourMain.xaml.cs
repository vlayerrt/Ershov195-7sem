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
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class TourMain : Window
    {
        public TourMain()
        {
            InitializeComponent();
            FrameMain.Navigate(new userpage());
        }

        private void Adm_Click(object sender, RoutedEventArgs e)
        {
            FrameMain.Navigate(new adminpage());

        }
        private void Usr_Click(object sender, RoutedEventArgs e)
        {
            FrameMain.Navigate(new userpage());

        }
        private void Bck_Click(object sender, RoutedEventArgs e)
        {
            FrameMain.GoBack();
        }

        private void FrameBackBtn(object sender, EventArgs e)
        {
            if (FrameMain.CanGoBack) Back_btn.Visibility = Visibility.Visible;
            else Back_btn.Visibility = Visibility.Hidden;
        }
    }
}
