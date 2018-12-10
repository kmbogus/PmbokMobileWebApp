CREATE TABLE [dbo].[KnowledgeAreas] (
    [Id]                       NVARCHAR (128)     NOT NULL,
    [Version]                  ROWVERSION         NOT NULL,
    [CreatedAt]                DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]                DATETIMEOFFSET (7) NULL,
    [Deleted]                  BIT                NOT NULL,
    [KnowledgeAreaNumber]      INT                NULL,
    [KnowledgeAreaText]        NVARCHAR (MAX)     NULL,
    [KnowledgeAreaDescription] NVARCHAR (MAX)     NULL,
    [PmbokVersionId]           NVARCHAR (128)     NULL,
    CONSTRAINT [PK_dbo.KnowledgeAreas] PRIMARY KEY NONCLUSTERED ([Id] ASC),
	CONSTRAINT [FK1_dbo.KnowledgeArea] FOREIGN KEY ([PmbokVersionId]) REFERENCES [PmbokVersions]([Id])
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[KnowledgeAreas]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_KnowledgeAreas_InsertUpdateDelete] ON [dbo].[KnowledgeAreas]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[KnowledgeAreas]
            SET [dbo].[KnowledgeAreas].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[KnowledgeAreas].[Id]
    END;