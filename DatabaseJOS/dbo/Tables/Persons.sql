CREATE TABLE [dbo].[Persons] (
    [id]        INT          NOT NULL,
    [name]      VARCHAR (50) NOT NULL,
    [borndate]  DATE         NULL,
    [id_status] INT          NOT NULL,
    [surname] NCHAR(10) NULL, 
    CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED ([id] ASC), 
    CONSTRAINT [FK_Persons_Status] FOREIGN KEY ([id_status]) REFERENCES [Persons_Status]([id])
);

