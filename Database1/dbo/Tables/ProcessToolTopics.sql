CREATE TABLE [dbo].[ProcessToolTopics] (
    [Id]              NVARCHAR (128)     NOT NULL,
    [Version]         ROWVERSION         NOT NULL,
    [CreatedAt]       DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]       DATETIMEOFFSET (7) NULL,
    [Deleted]         BIT                NOT NULL,
    [PmbokVersionId]  NVARCHAR (128)     NULL,
    [ProcessToolId]   NVARCHAR (128)     NULL,
    [ProcessToolText] NVARCHAR (MAX)     NULL,
    [TopicId]         NVARCHAR (128)     NULL,
    [TopicText]       NVARCHAR (128)     NULL,
    CONSTRAINT [PK_dbo.ProcessToolTopics] PRIMARY KEY NONCLUSTERED ([Id] ASC),
	CONSTRAINT [FK1_dbo.ProcessToolTopics] FOREIGN KEY ([PmbokVersionId]) REFERENCES [PmbokVersions]([Id]),
	CONSTRAINT [FK2_dbo.ProcessToolTopics] FOREIGN KEY ([ProcessToolId]) REFERENCES [ProcessTools]([Id]),
	CONSTRAINT [FK3_dbo.ProcessToolTopics] FOREIGN KEY ([TopicId]) REFERENCES [Topics]([Id]),


);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[ProcessToolTopics]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_ProcessToolTopics_InsertUpdateDelete] ON [dbo].[ProcessToolTopics]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[ProcessToolTopics]
            SET [dbo].[ProcessToolTopics].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[ProcessToolTopics].[Id]
    END;