using System;

namespace Domain.Entities
{
    public class CreditNote
    {
        public int Id { get; set; }
        public int InvoiceId { get; set; }
        public virtual Invoice Invoice { get; set; }
        public DateTime CreditDate { get; set; }
        public decimal CreditValue { get; set; }
        public decimal Vat { get; set; }
    }
}
