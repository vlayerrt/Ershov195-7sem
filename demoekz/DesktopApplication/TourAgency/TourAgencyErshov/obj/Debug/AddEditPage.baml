   M S B A M L   `   `   `  ????K  GTourAgencyErshov, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:TourAgencyErshovTourAgencyErshov  5      "    TourAgencyErshov.AddEditPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      0localclr-namespace:TourAgencyErshov     5        N? Title$  AddEditPage??5	      .??5      ?  ? ColumnDefinitions 5   
   ?? 5      $	??200 ?6   ?? 5      $??* ?6    ? RowDefinitions 5   
   ?? 5      $??* ?6   ?? 5      $??* ?6   ?? 5      $??* ?6   ?? 5      $??* ?6   .+?5   
   ?? $??Название??6   ?? 5   
   $??Рейтинг??6   $??1??6#   ?? 5   
   $??Страна??6   $??2??6"   ?? 5   
   $??1??6-    ?? 	MaxLength$	 100??6=   ??6   ?? *	HotelName+6=   ?? 5   
   $??1??6)   $??1??69   $	??175??6F   $
??Left=?6R   ??6   ?? *Stars+6R   ?? 5   
   -   5         ??Name$ ComboCountries??5   Q   $??2??64   $??1??6A    ?? DisplayMemberPath$ CountryName??6i    ?? SelectedItem 6   ?? *	Country+5      ?? 5   
   -   5        $??BtnSave??5   F   $??Сохранить??6   $??2??6%   $??3??69   $??30??6k   $	??250??6w   6?   5!      5"      