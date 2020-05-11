using System;

namespace Domain.Entities
{
    public class Contract
    {
        public int Id { get; set; }
        public int ClientId { get; set; }
        public virtual Client Client { get; set; }
        public int SupplierId { get; set; }
        public virtual Supplier Supplier { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime ExpirationDate { get; set; }
        public PaymentTerms Terms { get; set; }
    }
}
