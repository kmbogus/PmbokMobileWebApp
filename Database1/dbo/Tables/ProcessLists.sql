CREATE TABLE [dbo].[ProcessLists] (
    [Id]                 NVARCHAR (128)     NOT NULL,
    [Version]            ROWVERSION         NOT NULL,
    [CreatedAt]          DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]          DATETIMEOFFSET (7) NULL,
    [Deleted]            BIT                NOT NULL,
    [ProcessNumber]      DECIMAL (2, 1)     NULL,
    [ProcessText]        NVARCHAR (MAX)     NULL,
    [ProcessDescription] NVARCHAR (MAX)     NULL,
    [PmbokVersionId]     NVARCHAR (128)     NULL,
    [ProcessGroupId]     NVARCHAR (128)     NULL,
    [KnowledgeAreaId]    NVARCHAR (128)     NULL,
    CONSTRAINT [PK_dbo.ProcessLists] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[ProcessLists]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_ProcessLists_InsertUpdateDelete] ON [dbo].[ProcessLists]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[ProcessLists]
            SET [dbo].[ProcessLists].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[ProcessLists].[Id]
    END;