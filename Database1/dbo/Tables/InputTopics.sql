CREATE TABLE [dbo].[InputTopics] (
    [Id]             NVARCHAR (128)     NOT NULL,
    [Version]        ROWVERSION         NOT NULL,
    [CreatedAt]      DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]      DATETIMEOFFSET (7) NULL,
    [Deleted]        BIT                NOT NULL,
    [ProcessInputId] NVARCHAR (128)     NULL,
    [TopicId]        NVARCHAR (128)     NULL,
    [TopicNote]      NVARCHAR (MAX)     NULL,
    CONSTRAINT [PK_dbo.InputTopics] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[InputTopics]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_InputTopics_InsertUpdateDelete] ON [dbo].[InputTopics]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[InputTopics]
            SET [dbo].[InputTopics].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[InputTopics].[Id]
    END;