CREATE TABLE [dbo].[ProjectProcessInputs] (
    [Id]               NVARCHAR (128)     NOT NULL,
    [Version]          ROWVERSION         NOT NULL,
    [CreatedAt]        DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]        DATETIMEOFFSET (7) NULL,
    [Deleted]          BIT                NOT NULL,
    [ProjectId]        NVARCHAR (128)     NULL,
    [ProjectName]      NVARCHAR (128)     NULL,
    [PmbokVersionId]   NVARCHAR (128)     NULL,
    [PmbokVersionText] NVARCHAR (128)     NULL,
    [ProcessCatalogId] NVARCHAR (128)     NULL,
    [ProcessText]      NVARCHAR (128)     NULL,
    [ProcessNumber]    DECIMAL (4, 2)     NULL,
    [ITOId]            NVARCHAR (128)     NULL,
    [ITOText]          NVARCHAR (128)     NULL,
    [InputSequence]    INT                NULL,
    [Status]           NVARCHAR (128)     NULL,
    [StatusDate]       DATETIME           NULL,
    [IsUsed]           BIT                NULL,
    CONSTRAINT [PK_dbo.ProjectProcessInputs] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[ProjectProcessInputs]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_ProjectProcessInputs_InsertUpdateDelete] ON [dbo].[ProjectProcessInputs]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[ProjectProcessInputs]
            SET [dbo].[ProjectProcessInputs].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[ProjectProcessInputs].[Id]
    END;