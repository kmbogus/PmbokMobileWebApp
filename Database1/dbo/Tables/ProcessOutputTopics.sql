CREATE TABLE [dbo].[ProcessOutputTopics] (
    [Id]                NVARCHAR (128)     NOT NULL,
    [Version]           ROWVERSION         NOT NULL,
    [CreatedAt]         DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]         DATETIMEOFFSET (7) NULL,
    [Deleted]           BIT                NOT NULL,
    [PmbokVersionId]    NVARCHAR (128)     NULL,
    [ProcessOutputId]   NVARCHAR (128)     NULL,
    [ProcessOutputText] NVARCHAR (MAX)     NULL,
    [TopicId]           NVARCHAR (128)     NULL,
    [TopicText]         NVARCHAR (128)     NULL,
    CONSTRAINT [PK_dbo.ProcessOutputTopics] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[ProcessOutputTopics]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_ProcessOutputTopics_InsertUpdateDelete] ON [dbo].[ProcessOutputTopics]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[ProcessOutputTopics]
            SET [dbo].[ProcessOutputTopics].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[ProcessOutputTopics].[Id]
    END;