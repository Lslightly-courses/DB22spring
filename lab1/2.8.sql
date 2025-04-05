select name as '包含“MySQL”的图书书名', ID as '图书号'
from Book b
where b.name like '%MySQL%'