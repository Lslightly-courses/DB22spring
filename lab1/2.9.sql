select r.ID as '读者号', r.name as '读者姓名', r.age as '年龄', br_count.num as '2021年借阅图书数'
from Reader r,
	(
		select br.Reader_ID as rid, count(*) as num
        from Borrow br
        where year(br.Borrow_date) = 2021
        group by br.Reader_ID
	) br_count
where r.ID = br_count.rid
order by br_count.num desc
limit 20
/*分组统计借书日期在2021年的借书数目，然后降序排列，限制前20个*/