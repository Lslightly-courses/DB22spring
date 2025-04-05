select r.name as '未借阅图书的读者姓名'
from Reader r
where not exists
	(select br.Reader_ID
    from Borrow br
    where br.Reader_ID = r.ID)
/*对于每一个读者，不存在br中的Reader_ID与该ID对应就是没借书*/