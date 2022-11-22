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
    /// Логика взаимодействия для loginpage.xaml
    /// </summary>
    public partial class loginpage : Page
    {
        public loginpage()
        {
            InitializeComponent();
        }
        private void ShowPass_CheckedChanged(object sender, RoutedEventArgs e)
        {
            if (ShowPass.IsChecked == true)
            {
                passVisBox.Visibility = Visibility.Visible;
                passBox.Visibility = Visibility.Collapsed;
                passVisBox.Text = passBox.Password;
            }
            else if (ShowPass.IsChecked == false)
            {
                passBox.Visibility = Visibility.Visible;
                passVisBox.Visibility = Visibility.Collapsed;
            }
        }

        private void LoginBtn_Click(object sender, RoutedEventArgs e)
        {
                       var currentUser = App.Context.Users.FirstOrDefault(p => p.login == loginBox.Text && p.password == passBox.Password);

                        if (currentUser != null)
                        {
                            App.CurrentUser = currentUser;
                        }
                        else if (currentUser != null)
                        {
                            App.CurrentUser = currentUser;
                        }
                        else
                        {
                            MessageBox.Show("Пользователь не найден", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        }

                        if (App.CurrentUser.RoleID == 1)
                        {
                            NavigationService.Navigate(new adminpage());

                        }
                        else if (App.CurrentUser.RoleID == 2)
                        {
                            NavigationService.Navigate(new userpage());
                        }
        }
    }
}
