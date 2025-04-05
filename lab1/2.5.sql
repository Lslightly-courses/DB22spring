select b.ID as '图书号', b.name as '书名'
from Book b, Borrow br, Reader r
where b.ID = br.book_ID and r.ID = br.Reader_ID and r.name = '李林' and br.Return_Date is NULL