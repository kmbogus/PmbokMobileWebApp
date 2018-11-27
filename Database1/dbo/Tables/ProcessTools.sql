CREATE TABLE [dbo].[ProcessTools] (
    [Id]                     NVARCHAR (128)     NOT NULL,
    [Version]                ROWVERSION         NOT NULL,
    [CreatedAt]              DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]              DATETIMEOFFSET (7) NULL,
    [Deleted]                BIT                NOT NULL,
    [ITOId]                  NVARCHAR (128)     NULL,
    [ProcessCatalogId]       NVARCHAR (128)     NULL,
    [ProcessToolDescription] NVARCHAR (MAX)     NULL,
    [ProcessToolText]        NVARCHAR (MAX)     NULL,
    [ProcessToolSequence]    INT                NULL,
    [PmbokVersionId]         NVARCHAR (128)     NULL,
    [ITOText]                NVARCHAR (128)     NULL,
    CONSTRAINT [PK_dbo.ProcessTools] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[ProcessTools]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_ProcessTools_InsertUpdateDelete] ON [dbo].[ProcessTools]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[ProcessTools]
            SET [dbo].[ProcessTools].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[ProcessTools].[Id]
    END;