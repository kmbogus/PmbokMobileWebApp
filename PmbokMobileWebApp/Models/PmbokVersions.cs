using System;
using System.Collections.Generic;

namespace PmbokMobileWebApp.Models
{
    public partial class PmbokVersions
    {
        public string Id { get; set; }
        public byte[] Version { get; set; }
        public DateTimeOffset CreatedAt { get; set; }
        public DateTimeOffset? UpdatedAt { get; set; }
        public bool Deleted { get; set; }
        public int? PmbokVersionNumber { get; set; }
        public string PmbokVersionText { get; set; }
        public string PmbokVersionDescription { get; set; }
    }
}
