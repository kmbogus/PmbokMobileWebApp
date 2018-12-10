using System;
using System.Collections.Generic;

namespace PmbokMobileWebApp.Models
{
    public partial class Itoes
    {
        public string Id { get; set; }
        public byte[] Version { get; set; }
        public DateTimeOffset CreatedAt { get; set; }
        public DateTimeOffset? UpdatedAt { get; set; }
        public bool Deleted { get; set; }
        public int? Itoid { get; set; }
        public string Itotext { get; set; }
        public string Itodescription { get; set; }
        public string PmbokVersionId { get; set; }
    }
}
