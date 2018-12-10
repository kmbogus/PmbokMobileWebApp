using System;
using System.Collections.Generic;

namespace PmbokMobileWebApp.Models
{
    public partial class ProjectKnowledgeAreas
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
        public string KnowledgeAreaId { get; set; }
        public string KnowledgeAreaText { get; set; }
    }
}
