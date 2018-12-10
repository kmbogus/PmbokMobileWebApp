using System;
using System.Collections.Generic;

namespace PmbokMobileWebApp.Models
{
    public partial class Notes
    {
        public string Id { get; set; }
        public byte[] Version { get; set; }
        public DateTimeOffset CreatedAt { get; set; }
        public DateTimeOffset? UpdatedAt { get; set; }
        public bool Deleted { get; set; }
        public string NoteDescription { get; set; }
        public string NoteText { get; set; }
        public string PmbokVersionId { get; set; }
    }
}
