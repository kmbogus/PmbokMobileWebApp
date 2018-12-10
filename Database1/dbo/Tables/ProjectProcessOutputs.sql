CREATE TABLE [dbo].[ProjectProcessOutputs] (
    [Id]               NVARCHAR (128)     NOT NULL,
    [Version]          ROWVERSION         NOT NULL,
    [CreatedAt]        DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]        DATETIMEOFFSET (7) NULL,
    [Deleted]          BIT                NOT NULL,
    [ProjectId]        NVARCHAR (128)     NULL,
    [ProjectName]      NVARCHAR (128)     NULL,
    [PmbokVersionId]   NVARCHAR (128)     NULL,
    [PmbokVersionText] NVARCHAR (128)     NULL,
    [ProcessCatalogId] NVARCHAR (128)     NULL,
    [ProcessText]      NVARCHAR (128)     NULL,
    [ProcessNumber]    DECIMAL (4, 2)     NULL,
    [ITOId]            NVARCHAR (128)     NULL,
    [ITOText]          NVARCHAR (128)     NULL,
    [InputSequence]    INT                NULL,
    [Status]           NVARCHAR (128)     NULL,
    [StatusDate]       DATETIME           NULL,
    [IsUsed]           BIT                NULL,
    CONSTRAINT [PK_dbo.ProjectProcessOutputs] PRIMARY KEY NONCLUSTERED ([Id] ASC),
	CONSTRAINT [FK1_dbo.ProjectProcessOutputs] FOREIGN KEY ([PmbokVersionId]) REFERENCES [PmbokVersions]([Id]),
	CONSTRAINT [FK2_dbo.ProjectProcessOutputs] FOREIGN KEY ([ProjectId]) REFERENCES [Projects]([Id]),
	CONSTRAINT [FK3_dbo.ProjectProcessOutputs] FOREIGN KEY ([ProcessCatalogId]) REFERENCES [ProcessCatalogs]([Id]),
	CONSTRAINT [FK4_dbo.ProjectProcessOutputs] FOREIGN KEY ([ITOId]) REFERENCES [ITOes]([Id]),
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[ProjectProcessOutputs]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_ProjectProcessOutputs_InsertUpdateDelete] ON [dbo].[ProjectProcessOutputs]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[ProjectProcessOutputs]
            SET [dbo].[ProjectProcessOutputs].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[ProjectProcessOutputs].[Id]
    END;