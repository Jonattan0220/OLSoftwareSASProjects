using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace OLSoftwareSASProjects.Models
{
    public partial class IdentificationType
    {
        public IdentificationType()
        {
            Clients = new HashSet<Client>();
        }

        public int IdentificationTypeId { get; set; }
        [Display(Name = "Tipo de identificación")]
        public string Type { get; set; } = null!;

        public virtual ICollection<Client> Clients { get; set; }
    }
}
