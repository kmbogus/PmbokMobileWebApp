CREATE TABLE [dbo].[ProjectMembers] (
    [Id]          NVARCHAR (128)     NOT NULL,
    [Version]     ROWVERSION         NOT NULL,
    [CreatedAt]   DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]   DATETIMEOFFSET (7) NULL,
    [Deleted]     BIT                NOT NULL,
    [ProjectId]   NVARCHAR (128)     NULL,
    [ProjectName] NVARCHAR (128)     NULL,
    [FirstName]   NVARCHAR (128)     NULL,
    [LastName]    NVARCHAR (128)     NULL,
    [Title]       NVARCHAR (128)     NULL,
    [Email]       NVARCHAR (128)     NULL,
    [Role]        NVARCHAR (128)     NULL,
    [Mobile]      NVARCHAR (128)     NULL,
    [Phone]       NVARCHAR (128)     NULL,
    CONSTRAINT [PK_dbo.ProjectMembers] PRIMARY KEY NONCLUSTERED ([Id] ASC),
	CONSTRAINT [FK1_dbo.ProjectMembers] FOREIGN KEY ([ProjectId]) REFERENCES [Projects]([Id])
);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[ProjectMembers]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_ProjectMembers_InsertUpdateDelete] ON [dbo].[ProjectMembers]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[ProjectMembers]
            SET [dbo].[ProjectMembers].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[ProjectMembers].[Id]
    END;