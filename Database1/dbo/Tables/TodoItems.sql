CREATE TABLE [dbo].[TodoItems] (
    [Id]         NVARCHAR (128)     NOT NULL,
    [Version]    ROWVERSION         NOT NULL,
    [CreatedAt]  DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]  DATETIMEOFFSET (7) NULL,
    [Deleted]    BIT                NOT NULL,
    [TodoText]   NVARCHAR (MAX)     NULL,
    [Complete]   BIT                NULL,
    [DueDate]    DATETIME           NULL,
    [UserId]     NVARCHAR (128)     NULL,
    [AssignedTo] NVARCHAR (128)     NULL,
    CONSTRAINT [PK_dbo.TodoItems] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[TodoItems]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_TodoItems_InsertUpdateDelete] ON [dbo].[TodoItems]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[TodoItems]
            SET [dbo].[TodoItems].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[TodoItems].[Id]
    END;