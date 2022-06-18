using System.ComponentModel.DataAnnotations;

namespace OLSoftwareSASProjects.Models.ViewModels
{
    public class ProjectViewModel
    {
        [Key]
        public int ProjectId { get; set; }
        [Display(Name = "Fecha de inicio")]
        [DataType(DataType.Date)]
        public DateTime StartDate { get; set; }
        [Display(Name = "Fecha final")]
        [DataType(DataType.Date)]
        public DateTime EndDate { get; set; }
        [Display(Name = "Precio (en pesos colombianos)")]
        public long Price { get; set; }
        [Display(Name = "Cantidad de horas")]
        public int NumberOfHours { get; set; }
        [Display(Name = "Cliente")]
        public int ClientId { get; set; }
        [Display(Name = "Estado del proyecto")]
        public int ProjectStateId { get; set; }
        [Display(Name = "Fecha hora de registro")]
        public DateTime CreationDate { get; set; }
        [Display(Name = "Fecha hora de modificación")]
        public DateTime ModificationDate { get; set; }
        [Display(Name = "Número de identificación del cliente")]
        public long IdentificationNumber { get; set; }
        [Display(Name = "Primer nombre del cliente")]
        public string FirstName { get; set; } = null!;
        [Display(Name = "Primer apellido del cliente")]
        public string LastName { get; set; } = null!;
        [Display(Name = "Estado del proyecto")]
        public string State { get; set; } = null!;
    }
}
