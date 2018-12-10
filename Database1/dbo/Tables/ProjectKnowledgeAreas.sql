CREATE TABLE [dbo].[ProjectKnowledgeAreas] (
    [Id]                NVARCHAR (128)     NOT NULL,
    [Version]           ROWVERSION         NOT NULL,
    [CreatedAt]         DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]         DATETIMEOFFSET (7) NULL,
    [Deleted]           BIT                NOT NULL,
    [ProjectId]         NVARCHAR (128)     NULL,
    [ProjectName]       NVARCHAR (128)     NULL,
    [PmbokVersionId]    NVARCHAR (128)     NULL,
    [PmbokVersionText]  NVARCHAR (128)     NULL,
    [KnowledgeAreaId]   NVARCHAR (128)     NULL,
    [KnowledgeAreaText] NVARCHAR (128)     NULL,
    CONSTRAINT [PK_dbo.ProjectKnowledgeAreas] PRIMARY KEY NONCLUSTERED ([Id] ASC),
	CONSTRAINT [FK1_dbo.ProjectKnowledgeAreas] FOREIGN KEY ([PmbokVersionId]) REFERENCES [PmbokVersions]([Id]),
	CONSTRAINT [FK2_dbo.ProjectKnowledgeAreas] FOREIGN KEY ([ProjectId]) REFERENCES [Projects]([Id]),
	CONSTRAINT [FK3_dbo.ProjectKnowledgeAreas] FOREIGN KEY ([KnowledgeAreaId]) REFERENCES [KnowledgeAreas]([Id]),

);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[ProjectKnowledgeAreas]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_ProjectKnowledgeAreas_InsertUpdateDelete] ON [dbo].[ProjectKnowledgeAreas]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[ProjectKnowledgeAreas]
            SET [dbo].[ProjectKnowledgeAreas].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[ProjectKnowledgeAreas].[Id]
    END;