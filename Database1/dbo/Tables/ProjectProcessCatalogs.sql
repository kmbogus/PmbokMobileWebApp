CREATE TABLE [dbo].[ProjectProcessCatalogs] (
    [Id]                NVARCHAR (128)     NOT NULL,
    [Version]           ROWVERSION         NOT NULL,
    [CreatedAt]         DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]         DATETIMEOFFSET (7) NULL,
    [Deleted]           BIT                NOT NULL,
    [ProjectId]         NVARCHAR (128)     NULL,
    [ProjectName]       NVARCHAR (128)     NULL,
    [ProcessCatalogId]  NVARCHAR (128)     NULL,
    [ProcessText]       NVARCHAR (128)     NULL,
    [ProcessNumber]     DECIMAL (3, 1)     NULL,
    [PmbokVersionId]    NVARCHAR (128)     NULL,
    [PmbokVersionText]  NVARCHAR (128)     NULL,
    [ProcessGroupId]    NVARCHAR (128)     NULL,
    [ProcessGroupText]  NVARCHAR (128)     NULL,
    [KnowledgeAreaId]   NVARCHAR (128)     NULL,
    [KnowledgeAreaText] NVARCHAR (128)     NULL,
    [Status]            NVARCHAR (128)     NULL,
    [StatusDate]        DATETIME           NULL,
    [IsUsed]            BIT                NULL,
    CONSTRAINT [PK_dbo.ProjectProcessCatalogs] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[ProjectProcessCatalogs]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_ProjectProcessCatalogs_InsertUpdateDelete] ON [dbo].[ProjectProcessCatalogs]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[ProjectProcessCatalogs]
            SET [dbo].[ProjectProcessCatalogs].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[ProjectProcessCatalogs].[Id]
    END;