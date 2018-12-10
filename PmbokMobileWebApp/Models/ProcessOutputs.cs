using System;
using System.Collections.Generic;

namespace PmbokMobileWebApp.Models
{
    public partial class ProcessOutputs
    {
        public string Id { get; set; }
        public byte[] Version { get; set; }
        public DateTimeOffset CreatedAt { get; set; }
        public DateTimeOffset? UpdatedAt { get; set; }
        public bool Deleted { get; set; }
        public string Itoid { get; set; }
        public string ProcessCatalogId { get; set; }
        public string ProcessOutputDescription { get; set; }
        public string ProcessOutputText { get; set; }
        public int? ProcessOutputSequence { get; set; }
        public string PmbokVersionId { get; set; }
        public string Itotext { get; set; }
    }
}
