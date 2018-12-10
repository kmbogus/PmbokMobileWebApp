using System;
using System.Collections.Generic;

namespace PmbokMobileWebApp.Models
{
    public partial class ProjectProcessGroups
    {
        public string Id { get; set; }
        public byte[] Version { get; set; }
        public DateTimeOffset CreatedAt { get; set; }
        public DateTimeOffset? UpdatedAt { get; set; }
        public bool Deleted { get; set; }
        public string ProjectId { get; set; }
        public string ProjectName { get; set; }
        public string PmbokVersionId { get; set; }
        public string PmbokVersionText { get; set; }
        public int? ProcessGroupNumber { get; set; }
        public string ProcessGroupId { get; set; }
        public string ProcessGroupText { get; set; }
    }
}
