CREATE TABLE [dbo].[ProcessOutputs] (
    [Id]                       NVARCHAR (128)     NOT NULL,
    [Version]                  ROWVERSION         NOT NULL,
    [CreatedAt]                DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]                DATETIMEOFFSET (7) NULL,
    [Deleted]                  BIT                NOT NULL,
    [ITOId]                    NVARCHAR (128)     NULL,
    [ProcessCatalogId]         NVARCHAR (128)     NULL,
    [ProcessOutputDescription] NVARCHAR (MAX)     NULL,
    [ProcessOutputText]        NVARCHAR (MAX)     NULL,
    [ProcessOutputSequence]    INT                NULL,
    [PmbokVersionId]           NVARCHAR (128)     NULL,
    [ITOText]                  NVARCHAR (128)     NULL,
    CONSTRAINT [PK_dbo.ProcessOutputs] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[ProcessOutputs]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_ProcessOutputs_InsertUpdateDelete] ON [dbo].[ProcessOutputs]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[ProcessOutputs]
            SET [dbo].[ProcessOutputs].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[ProcessOutputs].[Id]
    END;