CREATE TABLE [dbo].[ProcessCatalogs] (
    [Id]                 NVARCHAR (128)     NOT NULL,
    [Version]            ROWVERSION         NOT NULL,
    [CreatedAt]          DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]          DATETIMEOFFSET (7) NULL,
    [Deleted]            BIT                NOT NULL,
    [ProcessNumber]      DECIMAL (3, 1)     NULL,
    [ProcessText]        NVARCHAR (MAX)     NULL,
    [ProcessDescription] NVARCHAR (MAX)     NULL,
    [PmbokVersionId]     NVARCHAR (128)     NULL,
    [ProcessGroupId]     NVARCHAR (128)     NULL,
    [KnowledgeAreaId]    NVARCHAR (128)     NULL,
    [ProcessGroupText]   NVARCHAR (128)     NULL,
    [KnowledgeAreaText]  NVARCHAR (128)     NULL,
    CONSTRAINT [PK_dbo.ProcessCatalogs] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[ProcessCatalogs]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_ProcessCatalogs_InsertUpdateDelete] ON [dbo].[ProcessCatalogs]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[ProcessCatalogs]
            SET [dbo].[ProcessCatalogs].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[ProcessCatalogs].[Id]
    END;