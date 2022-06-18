using System;
using System.Collections.Generic;

namespace OLSoftwareSASProjects.Models
{
    public partial class ProjectState
    {
        public ProjectState()
        {
            Projects = new HashSet<Project>();
        }

        public int ProjectStateId { get; set; }
        public string State { get; set; } = null!;

        public virtual ICollection<Project> Projects { get; set; }
    }
}
