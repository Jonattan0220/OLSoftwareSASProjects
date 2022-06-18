using System.ComponentModel.DataAnnotations;

namespace OLSoftwareSASProjects.Models.ViewModels
{
    public class ProjectLanguageViewModel
    {
        [Key]
        public int ProjectLanguageId { get; set; }
        public int ProjectId { get; set; }
        public int ProgrammingLanguageId { get; set; }
        [Display(Name = "Lenguaje de programación")]
        public string ProgrammingLanguage { get; set; } = null!;
        [Display(Name = "Nivel del lenguaje de programación")]
        public string LevelDescription { get; set; } = null!;
    }
}
