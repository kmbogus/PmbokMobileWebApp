CREATE TABLE [dbo].[OutputTopics] (
    [Id]              NVARCHAR (128)     NOT NULL,
    [Version]         ROWVERSION         NOT NULL,
    [CreatedAt]       DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]       DATETIMEOFFSET (7) NULL,
    [Deleted]         BIT                NOT NULL,
    [ProcessOutputId] NVARCHAR (128)     NULL,
    [TopicId]         NVARCHAR (128)     NULL,
    [TopicNote]       NVARCHAR (MAX)     NULL,
    CONSTRAINT [PK_dbo.OutputTopics] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[OutputTopics]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_OutputTopics_InsertUpdateDelete] ON [dbo].[OutputTopics]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[OutputTopics]
            SET [dbo].[OutputTopics].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[OutputTopics].[Id]
    END;