using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace OLSoftwareSASProjects.Models
{
    public partial class Client
    {
        public Client()
        {
            Projects = new HashSet<Project>();
        }

        public int ClientId { get; set; }
        [Display(Name = "Primer nombre")]
        public string FirstName { get; set; } = null!;
        [Display(Name = "Primer apellido")]
        public string LastName { get; set; } = null!;
        [Display(Name = "Número de contacto")]
        public string PhoneNumber { get; set; } = null!;
        [Display(Name = "Dirección")]
        public string Address { get; set; } = null!;
        [Display(Name = "Tipo de identificación")]
        public int IdentificationTypeId { get; set; }
        [Display(Name = "Número de identificación")]
        public long IdentificationNumber { get; set; }
        [Display(Name = "Fecha hora de registro")]
        public DateTime CreationDate { get; set; }
        [Display(Name = "Fecha hora de modificación")]
        public DateTime ModificationDate { get; set; }
        [ValidateNever]
        public virtual IdentificationType IdentificationType { get; set; } = null!;
        public virtual ICollection<Project> Projects { get; set; }
    }
}
