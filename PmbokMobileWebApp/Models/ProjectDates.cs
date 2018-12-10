using System;
using System.Collections.Generic;

namespace PmbokMobileWebApp.Models
{
    public partial class ProjectDates
    {
        public string Id { get; set; }
        public byte[] Version { get; set; }
        public DateTimeOffset CreatedAt { get; set; }
        public DateTimeOffset? UpdatedAt { get; set; }
        public bool Deleted { get; set; }
        public string ProjectId { get; set; }
        public string ProjectName { get; set; }
        public string DateType { get; set; }
        public string OtherDateType { get; set; }
        public DateTime? RecordedDate { get; set; }
        public string DateNote { get; set; }
    }
}
