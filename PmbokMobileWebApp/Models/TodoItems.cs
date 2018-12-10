using System;
using System.Collections.Generic;

namespace PmbokMobileWebApp.Models
{
    public partial class TodoItems
    {
        //public string Id { get; set; }
        //public byte[] Version { get; set; }
        //public DateTimeOffset CreatedAt { get; set; }
        //public DateTimeOffset? UpdatedAt { get; set; }
        //public bool Deleted { get; set; }
        public string TodoText { get; set; }
        public bool? Complete { get; set; }
        public DateTime? DueDate { get; set; }
        public string UserId { get; set; }
        public string AssignedTo { get; set; }
    }
}
