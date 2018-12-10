using System;
using System.Collections.Generic;

namespace PmbokMobileWebApp.Models
{
    public partial class OutputTopics
    {
        public string Id { get; set; }
        public byte[] Version { get; set; }
        public DateTimeOffset CreatedAt { get; set; }
        public DateTimeOffset? UpdatedAt { get; set; }
        public bool Deleted { get; set; }
        public string ProcessOutputId { get; set; }
        public string TopicId { get; set; }
        public string TopicNote { get; set; }
    }
}
