using System;
using System.Collections.Generic;

namespace PmbokMobileWebApp.Models
{
    public partial class ProcessInputs
    {
        public string Id { get; set; }
        public byte[] Version { get; set; }
        public DateTimeOffset CreatedAt { get; set; }
        public DateTimeOffset? UpdatedAt { get; set; }
        public bool Deleted { get; set; }
        public string PmbokVersionId { get; set; }
        public string Itoid { get; set; }
        public string ProcessCatalogId { get; set; }
        public int? InputSequence { get; set; }
        public string ProcessInputDescription { get; set; }
        public string ProcessInputText { get; set; }
        public string Itotext { get; set; }
    }
}
