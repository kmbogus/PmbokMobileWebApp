CREATE TABLE [dbo].[Topics] (
    [Id]               NVARCHAR (128)     NOT NULL,
    [Version]          ROWVERSION         NOT NULL,
    [CreatedAt]        DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]        DATETIMEOFFSET (7) NULL,
    [Deleted]          BIT                NOT NULL,
    [TopicDescription] NVARCHAR (MAX)     NULL,
    [TopicText]        NVARCHAR (MAX)     NULL,
    [PmbokVersionId]   NVARCHAR (128)     NULL,
    CONSTRAINT [PK_dbo.Topics] PRIMARY KEY NONCLUSTERED ([Id] ASC),
	CONSTRAINT [FK1_dbo.Topics] FOREIGN KEY ([PmbokVersionId]) REFERENCES [PmbokVersions]([Id]),

);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[Topics]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_Topics_InsertUpdateDelete] ON [dbo].[Topics]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[Topics]
            SET [dbo].[Topics].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[Topics].[Id]
    END;