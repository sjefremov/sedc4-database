insert into dbo.Authors
	(Name, DateOfBirth, DateOfDeath)
values
	('Ernest Hemingway',
	 CAST(CAST('1899' AS varchar) + '-' + CAST('07' AS varchar) + '-' + CAST('21' AS varchar) AS DATETIME),
	 CAST(CAST('1961' AS varchar) + '-' + CAST('07' AS varchar) + '-' + CAST('02' AS varchar) AS DATETIME))

insert into dbo.Authors
	(Name, DateOfBirth, DateOfDeath)
values
	(N'Григор Прличев',
	 '1830-01-18',
	 '1893-02-06')

insert into Novels
	(Title, AuthorID)
values
	('For Whom the Bell Tolls', (select a.ID from Authors a where a.Name = 'Ernest Hemingway'))

insert into Novels
	(Title, AuthorID)
values
	('To Have and Have Not', (select a.ID from Authors a where a.Name = 'Ernest Hemingway'))


insert into Novels
	(Title, AuthorID)
values
	(N'Сердарот', (select a.ID from Authors a where a.Name = N'Григор Прличев'))

insert into Novels
	(Title, AuthorID)
values
	(N'Автобиографија', (select a.ID from Authors a where a.Name = N'Григор Прличев'))