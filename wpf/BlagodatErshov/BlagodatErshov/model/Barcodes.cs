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
    
    public partial class Barcodes
    {
        public int Barcode { get; set; }
        public int OrderID { get; set; }
    
        public virtual Orders Orders { get; set; }
    }
}
