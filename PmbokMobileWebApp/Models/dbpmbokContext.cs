using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace PmbokMobileWebApp.Models
{
    public partial class dbpmbokContext : DbContext
    {
        public dbpmbokContext()
        {
        }

        public dbpmbokContext(DbContextOptions<dbpmbokContext> options)
            : base(options)
        {
        }

        public virtual DbSet<InputTopics> InputTopics { get; set; }
        public virtual DbSet<Itoes> Itoes { get; set; }
        public virtual DbSet<KnowledgeAreas> KnowledgeAreas { get; set; }
        public virtual DbSet<Notes> Notes { get; set; }
        public virtual DbSet<OutputTopics> OutputTopics { get; set; }
        public virtual DbSet<PmbokVersions> PmbokVersions { get; set; }
        public virtual DbSet<ProcessCatalogs> ProcessCatalogs { get; set; }
        public virtual DbSet<ProcessGroups> ProcessGroups { get; set; }
        public virtual DbSet<ProcessInputs> ProcessInputs { get; set; }
        public virtual DbSet<ProcessInputTopics> ProcessInputTopics { get; set; }
        public virtual DbSet<ProcessLists> ProcessLists { get; set; }
        public virtual DbSet<ProcessOutputs> ProcessOutputs { get; set; }
        public virtual DbSet<ProcessOutputTopics> ProcessOutputTopics { get; set; }
        public virtual DbSet<ProcessTools> ProcessTools { get; set; }
        public virtual DbSet<ProcessToolTopics> ProcessToolTopics { get; set; }
        public virtual DbSet<ProjectDates> ProjectDates { get; set; }
        public virtual DbSet<ProjectKnowledgeAreas> ProjectKnowledgeAreas { get; set; }
        public virtual DbSet<ProjectMembers> ProjectMembers { get; set; }
        public virtual DbSet<ProjectProcessCatalogs> ProjectProcessCatalogs { get; set; }
        public virtual DbSet<ProjectProcessGroups> ProjectProcessGroups { get; set; }
        public virtual DbSet<ProjectProcessInputs> ProjectProcessInputs { get; set; }
        public virtual DbSet<ProjectProcessOutputs> ProjectProcessOutputs { get; set; }
        public virtual DbSet<ProjectProcessTools> ProjectProcessTools { get; set; }
        public virtual DbSet<Projects> Projects { get; set; }
        public virtual DbSet<TodoItems> TodoItems { get; set; }
        public virtual DbSet<ToolTechniqueTopics> ToolTechniqueTopics { get; set; }
        public virtual DbSet<Topics> Topics { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=(localdb)\\mssqllocaldb;Database=dbpmbok;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<InputTopics>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.ProcessInputId).HasMaxLength(128);

                entity.Property(e => e.TopicId).HasMaxLength(128);

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<Itoes>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.ToTable("ITOes");

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.Itodescription).HasColumnName("ITODescription");

                entity.Property(e => e.Itoid).HasColumnName("ITOId");

                entity.Property(e => e.Itotext).HasColumnName("ITOText");

                entity.Property(e => e.PmbokVersionId).HasMaxLength(128);

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<KnowledgeAreas>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.PmbokVersionId).HasMaxLength(128);

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<Notes>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.PmbokVersionId).HasMaxLength(128);

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<OutputTopics>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.ProcessOutputId).HasMaxLength(128);

                entity.Property(e => e.TopicId).HasMaxLength(128);

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<PmbokVersions>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<ProcessCatalogs>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.KnowledgeAreaId).HasMaxLength(128);

                entity.Property(e => e.KnowledgeAreaText).HasMaxLength(128);

                entity.Property(e => e.PmbokVersionId).HasMaxLength(128);

                entity.Property(e => e.ProcessGroupId).HasMaxLength(128);

                entity.Property(e => e.ProcessGroupText).HasMaxLength(128);

                entity.Property(e => e.ProcessNumber).HasColumnType("decimal(3, 1)");

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<ProcessGroups>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.PmbokVersionId).HasMaxLength(128);

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<ProcessInputs>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.Itoid)
                    .HasColumnName("ITOId")
                    .HasMaxLength(128);

                entity.Property(e => e.Itotext)
                    .HasColumnName("ITOText")
                    .HasMaxLength(128);

                entity.Property(e => e.PmbokVersionId).HasMaxLength(128);

                entity.Property(e => e.ProcessCatalogId).HasMaxLength(128);

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<ProcessInputTopics>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.PmbokVersionId).HasMaxLength(128);

                entity.Property(e => e.ProcessInputId).HasMaxLength(128);

                entity.Property(e => e.TopicId).HasMaxLength(128);

                entity.Property(e => e.TopicText).HasMaxLength(128);

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<ProcessLists>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.KnowledgeAreaId).HasMaxLength(128);

                entity.Property(e => e.PmbokVersionId).HasMaxLength(128);

                entity.Property(e => e.ProcessGroupId).HasMaxLength(128);

                entity.Property(e => e.ProcessNumber).HasColumnType("decimal(2, 1)");

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<ProcessOutputs>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.Itoid)
                    .HasColumnName("ITOId")
                    .HasMaxLength(128);

                entity.Property(e => e.Itotext)
                    .HasColumnName("ITOText")
                    .HasMaxLength(128);

                entity.Property(e => e.PmbokVersionId).HasMaxLength(128);

                entity.Property(e => e.ProcessCatalogId).HasMaxLength(128);

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<ProcessOutputTopics>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.PmbokVersionId).HasMaxLength(128);

                entity.Property(e => e.ProcessOutputId).HasMaxLength(128);

                entity.Property(e => e.TopicId).HasMaxLength(128);

                entity.Property(e => e.TopicText).HasMaxLength(128);

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<ProcessTools>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.Itoid)
                    .HasColumnName("ITOId")
                    .HasMaxLength(128);

                entity.Property(e => e.Itotext)
                    .HasColumnName("ITOText")
                    .HasMaxLength(128);

                entity.Property(e => e.PmbokVersionId).HasMaxLength(128);

                entity.Property(e => e.ProcessCatalogId).HasMaxLength(128);

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<ProcessToolTopics>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.PmbokVersionId).HasMaxLength(128);

                entity.Property(e => e.ProcessToolId).HasMaxLength(128);

                entity.Property(e => e.TopicId).HasMaxLength(128);

                entity.Property(e => e.TopicText).HasMaxLength(128);

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<ProjectDates>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.DateType).HasMaxLength(128);

                entity.Property(e => e.OtherDateType).HasMaxLength(128);

                entity.Property(e => e.ProjectId).HasMaxLength(128);

                entity.Property(e => e.ProjectName).HasMaxLength(128);

                entity.Property(e => e.RecordedDate).HasColumnType("datetime");

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<ProjectKnowledgeAreas>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.KnowledgeAreaId).HasMaxLength(128);

                entity.Property(e => e.KnowledgeAreaText).HasMaxLength(128);

                entity.Property(e => e.PmbokVersionId).HasMaxLength(128);

                entity.Property(e => e.PmbokVersionText).HasMaxLength(128);

                entity.Property(e => e.ProjectId).HasMaxLength(128);

                entity.Property(e => e.ProjectName).HasMaxLength(128);

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<ProjectMembers>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.Email).HasMaxLength(128);

                entity.Property(e => e.FirstName).HasMaxLength(128);

                entity.Property(e => e.LastName).HasMaxLength(128);

                entity.Property(e => e.Mobile).HasMaxLength(128);

                entity.Property(e => e.Phone).HasMaxLength(128);

                entity.Property(e => e.ProjectId).HasMaxLength(128);

                entity.Property(e => e.ProjectName).HasMaxLength(128);

                entity.Property(e => e.Role).HasMaxLength(128);

                entity.Property(e => e.Title).HasMaxLength(128);

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<ProjectProcessCatalogs>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.KnowledgeAreaId).HasMaxLength(128);

                entity.Property(e => e.KnowledgeAreaText).HasMaxLength(128);

                entity.Property(e => e.PmbokVersionId).HasMaxLength(128);

                entity.Property(e => e.PmbokVersionText).HasMaxLength(128);

                entity.Property(e => e.ProcessCatalogId).HasMaxLength(128);

                entity.Property(e => e.ProcessGroupId).HasMaxLength(128);

                entity.Property(e => e.ProcessGroupText).HasMaxLength(128);

                entity.Property(e => e.ProcessNumber).HasColumnType("decimal(3, 1)");

                entity.Property(e => e.ProcessText).HasMaxLength(128);

                entity.Property(e => e.ProjectId).HasMaxLength(128);

                entity.Property(e => e.ProjectName).HasMaxLength(128);

                entity.Property(e => e.Status).HasMaxLength(128);

                entity.Property(e => e.StatusDate).HasColumnType("datetime");

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<ProjectProcessGroups>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.PmbokVersionId).HasMaxLength(128);

                entity.Property(e => e.PmbokVersionText).HasMaxLength(128);

                entity.Property(e => e.ProcessGroupId).HasMaxLength(128);

                entity.Property(e => e.ProcessGroupText).HasMaxLength(128);

                entity.Property(e => e.ProjectId).HasMaxLength(128);

                entity.Property(e => e.ProjectName).HasMaxLength(128);

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<ProjectProcessInputs>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.Itoid)
                    .HasColumnName("ITOId")
                    .HasMaxLength(128);

                entity.Property(e => e.Itotext)
                    .HasColumnName("ITOText")
                    .HasMaxLength(128);

                entity.Property(e => e.PmbokVersionId).HasMaxLength(128);

                entity.Property(e => e.PmbokVersionText).HasMaxLength(128);

                entity.Property(e => e.ProcessCatalogId).HasMaxLength(128);

                entity.Property(e => e.ProcessNumber).HasColumnType("decimal(4, 2)");

                entity.Property(e => e.ProcessText).HasMaxLength(128);

                entity.Property(e => e.ProjectId).HasMaxLength(128);

                entity.Property(e => e.ProjectName).HasMaxLength(128);

                entity.Property(e => e.Status).HasMaxLength(128);

                entity.Property(e => e.StatusDate).HasColumnType("datetime");

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<ProjectProcessOutputs>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.Itoid)
                    .HasColumnName("ITOId")
                    .HasMaxLength(128);

                entity.Property(e => e.Itotext)
                    .HasColumnName("ITOText")
                    .HasMaxLength(128);

                entity.Property(e => e.PmbokVersionId).HasMaxLength(128);

                entity.Property(e => e.PmbokVersionText).HasMaxLength(128);

                entity.Property(e => e.ProcessCatalogId).HasMaxLength(128);

                entity.Property(e => e.ProcessNumber).HasColumnType("decimal(4, 2)");

                entity.Property(e => e.ProcessText).HasMaxLength(128);

                entity.Property(e => e.ProjectId).HasMaxLength(128);

                entity.Property(e => e.ProjectName).HasMaxLength(128);

                entity.Property(e => e.Status).HasMaxLength(128);

                entity.Property(e => e.StatusDate).HasColumnType("datetime");

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<ProjectProcessTools>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.Itoid)
                    .HasColumnName("ITOId")
                    .HasMaxLength(128);

                entity.Property(e => e.Itotext)
                    .HasColumnName("ITOText")
                    .HasMaxLength(128);

                entity.Property(e => e.PmbokVersionId).HasMaxLength(128);

                entity.Property(e => e.PmbokVersionText).HasMaxLength(128);

                entity.Property(e => e.ProcessCatalogId).HasMaxLength(128);

                entity.Property(e => e.ProcessNumber).HasColumnType("decimal(4, 2)");

                entity.Property(e => e.ProcessText).HasMaxLength(128);

                entity.Property(e => e.ProjectId).HasMaxLength(128);

                entity.Property(e => e.ProjectName).HasMaxLength(128);

                entity.Property(e => e.Status).HasMaxLength(128);

                entity.Property(e => e.StatusDate).HasColumnType("datetime");

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<Projects>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.EndDate).HasColumnType("datetime");

                entity.Property(e => e.Manager).HasMaxLength(128);

                entity.Property(e => e.PmbokVersionId).HasMaxLength(128);

                entity.Property(e => e.PmbokVersionText).HasMaxLength(128);

                entity.Property(e => e.ProgramId).HasMaxLength(128);

                entity.Property(e => e.ProgramName).HasMaxLength(128);

                entity.Property(e => e.ProjectId).HasMaxLength(128);

                entity.Property(e => e.ProjectName).HasMaxLength(128);

                entity.Property(e => e.Sponsor).HasMaxLength(128);

                entity.Property(e => e.StartDate).HasColumnType("datetime");

                entity.Property(e => e.Status).HasMaxLength(128);

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<TodoItems>(entity =>
            {
                //entity.HasKey(e => e.Id)
                //    .ForSqlServerIsClustered(false);

                //entity.HasIndex(e => e.CreatedAt)
                //    .HasName("IX_CreatedAt")
                //    .ForSqlServerIsClustered();

                //entity.Property(e => e.Id)
                //    .HasMaxLength(128)
                //    .ValueGeneratedNever();

                entity.Property(e => e.AssignedTo).HasMaxLength(128);

                //entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.DueDate).HasColumnType("datetime");

                entity.Property(e => e.UserId).HasMaxLength(128);

                //entity.Property(e => e.Version)
                //    .IsRequired()
                //    .IsRowVersion();
            });

            modelBuilder.Entity<ToolTechniqueTopics>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.ProcessToolTechniqueId).HasMaxLength(128);

                entity.Property(e => e.TopicId).HasMaxLength(128);

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });

            modelBuilder.Entity<Topics>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .ForSqlServerIsClustered(false);

                entity.HasIndex(e => e.CreatedAt)
                    .HasName("IX_CreatedAt")
                    .ForSqlServerIsClustered();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");

                entity.Property(e => e.PmbokVersionId).HasMaxLength(128);

                entity.Property(e => e.Version)
                    .IsRequired()
                    .IsRowVersion();
            });
        }
    }
}
