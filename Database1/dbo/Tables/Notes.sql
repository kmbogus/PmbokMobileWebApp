CREATE TABLE [dbo].[Notes] (
    [Id]              NVARCHAR (128)     NOT NULL,
    [Version]         ROWVERSION         NOT NULL,
    [CreatedAt]       DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]       DATETIMEOFFSET (7) NULL,
    [Deleted]         BIT                NOT NULL,
    [NoteDescription] NVARCHAR (MAX)     NULL,
    [NoteText]        NVARCHAR (MAX)     NULL,
    [PmbokVersionId]  NVARCHAR (128)     NULL,
    CONSTRAINT [PK_dbo.Notes] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[Notes]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_Notes_InsertUpdateDelete] ON [dbo].[Notes]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[Notes]
            SET [dbo].[Notes].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[Notes].[Id]
    END;