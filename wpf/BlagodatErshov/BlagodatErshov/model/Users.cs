//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BlagodatErshov.model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Users
    {
        public int UserID { get; set; }
        public string login { get; set; }
        public string password { get; set; }
        public int typeID { get; set; }
    
        public virtual Types Types { get; set; }
    }
}