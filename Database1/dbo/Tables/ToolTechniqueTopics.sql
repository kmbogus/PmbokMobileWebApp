CREATE TABLE [dbo].[ToolTechniqueTopics] (
    [Id]                     NVARCHAR (128)     NOT NULL,
    [Version]                ROWVERSION         NOT NULL,
    [CreatedAt]              DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]              DATETIMEOFFSET (7) NULL,
    [Deleted]                BIT                NOT NULL,
    [ProcessToolTechniqueId] NVARCHAR (128)     NULL,
    [TopicId]                NVARCHAR (128)     NULL,
    [TopicNote]              NVARCHAR (MAX)     NULL,
    CONSTRAINT [PK_dbo.ToolTechniqueTopics] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[ToolTechniqueTopics]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_ToolTechniqueTopics_InsertUpdateDelete] ON [dbo].[ToolTechniqueTopics]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[ToolTechniqueTopics]
            SET [dbo].[ToolTechniqueTopics].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[ToolTechniqueTopics].[Id]
    END;