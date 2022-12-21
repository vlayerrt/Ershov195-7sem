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
using TourAgencyErshov.model;

namespace TourAgencyErshov
{
    /// <summary>
    /// Логика взаимодействия для loginpage.xaml
    /// </summary>
    public partial class loginpage : Page
    {
        Random _random = new Random();

        public loginpage()
        {

            InitializeComponent();
            UpdateCaptcha();
            App.modeldb = new TourAgencyEVEntities();

        }
        string symbol = "";
        public string Symbols;
        private void UpdateCaptcha()
        {
            SPanelSymbols.Children.Clear();
            CanvasNoise.Children.Clear();

            symbol = "";
            GenerateSymbols(3);
        }
        private void GenerateSymbols(int count)
        {
            string alphabet = "WERPASFHKXVBM234578";
            for (int i = 0; i < count; i++)
            {
                string symbols = alphabet.ElementAt(_random.Next(0, alphabet.Length)).ToString();
                TextBlock lbl = new TextBlock();

                lbl.Text = symbols;
                lbl.FontSize = _random.Next(15, 35);
                lbl.RenderTransform = new RotateTransform(_random.Next(-45, 45));
                lbl.Margin = new Thickness(-2, 0, -2, 0);


                symbol = symbol + symbols;

                SPanelSymbols.Children.Add(lbl);
            }
        }
        /*private void GenerateNoise(int volumeNoise)
        {
            for (int i = 0; i < volumeNoise; i++)
            {
                Border border = new Border();
                border.Background = new SolidColorBrush(Color.FromArgb((byte)_random.Next(100, 200),
                                                                       (byte)_random.Next(0, 256),
                                                                       (byte)_random.Next(0, 256),
                                                                       (byte)_random.Next(0, 256)));
                border.Height = _random.Next(2, 10);
                border.Width = _random.Next(10, 40);



                border.RenderTransform = new RotateTransform(_random.Next(-20, 20));

                CanvasNoise.Children.Add(border);
                Canvas.SetLeft(border, _random.Next(20, 100));
                Canvas.SetTop(border, _random.Next(20, 40));

                Ellipse ellipse = new Ellipse();
                ellipse.Fill = new SolidColorBrush(Color.FromArgb((byte)_random.Next(100, 200),
                                                                       (byte)_random.Next(0, 256),
                                                                       (byte)_random.Next(0, 256),
                                                                       (byte)_random.Next(0, 256)));
                ellipse.Height = ellipse.Width = _random.Next(15, 30);



                CanvasNoise.Children.Add(ellipse);
                Canvas.SetLeft(ellipse, _random.Next(10, 100));
                Canvas.SetTop(ellipse, _random.Next(10, 26));
            }
        }*/
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
        private void BtnUpdateCaptcha_Click(object sender, RoutedEventArgs e)
        {
            UpdateCaptcha();
        }

        private void LoginBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var currentUser = App.Context.Users.FirstOrDefault(p => p.login == loginBox.Text && p.password == passBox.Password);
                Console.WriteLine(loginBox.Text);

                if (currentUser == null) 
                {
                    MessageBox.Show("Пользователь не найден", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);

                }
                else
                {
                    if (GetCaptcha.Text == symbol)
                    {
                        MessageBox.Show("Здравствуйте " + currentUser.Role.RoleName + ", " + currentUser.login, "Уведомление",
                            MessageBoxButton.OK, MessageBoxImage.Information);
                        switch (currentUser.RoleID)
                        {
                            case 1:
                                NavigationService.Navigate(new adminpage());
                                break;
                            case 2:
                                NavigationService.Navigate(new userpage());
                                break;
                            default:
                                MessageBox.Show("Неверные данные", "Уведомление",
                                    MessageBoxButton.OK, MessageBoxImage.Warning);
                                break;
                        }
                    }
                    else {
                        MessageBox.Show("Неверная капча", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        UpdateCaptcha();
                    };
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message.ToString(), "Критическая работа приложения",
                    MessageBoxButton.OK, MessageBoxImage.Warning);
            }

        }
        /*private void CheckAttemps()
        {
            if (att == 2)
            {
                Console.WriteLine(TBCaptcha.Text);
                Capcha.Visibility = Visibility.Visible;
                CapchaBox.Visibility = Visibility.Visible;
                LoginBtn.Visibility = Visibility.Hidden;


                if (TBCaptcha.Text == symbol)
                {
                    LoginBtn.Visibility = Visibility.Visible;
                }
                else
                {
                    CapchaLogin.Visibility = Visibility.Visible;
                }
            }
            if (att == 3)
            {
                NavigationService.Navigate(new loginpage());
            }*/

        }
       /* private void Check_Capcha(object sender, RoutedEventArgs e)
        {
            CheckAttemps();
        }*/
    }

