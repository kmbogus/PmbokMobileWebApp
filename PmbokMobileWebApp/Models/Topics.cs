using System;
using System.Collections.Generic;

namespace PmbokMobileWebApp.Models
{
    public partial class Topics
    {
        public string Id { get; set; }
        public byte[] Version { get; set; }
        public DateTimeOffset CreatedAt { get; set; }
        public DateTimeOffset? UpdatedAt { get; set; }
        public bool Deleted { get; set; }
        public string TopicDescription { get; set; }
        public string TopicText { get; set; }
        public string PmbokVersionId { get; set; }
    }
}
