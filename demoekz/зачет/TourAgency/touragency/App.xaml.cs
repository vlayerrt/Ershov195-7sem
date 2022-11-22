using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using TourAgencyErshov.model;

namespace TourAgencyErshov
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static TourAgencyEVEntities Context { get; } = new TourAgencyEVEntities();

        public static User CurrentUser = null;
    }
}
