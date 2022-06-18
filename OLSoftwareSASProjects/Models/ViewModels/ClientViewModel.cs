using System.ComponentModel.DataAnnotations;

namespace OLSoftwareSASProjects.Models.ViewModels
{
    public class ClientViewModel
    {
        [Key]
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
        [Display(Name = "Tipo de identificación")]
        public string Type { get; set; } = null!;
    }
}
