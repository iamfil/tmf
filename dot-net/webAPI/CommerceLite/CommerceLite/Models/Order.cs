//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CommerceLite.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order
    {
        public int OrderId { get; set; }
        public int OfferId { get; set; }
        public System.DateTime PurchaseDate { get; set; }
        public int CustomerId { get; set; }
    
        internal virtual Customer Customer { get; set; }
        internal virtual Offer Offer { get; set; }
    }
}