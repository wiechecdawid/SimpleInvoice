using System;

namespace Domain.Entities
{
    public class Invoice
    {
        public int Id { get; set; }
        public int PurchaseOrderId { get; set; }
        public virtual PurchaseOrder PurchaseOrder { get; set; }
        public DateTime InvoiceDate { get; set; }
        public decimal InvoiceValue { get; set; }
        public decimal Vat { get; set; }
    }
}
