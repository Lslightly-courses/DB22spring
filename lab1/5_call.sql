select * from Book;
select * from Borrow;

/*借出*/
insert into Borrow(book_ID, Reader_ID, Borrow_date, Return_date)
values('b1', 'r1', str_to_date('2021,2,3','%Y,%m,%d'), NULL);
select * from Book;
select * from Borrow;

/*归还*/
update Borrow
set Borrow.Return_date = str_to_date('2021,2,4','%Y,%m,%d')
where Borrow.book_ID = 'b1' and Reader_ID = 'r1';

select * from Book;
select * from Borrow;

/*恢复*/
delete from Borrow
where Borrow.book_ID = 'b1' and Reader_ID = 'r1';

/*插入借出归还记录*/
insert into Borrow(book_ID, Reader_ID, Borrow_date, Return_date)
values('b2', 'r2', str_to_date('2022,4,2','%Y,%m,%d'), str_to_date('2022,4,3', '%Y,%m,%d'));
select * from Book;
select * from Borrow;
delete from Borrow
where Borrow.book_ID = 'b2' and Reader_ID = 'r2';
select * from Book;
select * from Borrow;