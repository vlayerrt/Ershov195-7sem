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


namespace Глазки_SaveErshov
{
    /// <summary>
    /// Логика взаимодействия для Administrator.xaml
    /// </summary>
    public partial class Administrator : Page
    {
        DispatcherTimer timer = new DispatcherTimer();
        DateTime date = new DateTime(0, 0);
        public Administrator()
        {
            InitializeComponent();
            string[] FIO = model.GlazkiSaveEVEntities.currentUser.Name.Split(new char[] { ' ' });
            string surname = FIO[0] + " " + FIO[1];

            UserTB.Text = surname;
            RoleTB.Text = "(" + model.GlazkiSaveEVEntities.currentUser.Role.RoleID + ")";

            Classes.ConnectDB.modeldb = new model.GlazkiSaveEVEntities();
            RoleTB.Text = "(" + model.GlazkiSaveEVEntities.currentUser.Role.RoleName + ")";

            /*  var fullFilePath = App.modeldb.CurentStaff.Photo;

              BitmapImage bitmap = new BitmapImage();
              bitmap.BeginInit();
              bitmap.UriSource = new Uri(fullFilePath, UriKind.Relative);
              bitmap.EndInit();

              UserPhoto.Source = bitmap;
  */
        }
    }
}
