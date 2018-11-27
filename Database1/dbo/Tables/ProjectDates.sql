CREATE TABLE [dbo].[ProjectDates] (
    [Id]            NVARCHAR (128)     NOT NULL,
    [Version]       ROWVERSION         NOT NULL,
    [CreatedAt]     DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]     DATETIMEOFFSET (7) NULL,
    [Deleted]       BIT                NOT NULL,
    [ProjectId]     NVARCHAR (128)     NULL,
    [ProjectName]   NVARCHAR (128)     NULL,
    [DateType]      NVARCHAR (128)     NULL,
    [OtherDateType] NVARCHAR (128)     NULL,
    [RecordedDate]  DATETIME           NULL,
    [DateNote]      NVARCHAR (MAX)     NULL,
    CONSTRAINT [PK_dbo.ProjectDates] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[ProjectDates]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_ProjectDates_InsertUpdateDelete] ON [dbo].[ProjectDates]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[ProjectDates]
            SET [dbo].[ProjectDates].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[ProjectDates].[Id]
    END;