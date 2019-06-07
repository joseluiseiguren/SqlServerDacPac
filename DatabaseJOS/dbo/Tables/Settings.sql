CREATE TABLE [dbo].[Settings]
(
	[allowdelete] BIT NOT NULL, 
    [imagespath] VARCHAR(50) NOT NULL, 
    [userroot] VARCHAR(50) NOT NULL, 
    [lastmodified] DATE NOT NULL, 
    [id] INT NOT NULL, 
    CONSTRAINT [PK_Settings] PRIMARY KEY ([id]) 
)
