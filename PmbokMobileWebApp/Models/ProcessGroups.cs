using System;
using System.Collections.Generic;

namespace PmbokMobileWebApp.Models
{
    public partial class ProcessGroups
    {
        public string Id { get; set; }
        public byte[] Version { get; set; }
        public DateTimeOffset CreatedAt { get; set; }
        public DateTimeOffset? UpdatedAt { get; set; }
        public bool Deleted { get; set; }
        public int? ProcessGroupNumber { get; set; }
        public string ProcessGroupText { get; set; }
        public string ProcessGroupDescription { get; set; }
        public string PmbokVersionId { get; set; }
    }
}
