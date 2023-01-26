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
            FrameMain.Navigate(new loginpage());
            Manager.MainFrame = FrameMain;


        }
        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            FrameMain.Navigate(new loginpage());
            Exit_btn.Visibility = Visibility.Collapsed;
        }

        private void Adm_Click(object sender, RoutedEventArgs e)
        {
            FrameMain.Navigate(new ToursPage());
            Exit_btn.Visibility = Visibility.Visible;

        }
        private void Usr_Click(object sender, RoutedEventArgs e)
        {
            FrameMain.Navigate(new CodePage());
            Exit_btn.Visibility = Visibility.Visible;

        }
        private void Htl_Click(object sender, RoutedEventArgs e)
        {
            FrameMain.Navigate(new HotelsPage());
            Exit_btn.Visibility = Visibility.Visible;

        }
        

        private void FrameBackBtn(object sender, EventArgs e)
        {
   /*         if (FrameMain.CanGoBack) Exit_btn.Visibility = Visibility.Visible;
            else Exit_btn.Visibility = Visibility.Collapsed;*/
        }
    }
}
