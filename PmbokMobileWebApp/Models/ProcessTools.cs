using System;
using System.Collections.Generic;

namespace PmbokMobileWebApp.Models
{
    public partial class ProcessTools
    {
        public string Id { get; set; }
        public byte[] Version { get; set; }
        public DateTimeOffset CreatedAt { get; set; }
        public DateTimeOffset? UpdatedAt { get; set; }
        public bool Deleted { get; set; }
        public string Itoid { get; set; }
        public string ProcessCatalogId { get; set; }
        public string ProcessToolDescription { get; set; }
        public string ProcessToolText { get; set; }
        public int? ProcessToolSequence { get; set; }
        public string PmbokVersionId { get; set; }
        public string Itotext { get; set; }
    }
}
