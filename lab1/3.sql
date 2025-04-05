delimiter //
drop procedure if exists updateBookID;
create procedure updateBookID(IN oldID char(8), IN newID char(8), OUT state int)
begin
	declare ID char(8);
    declare na varchar(10);
    declare author varchar(10);
    declare price float;
    declare stat int;
    declare continue handler for not found set state = -1;
    declare continue handler for sqlexception set state = -2;
    
    start transaction;
    
    set state = 0;

	/*这里不能和declare重名*/
	select b.ID, b.name, b.author, b.price, b.status from Book b where b.ID = oldID into ID, na, author, price, stat;
    
    /*拷贝修改Book ID*/
    insert into Book(ID, name, author, price, status)
    values(newID, na, author, price, stat);
    
	/*更新Borrow表中的ID*/
    update Borrow
    set Borrow.book_ID = newID
    where Borrow.book_ID = oldID;
    
    /*删除旧ID记录*/
    delete from Book
    where Book.ID = oldID;
    
    if state = 0 then
		commit;
	else
		rollback;
	end if;
end //
delimiter ;
