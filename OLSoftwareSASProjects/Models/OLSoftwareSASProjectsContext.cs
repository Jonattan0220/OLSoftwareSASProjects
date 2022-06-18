using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using OLSoftwareSASProjects.Models.ViewModels;

namespace OLSoftwareSASProjects.Models
{
    public partial class OLSoftwareSASProjectsContext : DbContext
    {
        public OLSoftwareSASProjectsContext()
        {
        }

        public OLSoftwareSASProjectsContext(DbContextOptions<OLSoftwareSASProjectsContext> options)
            : base(options)
        {
        }
        public virtual DbSet<Client> Clients { get; set; } = null!;
        public virtual DbSet<ClientViewModel> ClientsViewModel { get; set; } = null!;
        public virtual DbSet<IdentificationType> IdentificationTypes { get; set; } = null!;
        public virtual DbSet<ProgrammingLanguage> ProgrammingLanguages { get; set; } = null!;
        public virtual DbSet<ProgrammingLanguageLevel> ProgrammingLanguageLevels { get; set; } = null!;
        public virtual DbSet<Project> Projects { get; set; } = null!;
        public virtual DbSet<ProjectLanguage> ProjectLanguages { get; set; } = null!;
        public virtual DbSet<ProjectLanguageViewModel> ProjectLanguagesViewModel { get; set; } = null!;
        public virtual DbSet<ProjectState> ProjectStates { get; set; } = null!;
        public virtual DbSet<ProjectViewModel> ProjectsViewModel { get; set; } = null!;

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Client>(entity =>
            {
                entity.ToTable("Client");

                entity.Property(e => e.Address)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.CreationDate).HasColumnType("datetime");

                entity.Property(e => e.FirstName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.LastName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ModificationDate).HasColumnType("datetime");

                entity.Property(e => e.PhoneNumber)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.IdentificationType)
                    .WithMany(p => p.Clients)
                    .HasForeignKey(d => d.IdentificationTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Client_IdentificationType");
            });

            modelBuilder.Entity<IdentificationType>(entity =>
            {
                entity.ToTable("IdentificationType");

                entity.Property(e => e.Type)
                    .HasMaxLength(10)
                    .IsFixedLength();
            });

            modelBuilder.Entity<ProgrammingLanguage>(entity =>
            {
                entity.ToTable("ProgrammingLanguage");

                entity.Property(e => e.ProgrammingLanguage1)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("ProgrammingLanguage");

                entity.HasOne(d => d.ProgrammingLanguageLevel)
                    .WithMany(p => p.ProgrammingLanguages)
                    .HasForeignKey(d => d.ProgrammingLanguageLevelId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProgrammingLanguage_ProgrammingLanguageLevel");
            });

            modelBuilder.Entity<ProgrammingLanguageLevel>(entity =>
            {
                entity.ToTable("ProgrammingLanguageLevel");

                entity.Property(e => e.LevelDescription)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Project>(entity =>
            {
                entity.ToTable("Project");

                entity.Property(e => e.CreationDate).HasColumnType("datetime");

                entity.Property(e => e.EndDate).HasColumnType("date");

                entity.Property(e => e.ModificationDate).HasColumnType("datetime");

                entity.Property(e => e.StartDate).HasColumnType("date");

                entity.HasOne(d => d.Client)
                    .WithMany(p => p.Projects)
                    .HasForeignKey(d => d.ClientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Project_Client");

                entity.HasOne(d => d.ProjectState)
                    .WithMany(p => p.Projects)
                    .HasForeignKey(d => d.ProjectStateId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Project_ProjectState");
            });

            modelBuilder.Entity<ProjectLanguage>(entity =>
            {
                entity.ToTable("ProjectLanguage");

                entity.HasOne(d => d.ProgrammingLanguage)
                    .WithMany(p => p.ProjectLanguages)
                    .HasForeignKey(d => d.ProgrammingLanguageId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProjectLanguage_ProgrammingLanguage");

                entity.HasOne(d => d.Project)
                    .WithMany(p => p.ProjectLanguages)
                    .HasForeignKey(d => d.ProjectId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProjectLanguage_Project");
            });

            modelBuilder.Entity<ProjectState>(entity =>
            {
                entity.ToTable("ProjectState");

                entity.Property(e => e.State)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
