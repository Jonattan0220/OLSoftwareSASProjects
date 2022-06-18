using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace OLSoftwareSASProjects.Models
{
    public partial class ProgrammingLanguage
    {
        public ProgrammingLanguage()
        {
            ProjectLanguages = new HashSet<ProjectLanguage>();
        }

        public int ProgrammingLanguageId { get; set; }
        [Display(Name = "Lenguaje de programación")]
        public string ProgrammingLanguage1 { get; set; } = null!;
        public int ProgrammingLanguageLevelId { get; set; }

        public virtual ProgrammingLanguageLevel ProgrammingLanguageLevel { get; set; } = null!;
        public virtual ICollection<ProjectLanguage> ProjectLanguages { get; set; }
    }
}
