delimiter //
drop procedure if exists countIncorrectStatus;
create procedure countIncorrectStatus(OUT num int, OUT state int)
begin
	declare continue handler for not found set state = -1;
    declare continue handler for sqlexception set state = -2;
    
    start transaction;
    
    set num = 0;
	set state = 0;
    select count(*) into num
    from Book b
    where (b.status <> 0 and b.status <> 1) 
			or (
				b.status = 1 and not exists (
					select *
                    from Borrow br1
					where br1.book_ID = b.ID and br1.Return_date is NULL
				)
			/*显示借出但是没有是NULL的*/
            ) or (
				b.status = 0 and exists (
					select *
                    from Borrow br2
                    where br2.book_ID = b.ID and br2.Return_date is NULL
                )
			/*显示没借出但是实际有借出*/
            );
    
    if state = 0 then
		commit;
	else
		rollback;
	end if;
    
end //
delimiter ;
