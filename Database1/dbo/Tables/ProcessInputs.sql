CREATE TABLE [dbo].[ProcessInputs] (
    [Id]                      NVARCHAR (128)     NOT NULL,
    [Version]                 ROWVERSION         NOT NULL,
    [CreatedAt]               DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]               DATETIMEOFFSET (7) NULL,
    [Deleted]                 BIT                NOT NULL,
    [PmbokVersionId]          NVARCHAR (128)     NULL,
    [ITOId]                   NVARCHAR (128)     NULL,
    [ProcessCatalogId]        NVARCHAR (128)     NULL,
    [InputSequence]           INT                NULL,
    [ProcessInputDescription] NVARCHAR (MAX)     NULL,
    [ProcessInputText]        NVARCHAR (MAX)     NULL,
    [ITOText]                 NVARCHAR (128)     NULL,
    CONSTRAINT [PK_dbo.ProcessInputs] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[ProcessInputs]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_ProcessInputs_InsertUpdateDelete] ON [dbo].[ProcessInputs]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[ProcessInputs]
            SET [dbo].[ProcessInputs].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[ProcessInputs].[Id]
    END;