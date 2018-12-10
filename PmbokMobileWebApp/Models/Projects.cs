using System;
using System.Collections.Generic;

namespace PmbokMobileWebApp.Models
{
    public partial class Projects
    {
        public string Id { get; set; }
        public byte[] Version { get; set; }
        public DateTimeOffset CreatedAt { get; set; }
        public DateTimeOffset? UpdatedAt { get; set; }
        public bool Deleted { get; set; }
        public string ProjectId { get; set; }
        public string ProjectName { get; set; }
        public string Status { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public string FullDescription { get; set; }
        public string Manager { get; set; }
        public string Sponsor { get; set; }
        public string ProgramId { get; set; }
        public string ProgramName { get; set; }
        public string PmbokVersionId { get; set; }
        public string PmbokVersionText { get; set; }
        public decimal? EstimatedBudget { get; set; }
        public decimal? ApprovedBudget { get; set; }
    }
}
