CREATE TABLE [dbo].[ProcessInputTopics] (
    [Id]               NVARCHAR (128)     NOT NULL,
    [Version]          ROWVERSION         NOT NULL,
    [CreatedAt]        DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]        DATETIMEOFFSET (7) NULL,
    [Deleted]          BIT                NOT NULL,
    [PmbokVersionId]   NVARCHAR (128)     NULL,
    [ProcessInputId]   NVARCHAR (128)     NULL,
    [ProcessInputText] NVARCHAR (MAX)     NULL,
    [TopicId]          NVARCHAR (128)     NULL,
    [TopicText]        NVARCHAR (128)     NULL,
    CONSTRAINT [PK_dbo.ProcessInputTopics] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[ProcessInputTopics]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_ProcessInputTopics_InsertUpdateDelete] ON [dbo].[ProcessInputTopics]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[ProcessInputTopics]
            SET [dbo].[ProcessInputTopics].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[ProcessInputTopics].[Id]
    END;