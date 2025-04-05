delimiter //
drop trigger if exists updateStatusBorrow;//
create trigger updateStatusBorrow after insert on Borrow FOR EACH ROW
begin
	/*借出*/
	if new.Return_Date is not null then
		update Book
        set Book.status = 0
        where Book.ID = new.book_ID;
	else
		update Book
        set Book.status = 1
        where Book.ID = new.book_ID;
	end if;
end //
drop trigger if exists updateStatusReturn;//
create trigger updateStatusReturn after update on Borrow FOR EACH ROW
begin
	if new.Return_Date is not null then
		update Book
        set Book.status = 0
        where Book.ID = new.book_ID;
	else
		update Book
        set Book.status = 1
        where Book.ID = new.book_ID;
	end if;
end //
delimiter ;