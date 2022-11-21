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

namespace BlagodatErshov
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class BlagoiBlago : Window
    {
        public BlagoiBlago()
        {
            InitializeComponent();
            BlagoFrame.Navigate(new userpage());
        }

        private void BlagoFrame_ContentRendered(object sender, EventArgs e)
        {
            if (BlagoFrame.CanGoBack) Bck_btn.Visibility = Visibility.Visible;
            else Bck_btn.Visibility = Visibility.Hidden;
        }

        private void Adm_btn_Click(object sender, RoutedEventArgs e)
        {
            BlagoFrame.Navigate(new adminpage());

        }
        private void Usr_btn_Click(object sender, RoutedEventArgs e)
        {
            BlagoFrame.Navigate(new userpage());
        }
        private void Bck_btn_Click(object sender, RoutedEventArgs e)
        {
            BlagoFrame.GoBack();
        }
    }
}
