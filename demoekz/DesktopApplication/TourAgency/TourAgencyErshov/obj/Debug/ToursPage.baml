   M S B A M L   `   `   `  ????K  GTourAgencyErshov, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:TourAgencyErshovTourAgencyErshov  5           TourAgencyErshov.ToursPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      0localclr-namespace:TourAgencyErshov     5        N? Title$  	ToursPage??5	      .??5      ?  ? RowDefinitions 5   
   ?? 5      $
??auto ?6   ?? 5      $??* ?6   .+?5   
   ?  ? Orientation$ 
Horizontal=?6   $??Center=?6-   .+?5      ??  ?? Orientation$ 
Horizontal=?6   .+?5      ?? $#??Введите запрос: ??6   $	??175??64    ?? TextAlignment$ Right=?6@   6X   ?? 5      -   5        $??
TBoxSearch??5   &   $	??225??6   6_   5      ?? 5      $ 
Horizontal=?6   .+?5      ?? $??Выберите тип: ??6   $	??175??62   $ Right=?6>   6V   ?? 5      -   5        $??	ComboType??5   '   $	??225??6    ?? DisplayMemberPath$ TourTypeName??5      5      5      ?? 5      -   5         ??Name$ CheckActual??5      $C??=Показать только актуальные туры: ??6,   $??Center=?6X   6?   5      ?? 5    
   -   5        $??LVTours??5        $??1??6   $??Disabled=?6/   $??Center=?5!      ??5"      ?? 5#      .R?5$      ? $ 
Horizontal=?6    $??Center=?69   5%   #   5&      ??5(      ?? 5)      .R?5*      ? $??20q?6   $	??400??6'    5+      ?? 5,      $??70 ?6,   6:   ?? 5-      $	??310 ?6,   6;   ?? 5.      $
??auto ?6,   6<   ?? 5/      $
??auto ?6,   6<   .+?51      ?? $	??400??6    $??1??6,   $??UniformToFill=?69   $??Center=?6Q   $??5q?6n   ??52      ?? 53   "    ?? Path$ ImagePreview?6*    ?? TargetNullValue 54   &   ??55   *   Resources/picture.png??6M   57   #   59      ?? 5:      $??Center=?6>   $ Center=?6Y   $	??390??6p   $
??Wrap=?6|   $??Center=?5;   $   $	??5 5q?6A   $??17(?6N   $??0??6\   ??5:   $   ?? *
TourName+5;   \   ?? 5<      $??2??6U   $??5 5 5 15q?6b   $??Center=?6t   $??26(?6?   $
??Bold"?6?   ??6$   ?? *Cost+	 ?? StringFormat$	 {0:N2} РУБ??6?   ?? 5=      $??3??6h   $??14(?6u   $??Right=?6?   ??6$   ?? *TicketsCount+$*	 $Билетов осталось: {0}??6?   ?? 5>      $??3??6@   $??14(?6M   $
??Left=?6[   ??6$   ?? *
ActualText+6[   5?      5@      5B      5D      5F      