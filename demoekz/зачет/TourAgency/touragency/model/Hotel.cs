//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TourAgencyErshov.model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Hotel
    {
        public int HotelID { get; set; }
        public string HotelName { get; set; }
        public Nullable<int> Stars { get; set; }
        public string CountryName { get; set; }
        public string CountryCode { get; set; }
    
        public virtual Country Country { get; set; }
    }
}
