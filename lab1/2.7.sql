select r.name as '没有借阅读者“李林”所借的任何一本书的读者姓名', r.ID as '读者号'
from Reader r
where not exists (
	select *
	from Borrow br
	where br.Reader_ID = r.ID
		and br.book_ID in (
			select br1.book_ID
			from Borrow br1, Reader r1
			where br1.Reader_ID = r1.ID and r1.name = '李林'
		)
)
/*不存在r所借的书是在李林所借的书里面的*/