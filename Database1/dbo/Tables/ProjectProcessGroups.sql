CREATE TABLE [dbo].[ProjectProcessGroups] (
    [Id]                 NVARCHAR (128)     NOT NULL,
    [Version]            ROWVERSION         NOT NULL,
    [CreatedAt]          DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]          DATETIMEOFFSET (7) NULL,
    [Deleted]            BIT                NOT NULL,
    [ProjectId]          NVARCHAR (128)     NULL,
    [ProjectName]        NVARCHAR (128)     NULL,
    [PmbokVersionId]     NVARCHAR (128)     NULL,
    [PmbokVersionText]   NVARCHAR (128)     NULL,
    [ProcessGroupNumber] INT                NULL,
    [ProcessGroupId]     NVARCHAR (128)     NULL,
    [ProcessGroupText]   NVARCHAR (128)     NULL,
    CONSTRAINT [PK_dbo.ProjectProcessGroups] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[ProjectProcessGroups]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_ProjectProcessGroups_InsertUpdateDelete] ON [dbo].[ProjectProcessGroups]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[ProjectProcessGroups]
            SET [dbo].[ProjectProcessGroups].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[ProjectProcessGroups].[Id]
    END;