select r.name as '借阅图书数目超过3本的读者姓名'
from Reader r,
	(select br.Reader_ID as rid
    from Borrow br
    group by br.Reader_ID
		having count(*) > 3) rids
where r.ID = rids.rid
/*Borrow表根据Reader_ID进行分组统计，大于3则选中*/