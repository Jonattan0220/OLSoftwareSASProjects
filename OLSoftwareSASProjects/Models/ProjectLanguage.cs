using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;

namespace OLSoftwareSASProjects.Models
{
    public partial class ProjectLanguage
    {
        public int ProjectLanguageId { get; set; }
        public int ProjectId { get; set; }
        public int ProgrammingLanguageId { get; set; }
        [ValidateNever]
        public virtual ProgrammingLanguage ProgrammingLanguage { get; set; } = null!;
        [ValidateNever]
        public virtual Project Project { get; set; } = null!;
    }
}
