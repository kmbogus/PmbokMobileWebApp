using System;
using System.Collections.Generic;

namespace PmbokMobileWebApp.Models
{
    public partial class KnowledgeAreas
    {
        public string Id { get; set; }
        public byte[] Version { get; set; }
        public DateTimeOffset CreatedAt { get; set; }
        public DateTimeOffset? UpdatedAt { get; set; }
        public bool Deleted { get; set; }
        public int? KnowledgeAreaNumber { get; set; }
        public string KnowledgeAreaText { get; set; }
        public string KnowledgeAreaDescription { get; set; }
        public string PmbokVersionId { get; set; }
    }
}
