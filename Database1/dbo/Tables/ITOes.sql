CREATE TABLE [dbo].[ITOes] (
    [Id]             NVARCHAR (128)     NOT NULL,
    [Version]        ROWVERSION         NOT NULL,
    [CreatedAt]      DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]      DATETIMEOFFSET (7) NULL,
    [Deleted]        BIT                NOT NULL,
    [ITOId]          INT                NULL,
    [ITOText]        NVARCHAR (MAX)     NULL,
    [ITODescription] NVARCHAR (MAX)     NULL,
    [PmbokVersionId] NVARCHAR (128)     NULL,
    CONSTRAINT [PK_dbo.ITOes] PRIMARY KEY NONCLUSTERED ([Id] ASC),
	CONSTRAINT [FK1_dbo.ITOes] FOREIGN KEY ([PmbokVersionId]) REFERENCES [PmbokVersions]([Id])
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[ITOes]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_ITOes_InsertUpdateDelete] ON [dbo].[ITOes]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[ITOes]
            SET [dbo].[ITOes].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[ITOes].[Id]
    END;