	CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Category] [varchar] (50) NOT NULL,
	[UserID] [int] NOT NULL
	);

	insert into Categories (Category, UserID) values ('Travel', 1);
	insert into Categories (Category, UserID) values ('Food', 1);
	insert into Categories (Category, UserID) values ('House', 1);

CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Account] [varchar] (50) NOT NULL,
	[UserID] [int] NOT NULL
	);

	insert into Accounts (Account, UserID) values ('Cash', 1);
	insert into Accounts (Account, UserID) values ('BMO Debit', 1);
	insert into Accounts (Account, UserID) values ('BMO Credit', 1);

CREATE TABLE [dbo].[Mechants](
	[MechantID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Mechant] [varchar] (50) NOT NULL,
	[UserID] [int] NOT NULL);

	insert into Mechants (Mechant, UserID) values ('KFC', 1);
	insert into Mechants (Mechant, UserID) values ('Freshco', 1);
	insert into Mechants (Mechant, UserID) values ('Nofrills', 1);

CREATE TABLE [dbo].[Notes] (
	[NoteID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Note] [varchar] (2000) NOT NULL,
	[UserID] [int] NOT NULL);

	insert into Notes (Note, UserID) values ('First Note', 1);
	insert into Notes (Note, UserID) values ('Second Note', 1);
	insert into Notes (Note, UserID) values ('Third Note', 1);



CREATE TABLE [dbo].[DataInfoes](
	[DatainfoID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Amount] [int]  NOT NULL,
	[CategoryID] [int] FOREIGN KEY REFERENCES Categories(CategoryID),
	[AccountID] [int] FOREIGN KEY REFERENCES Accounts(AccountID),
	[MechantID] [int] FOREIGN KEY REFERENCES Mechants(MechantID),
	[NoteID] [int] FOREIGN KEY REFERENCES Notes(NoteID),
	[UserID] [int] NOT NULL,
	[Date] DATE NOT NULL)

	insert into DataInfoes (Amount, CategoryID, AccountID, MechantID, NoteID, UserID, Date)
	values (1000, 1, 1, 1, 1, 1, '2015-7-25');

	insert into DataInfoes (Amount, CategoryID, AccountID, MechantID, NoteID, UserID, Date)
	values (2000, 2, 2, 2, 2, 1, '2015-7-26');

	insert into DataInfoes (Amount, CategoryID, AccountID, MechantID, NoteID, UserID, Date)
	values (3000, 2, 3, 2, 3, 1, '2015-7-27');