using System;
using System.Collections.Generic;

namespace PmbokMobileWebApp.Models
{
    public partial class ProcessLists
    {
        public string Id { get; set; }
        public byte[] Version { get; set; }
        public DateTimeOffset CreatedAt { get; set; }
        public DateTimeOffset? UpdatedAt { get; set; }
        public bool Deleted { get; set; }
        public decimal? ProcessNumber { get; set; }
        public string ProcessText { get; set; }
        public string ProcessDescription { get; set; }
        public string PmbokVersionId { get; set; }
        public string ProcessGroupId { get; set; }
        public string KnowledgeAreaId { get; set; }
    }
}
