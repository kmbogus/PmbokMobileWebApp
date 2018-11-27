CREATE TABLE [dbo].[PmbokVersions] (
    [Id]                      NVARCHAR (128)     NOT NULL,
    [Version]                 ROWVERSION         NOT NULL,
    [CreatedAt]               DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]               DATETIMEOFFSET (7) NULL,
    [Deleted]                 BIT                NOT NULL,
    [PmbokVersionNumber]      INT                NULL,
    [PmbokVersionText]        NVARCHAR (MAX)     NULL,
    [PmbokVersionDescription] NVARCHAR (MAX)     NULL,
    CONSTRAINT [PK_dbo.PmbokVersions] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[PmbokVersions]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_PmbokVersions_InsertUpdateDelete] ON [dbo].[PmbokVersions]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[PmbokVersions]
            SET [dbo].[PmbokVersions].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[PmbokVersions].[Id]
    END;