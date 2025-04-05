drop table if exists Borrow;
drop table if exists Book;
drop table if exists Reader;
CREATE Table Book (
  ID CHAR(8),
  name VARCHAR(10) NOT NULL,
  author VARCHAR(10),
  price FLOAT,
  status INT DEFAULT 0,
  constraint PK_Book primary key(ID)
);

CREATE Table Reader (
	ID CHAR(8),
	name VARCHAR(10),
	age INT,
	address VARCHAR(20),
    constraint PK_Reader primary key(ID)
);

CREATE Table Borrow (
  book_ID CHAR(8),
  Reader_ID CHAR(8),
  Borrow_Date date,
  Return_Date date,
  constraint PK_br primary key(book_ID, Reader_ID),
  constraint FK_book foreign key(book_ID) references Book(ID),
  constraint FK_reader foreign key(Reader_ID) references Reader(ID)
);