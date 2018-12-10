using System;
using System.Collections.Generic;

namespace PmbokMobileWebApp.Models
{
    public partial class ProjectProcessCatalogs
    {
        public string Id { get; set; }
        public byte[] Version { get; set; }
        public DateTimeOffset CreatedAt { get; set; }
        public DateTimeOffset? UpdatedAt { get; set; }
        public bool Deleted { get; set; }
        public string ProjectId { get; set; }
        public string ProjectName { get; set; }
        public string ProcessCatalogId { get; set; }
        public string ProcessText { get; set; }
        public decimal? ProcessNumber { get; set; }
        public string PmbokVersionId { get; set; }
        public string PmbokVersionText { get; set; }
        public string ProcessGroupId { get; set; }
        public string ProcessGroupText { get; set; }
        public string KnowledgeAreaId { get; set; }
        public string KnowledgeAreaText { get; set; }
        public string Status { get; set; }
        public DateTime? StatusDate { get; set; }
        public bool? IsUsed { get; set; }
    }
}
