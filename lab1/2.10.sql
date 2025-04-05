drop view if exists rb;
create view rb(rno, rname, bno, bname, borrow_date)
as select r.ID, r.name, b.ID, b.name, br.Borrow_Date
	from Reader r, Book b, Borrow br
    where r.ID = br.Reader_ID and b.ID = br.book_ID;

select rb.rno as '读者号', count(distinct(rb.bno)) as '不同图书数'
from rb
where date_sub(curdate(), interval 1 year) < rb.borrow_date
group by rb.rno