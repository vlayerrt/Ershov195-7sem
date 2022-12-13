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
using System.Windows.Threading;
using TourAgencyErshov.model;

namespace TourAgencyErshov
{
    /// <summary>
    /// Логика взаимодействия для adminpage.xaml
    /// </summary>
    public partial class adminpage : Page
    {

        DispatcherTimer timer = new DispatcherTimer();
        DateTime date = new DateTime(0, 0);



        public adminpage()
        {
            InitializeComponent();
            App.modeldb = new TourAgencyEVEntities();


            UserTB.Text = TourAgencyEVEntities.CurrentUser.Staff.Name;
            


            //RoleTB.Text = "(" + App.Staffss.Role.RoleName + ")";

          /*  var fullFilePath = App.modeldb.CurentStaff.Photo;

            BitmapImage bitmap = new BitmapImage();
            bitmap.BeginInit();
            bitmap.UriSource = new Uri(fullFilePath, UriKind.Relative);
            bitmap.EndInit();

            UserPhoto.Source = bitmap;
*/
            timer.Interval = TimeSpan.FromSeconds(1);
            timer.Tick += timerTick;
            timer.Start();
        }
        private void timerTick(object sender, EventArgs e)
        {
            date = date.AddSeconds(1);
            lblTimer.Content = date.ToString("HH:mm:ss");
            if (lblTimer.Content == "00:00:05")
            {
                MessageBox.Show("Время сеанса подходит к концу!", "Внимание", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            if (lblTimer.Content == "00:00:10")
            {
                timer.Stop();
            }
        }
    }
}
