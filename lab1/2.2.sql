select b.name as '图书名', br.Borrow_date as '借期'
from Book b, Reader r, Borrow br
where b.ID = br.book_ID and r.ID = br.Reader_ID and r.name = 'Rose'