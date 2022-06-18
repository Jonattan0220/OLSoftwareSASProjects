using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace OLSoftwareSASProjects.Models
{
    public partial class Project
    {
        public Project()
        {
            ProjectLanguages = new HashSet<ProjectLanguage>();
        }

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
        [ValidateNever]
        public virtual Client Client { get; set; } = null!;
        [ValidateNever]
        public virtual ProjectState ProjectState { get; set; } = null!;
        public virtual ICollection<ProjectLanguage> ProjectLanguages { get; set; }
    }
}
