select 
	(select count(*) from Authors) 
	* 
	(select count(*) from Awards) 
	*
	(select count(*) from Nominations) 
	*
	(select count(*) from Novels)


select count(*)
from Authors, Awards, Nominations, Novels

select *
from Novels n
inner join Authors a on a.ID = n.AuthorID
where n.Title in
	(
		select n.Title
		from Novels n
		group by n.Title
		having count(n.ID) > 1
	)

select n.Title, COUNT(n.id)
from Novels n

select t1.AuthorID, t1.YearNominated, t2.YearNominated, (t1.YearNominated - t2.YearNominated) as dif
from
(select b.AuthorID, n.YearNominated
from Nominations n
inner join Novels b on b.ID = n.BookID
) as t1
inner join 
(select b.AuthorID, n.YearNominated
from Nominations n
inner join Novels b on b.ID = n.BookID
) as t2 on t1.AuthorID = t2.AuthorID
where t1.YearNominated > t2.YearNominated
and not exists
 (select *
from Nominations n
inner join Novels b on b.ID = n.BookID
where n.YearNominated < t1.YearNominated and n.YearNominated > t2.YearNominated
and b.AuthorID = t1.AuthorID)
--group by t1.AuthorID
order by t1.AuthorID desc


select b.AuthorID, n.YearNominated
from Nominations n
inner join Novels b on b.ID = n.BookID
--group by n.YearNominated, b.AuthorID
where b.AuthorID = 103
--order by b.AuthorID, n.YearNominated


select *
from Nominations n
inner join Novels b on b.ID = n.BookID
where n.YearNominated > 1969 and n.YearNominated < 2010
and b.AuthorID = 159



select t1.AuthorID, MAX(t1.YearNominated - t2.YearNominated) as dif
from
	(select b.AuthorID, n.YearNominated
	from Nominations n
	inner join Novels b on b.ID = n.BookID
	) as t1
inner join 
	(select b.AuthorID, n.YearNominated
	from Nominations n
	inner join Novels b on b.ID = n.BookID
	) as t2 
on t1.AuthorID = t2.AuthorID
where t1.YearNominated > t2.YearNominated
	and not exists
	 (select *
	from Nominations n
	inner join Novels b on b.ID = n.BookID
	where n.YearNominated < t1.YearNominated and n.YearNominated > t2.YearNominated
	and b.AuthorID = t1.AuthorID)
group by t1.AuthorID
order by dif desc

select * from Authors where ID = 103