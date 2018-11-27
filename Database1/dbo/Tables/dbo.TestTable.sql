CREATE TABLE [dbo].[TestTables] (
    [Id]             NVARCHAR (128)     NOT NULL,
    [Version]        ROWVERSION         NOT NULL,
    [CreatedAt]      DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]      DATETIMEOFFSET (7) NULL,
    [Deleted]        BIT                NOT NULL,
    [TestNote]      NVARCHAR (MAX)     NULL,
    CONSTRAINT [PK_dbo.TestTables] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[TestTables]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_TestTables_InsertUpdateDelete] ON [dbo].[TestTables]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[TestTables]
            SET [dbo].[TestTables].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[TestTables].[Id]
    END;