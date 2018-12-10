CREATE TABLE [dbo].[ProcessGroups] (
    [Id]                      NVARCHAR (128)     NOT NULL,
    [Version]                 ROWVERSION         NOT NULL,
    [CreatedAt]               DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]               DATETIMEOFFSET (7) NULL,
    [Deleted]                 BIT                NOT NULL,
    [ProcessGroupNumber]      INT                NULL,
    [ProcessGroupText]        NVARCHAR (MAX)     NULL,
    [ProcessGroupDescription] NVARCHAR (MAX)     NULL,
    [PmbokVersionId]          NVARCHAR (128)     NULL,
    CONSTRAINT [PK_dbo.ProcessGroups] PRIMARY KEY NONCLUSTERED ([Id] ASC),
	CONSTRAINT [FK1_dbo.ProcessGroups] FOREIGN KEY ([PmbokVersionId]) REFERENCES [PmbokVersions]([Id]),

);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[ProcessGroups]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_ProcessGroups_InsertUpdateDelete] ON [dbo].[ProcessGroups]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[ProcessGroups]
            SET [dbo].[ProcessGroups].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[ProcessGroups].[Id]
    END;