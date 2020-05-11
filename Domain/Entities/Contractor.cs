using System;
using System.Collections.Generic;

namespace Domain.Entities
{
    public class Contractor
    {
        public Contractor()
        {
            Suppliers = new HashSet<Contractor>();
            Clients = new HashSet<Contractor>();
        }

        public int Id { get; set; }
        public string ContractorName { get; set; }
        public string Street { get; set; }
        public string Building { get; set; }
        public string City { get; set; }
        public string Post { get; set; }
        public string SortCode { get; set; }
        public string BankAccount { get; set; }
        public string VatNumber { get; set; }

        public virtual ICollection<Contractor> Suppliers { get; set; }
        public virtual ICollection<Contractor> Clients { get; set; }
    }
}
