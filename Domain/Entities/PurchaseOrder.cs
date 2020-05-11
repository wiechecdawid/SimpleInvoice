using System;

namespace Domain.Entities
{
    public class PurchaseOrder
    {
        public int Id { get; set; }
        public int ContractId { get; set; }
        public Contract Contract { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime DeliveryDate { get; set; }
        public decimal PoValue { get; set; }
        public decimal Vat { get; set; }
    }
}
