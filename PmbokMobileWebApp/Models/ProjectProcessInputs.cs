using System;
using System.Collections.Generic;

namespace PmbokMobileWebApp.Models
{
    public partial class ProjectProcessInputs
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
        public string ProcessCatalogId { get; set; }
        public string ProcessText { get; set; }
        public decimal? ProcessNumber { get; set; }
        public string Itoid { get; set; }
        public string Itotext { get; set; }
        public int? InputSequence { get; set; }
        public string Status { get; set; }
        public DateTime? StatusDate { get; set; }
        public bool? IsUsed { get; set; }
    }
}
