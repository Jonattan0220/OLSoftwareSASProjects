using System;
using System.Collections.Generic;

namespace OLSoftwareSASProjects.Models
{
    public partial class ProgrammingLanguageLevel
    {
        public ProgrammingLanguageLevel()
        {
            ProgrammingLanguages = new HashSet<ProgrammingLanguage>();
        }

        public int ProgrammingLanguageLevelId { get; set; }
        public string LevelDescription { get; set; } = null!;

        public virtual ICollection<ProgrammingLanguage> ProgrammingLanguages { get; set; }
    }
}
