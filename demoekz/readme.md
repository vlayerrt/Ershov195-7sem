# Лекции
UML - унифицированный язык моделирования.<br>
Диплом структура<br>
теория<br>
 для чего<br>
 движок, по, почему<br>
 
практика<br>
 проектирование UML<br>
 код, описание<br>
 (тестирование)<br>
где выложен продукт, как получить<br>
<br>
UML международный язык рисования схем.<br>
ER = UML<br>
UML прост, позволяет представить продукт<br>
Use Case Diagram<br>
Зачем?<br>
Показывает, кто пользуетя системой - Люди = актеры. Пользователи, администраторы<br>
Действия = прецеденты<br>
![image](https://user-images.githubusercontent.com/39220694/188564290-416fd327-489f-4188-a20b-9d3805217473.png)
![image](https://user-images.githubusercontent.com/39220694/188564397-a07758bc-2e25-4d07-9390-d2df67624214.png)

Use case строится на анализе предметной области<br>

Отношение - линия: сплошная и пунктирная<br>
пунктирные: include - если без него нельзя выполнить основное действие, extend - дополнительное<br>
Сплошная линия - ассоциация=использует - отражает возможность использования актером прецедента<br>
![image](https://user-images.githubusercontent.com/39220694/188565367-7be3b074-368c-4dba-b9a2-d9c13b0f26f4.png)

## ER - диаграммы
ER - entity relationship - сущность и связь <br> 
Концептуальные и физические диаграммы <br>
Концептуальная - visio<br>
Физические - отображаются типы данных, автоматическая, обязательность/необязательность полей, english<br>
*Отдельную таблицу со связью многие-ко-многим не создают<br>
НФ - нормальная форма:<br>
<table>
 <tr>
  <th>Модель</td><td>Марка</th>
 </tr>
  <tr>
     <td>BMW</td>
     <td>M5; M3</td>
  </tr>
  <tr>
     <td>Nissan</td>
     <td>Skyline R32 GT-R</td>
  </tr>
</table>
1НФ - одна ячейка - одно значение
Пример:
<table>
 <tr>
  <th>Модель</td><td>Марка</th>
 </tr>
 <tr>
    <td>BMW</td>
    <td>M5</td>
 </tr>
  <tr>
    <td>BMW</td>
    <td>M3</td>
 </tr>
 <tr>
    <td>Nissan</td>
    <td>Skyline R32 GT-R</td>
 </tr>
</table>

2НФ укорачиваем повротяющиеся элементы<br>
3НФ взаимосвязи столбцов. если не зависят - выносим в разные таблицы<br>
![image](https://user-images.githubusercontent.com/39220694/189847462-101a36f8-33bf-4a1a-8f04-38f7742343b2.png)
![image](https://user-images.githubusercontent.com/39220694/189849436-2a454724-715a-408f-8139-870fb3de6955.png)

![image](https://user-images.githubusercontent.com/39220694/189851195-7b0161c7-1561-4e52-81e1-2710eda1e81a.png)
![image](https://user-images.githubusercontent.com/39220694/189851696-85c2b19c-edc7-4957-83b8-4b4ddfce50a9.png)
![image](https://user-images.githubusercontent.com/39220694/189853031-a441041d-3b02-43c6-b8a4-ca06c028e8a5.png)
отключать если первичные ключи - паспортные данные

#Создание базы данных
Создание скрипта
1. Создать бд
2. пкм - создать запрос
3. вставить скрипт
4. запустить
![image](https://user-images.githubusercontent.com/39220694/189850302-7f019380-faee-487b-9201-85dd527ed30d.png)
![image](https://user-images.githubusercontent.com/39220694/189865658-f46f0b9d-a3ed-45fc-b32d-0a30fd37a0a5.png)

 
# Связи: 
один-ко-многим = внешний ключ. в таблице, в которой слово "один" ставится первичный ключ, ведем связь к столбцу таблицы "много" (В одной **стране** много **отелей**)<br>
многие-ко-многим = отдельная таблица с двумя первичными ключами (несколько книг нравятся нескольким людям)

# Типа данных
числовые int, char, varchar, nvarchar(255), money, varbinary(50)<br>
логические bool<br>
символьные text<br>
дата date datetime<br>

![image](https://user-images.githubusercontent.com/39220694/189868313-2bd24f35-e698-412c-a163-1ef57b39e9b0.png)

# WPF
Один из коспонентов ядра NET Framework - WinForms - UWP
отличаетя от WinForms <br>
Адаптивной версткой <br>
Привязкой данных <br>
стили <br>
Настройка анимаций <br>
Использовать NET Framework<br>
Осовные контейнеры: Grid, StackPanel - расположение в порядке по вертикали и горизонтали, Canvas. WrapPanel - распологает все элементы в одной строке или колонке 
Строка - RowDefenition<br>
Столбец - ColumnDefenition<br>
![image](https://user-images.githubusercontent.com/39220694/191467415-5d7266ee-1d5c-4193-8cdf-6c3321023a03.png)

## Свойства
Парментры элементов, изменающие их внешний вид<br>
Название выравнивание позиционирование отступы<br>

## Шаблоны
![image](https://user-images.githubusercontent.com/39220694/191474579-2fbc348f-8fa6-4c87-a4ef-a3c9c746260a.png)


# Подготовка данных
![image](https://user-images.githubusercontent.com/39220694/195324925-933c83f3-9fe7-4bc7-94b2-95ee77a17f92.png)
ВПР позволяет заменить значения на цифры
Для ВПР номер пишется справа
Делается все в новом файле
![image](https://user-images.githubusercontent.com/39220694/195331560-329011fa-34a1-4655-a3a7-b873bf58e28a.png)


## программные решения для бизнеса esat
https://esat.worldskills.ru/competencies/dac59f20-134b-4aa4-94e5-518c488ccc9e/categories/d747aed4-5204-4ab4-a3f1-dec61f99735d
## подготовка
https://docs.google.com/document/d/17dkgRFIxEAdOvFsUuCD5TGeWHCqcC7U-Ha5MJ0EfdtI/edit#
![image](https://user-images.githubusercontent.com/39220694/188390968-a3e0d586-5bc2-4793-aa07-3dcd178ebf63.png)

![image](https://user-images.githubusercontent.com/39220694/196673439-0fc57c4b-f95e-48ac-a554-c3bb0552039d.png)
![image](https://user-images.githubusercontent.com/39220694/196673984-9b82b695-10ea-48c8-a488-d88fd4c0955c.png)
![image](https://user-images.githubusercontent.com/39220694/196677362-722b8d45-51c0-4df1-b946-c3afc4ad181d.png)
<br>
в команде remote прописать ip адрес вместо localhost
![image](https://user-images.githubusercontent.com/39220694/196677678-ee6ab2d6-0376-4cc0-9c3f-007a657f14e9.png)
# Подключение DB
![image](https://user-images.githubusercontent.com/39220694/196682697-0172dfbe-a8e0-4ec9-a392-26f2d87d769b.png)
![image](https://user-images.githubusercontent.com/39220694/196684087-862ae065-9939-47c9-9795-8bc1342f03a1.png)



```
Модуль 1: Анализ и проектирование требований, бизнеспроцессов - UML-диаграммы
Модуль 2: Проектирование реляционного хранилища данных - ER-модель БД
Модуль 3: Разработка баз данных, объектов баз данных и импорт - Создание таблиц, распределение полей int char. 
Модуль 4: Разработка desktop-приложений - WPF
Модуль 6: Создание инсталляторов - 
Модуль 7: Тестирование программных решений
```
```
Модуль 9: Общий профессионализм решения
  Возможность развития информационной системы другими разработчиками.
  Соответствие руководству по стилю заказчика
  Обратная связь системы с пользователем
  Стабильная работа всех разработанных программ
  Стиль кода на протяжении разработки всей системы
  Организация файловой структуры проекта
  Соблюдение культуры кодирования
  Комментарии к коду
  Умение работать с системой контроля версий.
  Умение работать с readme.md
```
локальный гит http://192.168.1.20:3000/
задания: https://github.com/Julia-Zhirnova/Demoekzamen
