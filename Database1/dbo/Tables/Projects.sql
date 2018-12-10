CREATE TABLE [dbo].[Projects] (
    [Id]               NVARCHAR (128)     NOT NULL,
    [Version]          ROWVERSION         NOT NULL,
    [CreatedAt]        DATETIMEOFFSET (7) DEFAULT (sysdatetime()) NOT NULL,
    [UpdatedAt]        DATETIMEOFFSET (7) NULL,
    [Deleted]          BIT                NOT NULL,
    [ProjectId]        NVARCHAR (128)     NULL,
    [ProjectName]      NVARCHAR (128)     NULL,
    [Status]           NVARCHAR (128)     NULL,
    [StartDate]        DATETIME           NULL,
    [EndDate]          DATETIME           NULL,
    [FullDescription]  NVARCHAR (MAX)     NULL,
    [Manager]          NVARCHAR (128)     NULL,
    [Sponsor]          NVARCHAR (128)     NULL,
    [ProgramId]        NVARCHAR (128)     NULL,
    [ProgramName]      NVARCHAR (128)     NULL,
    [PmbokVersionId]   NVARCHAR (128)     NULL,
    [PmbokVersionText] NVARCHAR (128)     NULL,
    [EstimatedBudget]  DECIMAL (18, 2)    NULL,
    [ApprovedBudget]   DECIMAL (18, 2)    NULL,
    CONSTRAINT [PK_dbo.Projects] PRIMARY KEY NONCLUSTERED ([Id] ASC),
	CONSTRAINT [FK1_dbo.Projects] FOREIGN KEY ([PmbokVersionId]) REFERENCES [PmbokVersions]([Id]),

);
GO
CREATE CLUSTERED INDEX [IX_CreatedAt]
    ON [dbo].[Projects]([CreatedAt] ASC);
GO
CREATE TRIGGER [TR_dbo_Projects_InsertUpdateDelete] ON [dbo].[Projects]
    AFTER INSERT, UPDATE, DELETE AS
    BEGIN
        UPDATE [dbo].[Projects]
            SET [dbo].[Projects].[UpdatedAt] = CONVERT(DATETIMEOFFSET, SYSUTCDATETIME())
            FROM INSERTED WHERE inserted.[Id] = [dbo].[Projects].[Id]
    END;