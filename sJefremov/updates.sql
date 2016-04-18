alter table Novels
add IsRead bit null

update Novels
set IsRead = 1
where ID in 
	(
		select n.BookID 
		from Nominations n
			inner join Awards a on a.ID = n.AwardID
		where YearNominated = 1995 and a.AwardName = 'Nebula'
	)

select *
from Novels
where ID in 
	(
		select n.BookID 
		from Nominations n
			inner join Awards a on a.ID = n.AwardID
		where YearNominated = 1995 and a.AwardName = 'Nebula'
	)