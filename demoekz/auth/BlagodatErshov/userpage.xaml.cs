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
    /// Логика взаимодействия для adminpage.xaml
    /// </summary>
    public partial class userpage : Page
    {
        public userpage()
        {
            InitializeComponent();
        }

        private void LoginBtn_Click(object sender, RoutedEventArgs e)
        {
            var currentUser = App.Context.Users.FirstOrDefault(p => p.login == loginBox.Text && p.password == passwordBox.Password);

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
                NavigationService.Navigate(new ServicesPage());
            }
        }
    }
}
