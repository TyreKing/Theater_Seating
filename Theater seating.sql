drop schema if exists private cascade;
drop table if exists SeatRow, SeatNum, seat, ticket cascade;
drop table if exists customer cascade;


create schema private;

create table SeatRow(
    row Varchar(2) primary key
    );
    
create table SeatNum(
    num int primary key
    );
create table Seat(
    SeatRow Varchar,
    SeatNumber int,
    Section text not null,
    side text not null,
    PricingTier text not null,
    Wheelchair boolean not null,
    
   	constraint pk Primary Key (SeatRow,SeatNumber),
  	constraint fkrow foreign key(SeatRow)references seatRow (row),
    constraint fknum foreign key(SeatNumber)references seatNum (num),
    check (side like 'Right' or side like 'Middle' or side like 'Left'),
    check (section like 'Balcony' or section like 'Main Floor'),
    check (PricingTier like 'Upper Balcony' or PricingTier like 'Side' or PricingTier like 'Orchestra'),
    check(Wheelchair = true or Wheelchair = false),
    check(SeatRow  not like 'I')
    );
    
    
  
    
    
    create table public.Customer(
        CustomerID  int primary key,
        FirstName text,
        LastName text
   );
        
    create table private.customer(
          CustomerID int primary key,
       	creditCard bigint unique,
        constraint CustomerID foreign key(CustomerID) references public.customer(CustomerID)
   );
   
   create table Ticket(
       TicketNumber serial primary key,
       CustomerID int,
       SeatRow Varchar,
       SeatNumber int,
       ShowTime timestamp,
       constraint fk1 foreign key (CustomerID) references public.customer(customerID),
       constraint fk2 foreign key (SeatRow, SeatNumber) references Seat(SeatRow, SeatNumber),
       constraint tik unique(Showtime, SeatRow, SeatNumber)
       );
       
	
  --  SeatRow Varchar,
  --  SeatNumber int,
  --  Section text not null,
    -- side text not null,
   -- PricingTier text not null,
  --  Wheelchair boolean not null,
  
    -- insert into seat values('a', 102, 'Main Floor', 'Middle', 'Orchestra', false);
    insert into seatRow (row) values('A');
    insert into seatRow (row) values('B');
    insert into seatRow (row) values('C');
    insert into seatRow (row) values('D');
    insert into seatRow (row) values('E');
    insert into seatRow (row) values('F');
    insert into seatRow (row) values('G');
    insert into seatRow (row) values('H');
  
    insert into seatRow (row) values('J');
    insert into seatRow (row) values('K');
    insert into seatRow (row) values('L');
    insert into seatRow (row) values('M');
    insert into seatRow (row) values('N');
    insert into seatRow (row) values('O');
    insert into seatRow (row) values('P');
    insert into seatRow (row) values('Q');
    insert into seatRow (row) values('R');
    insert into seatRow (row) values('AA');
    insert into seatRow (row) values('BB');
    insert into seatRow (row) values('CC');
    insert into seatRow (row) values('DD');
    insert into seatRow (row) values('EE');
    insert into seatRow (row) values('FF');
    insert into seatRow (row) values('GG');
    insert into seatRow (row) values('HH');
    
    insert into seatNum(num) values( generate_series(1,15));
   	insert into seatNum(num) values( generate_series(100,128));
    
    
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Middle', 'Orchestra', false
   from seatRow, seatNum
   where (row = 'A' or row = 'B' or row = 'C')
   and num < 11
   ;
    insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Middle', 'Orchestra', false
   from seatRow, seatNum
   where (row = 'D' or row = 'E' or row = 'F')
   and num < 12
   ;
    insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Middle', 'Orchestra', false
   from seatRow, seatNum
   where (row = 'G' or row = 'H' or row = 'J')
   and num < 13
   ;
    insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Middle', 'Orchestra', false
   from seatRow, seatNum
   where (row = 'K' or row = 'L' or row = 'M')
   and num < 14
   ;
    insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Middle', 'Orchestra', false
   from seatRow, seatNum
   where (row = 'N' or row = 'O' or row = 'P')
   and num < 15
   ;
    insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Middle', 'Orchestra', false
   from seatRow, seatNum
   where (row = 'Q' or row = 'R' )
   and num < 16
   ;
   
   
    insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Left', 'Orchestra', false
   from seatRow, seatNum
   where (row = 'A' or row = 'B' or row = 'C' or row = 'D' OR ROW = 'E' OR ROW = 'F' OR ROW = 'G' OR ROW = 'H' OR ROW = 'I' OR ROW ='J' OR ROW = 'K' OR ROW = 'L' OR ROW = 'M' OR ROW = 'N' OR ROW = 'O' OR ROW = 'P')
   and num >100 and num < 107 and num %2 =1 
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Right', 'Orchestra', false
   from seatRow, seatNum
   where (row = 'A' or row = 'B' or row = 'C' or row = 'D' OR ROW = 'E' OR ROW = 'F' OR ROW = 'G' OR ROW = 'H' OR ROW = 'I' OR ROW ='J' OR ROW = 'K' OR ROW = 'L' OR ROW = 'M' OR ROW = 'N' OR ROW = 'O' OR ROW = 'P')
   and num >100 and num < 108 and num %2 =0 
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Left', 'Side', false
   from seatRow, seatNum
   where row = 'A' 
   and num >= 107 and num <=113 and num %2=1
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Right', 'Side', false
   from seatRow, seatNum
   where row = 'A' 
   and num >= 107 and num <=114 and num %2=0
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Right', 'Side', false
   from seatRow, seatNum
   where (row = 'B' or row ='C' OR ROW ='D' OR ROW = 'D') 
   and num >= 107 and num <=116 and num %2=0
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Left', 'Side', false
   from seatRow, seatNum
   where (row = 'B' or row ='C' OR ROW ='D' OR ROW = 'D') 
   and num >= 107 and num <=116 and num %2=1
   ;
   
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Right', 'Side', false
   from seatRow, seatNum
   where (row = 'F' or row ='G' OR ROW ='H' OR ROW = 'J') 
   and num >= 107 and num <=118 and num %2=0
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Left', 'Side', false
   from seatRow, seatNum
   where (row = 'F' or row ='G' OR ROW ='H' OR ROW = 'J') 
   and num >= 107 and num <=118 and num %2=1
   ;
   
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Right', 'Side', false
   from seatRow, seatNum
   where (row = 'K' or row ='L' OR ROW ='M' OR ROW = 'N') 
   and num >= 107 and num <=120 and num %2=0
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Left', 'Side', false
   from seatRow, seatNum
   where (row = 'K' or row ='L' OR ROW ='M' OR ROW = 'N') 
   and num >= 107 and num <=120 and num %2=1
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Right', 'Side', false
   from seatRow, seatNum
   where (row = 'O') 
   and num >= 107 and num <=122 and num %2=0
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Left', 'Side', false
   from seatRow, seatNum
   where (row = 'O') 
   and num >= 107 and num <=122 and num %2=1
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Left', 'Side', false
   from seatRow, seatNum
   where (row = 'P' OR ROW = 'Q' OR ROW = 'R') 
   and num = 108
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Left', 'Side', false
   from seatRow, seatNum
   where (row = 'P' OR ROW = 'Q' OR ROW = 'R') 
   and num = 107
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Left', 'Side', true
   from seatRow, seatNum
   where (row = 'P' OR ROW = 'Q' OR ROW = 'R') 
   and num > 108 AND num <=122 and num %2 =0
   ;
    insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Main Floor', 'Left', 'Side', true
   from seatRow, seatNum
   where (row = 'P' OR ROW = 'Q' OR ROW = 'R') 
   and num > 108 AND num <=122 and num %2 =1
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Balcony', 'Middle', 'Orchestra', false
   from seatRow, seatNum
   where (row = 'AA') 
   and num >=1  AND num <=13
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Balcony', 'Middle', 'Orchestra', false
   from seatRow, seatNum
   where (row = 'BB' OR ROW = 'CC' OR ROW = 'DD') 
   and num >=1  AND num <=14
   ;
   
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Balcony', 'Middle', 'Upper Balcony', false
   from seatRow, seatNum
   where (row = 'EE' OR ROW = 'FF') 
   and num >=1  AND num <=10
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Balcony', 'Middle', 'Upper Balcony', false
   from seatRow, seatNum
   where (row = 'GG' OR ROW = 'HH') 
   and num >=1  AND num <=11
   ;
   
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Balcony', 'Right', 'Upper Balcony', false
   from seatRow, seatNum
   where (row = 'EE' OR ROW = 'FF') 
   and num >=102  AND num <=122 and num % 2 =0
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Balcony', 'Left', 'Upper Balcony', false
   from seatRow, seatNum
   where (row = 'EE' OR ROW = 'FF') 
   and num >=102  AND num <=122 and num % 2 =1
   ;
   
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Balcony', 'Right', 'Upper Balcony', false
   from seatRow, seatNum
   where (row = 'GG') 
   and num >=102  AND num <=120 and num % 2 =0
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Balcony', 'Left', 'Upper Balcony', false
   from seatRow, seatNum
   where (row = 'GG') 
   and num >=102  AND num <=120 and num % 2 =1
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Balcony', 'Right', 'Upper Balcony', false
   from seatRow, seatNum
   where (row = 'HH') 
   and num >=102  AND num <=118 and num % 2 =0
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Balcony', 'Left', 'Upper Balcony', false
   from seatRow, seatNum
   where (row = 'HH') 
   and num >=102  AND num <=118 and num % 2 =1
   ;
   
  insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Balcony', 'Right', 'Upper Balcony', false
   from seatRow, seatNum
   where (row = 'AA' OR ROW = 'BB' OR ROW = 'CC') 
   and num >=102  AND num <=125 AND num %2 = 0
   ;
   
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Balcony', 'Left', 'Upper Balcony', false
   from seatRow, seatNum
   where (row = 'AA' OR ROW = 'BB' OR ROW = 'CC') 
   and num >=101  AND num <=125 AND num %2 = 1
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Balcony', 'Left', 'Upper Balcony', false
   from seatRow, seatNum
   where (row = 'DD' ) 
   and num >=101  AND num <=125 AND num %2 = 1
   ;
   insert into seat(seatRow, seatNumber, section, side, PricingTier, Wheelchair)
   select seatRow.row, seatNum.num, 'Balcony', 'Right', 'Upper Balcony', false
   from seatRow, seatNum
   where (row = 'DD' ) 
   and num >=101  AND num <=126 AND num %2 = 0
   ;
   
   insert into Customer(CustomerID,FirstName, LastName )
   Values(1234, 'Mike', 'Johnson')
   ;
   
   insert into Private.Customer(CustomerID,creditCard )
   Values(1234, 1234567887654321)
   ;
   
   
   
   insert into Ticket(CustomerID, SeatRow,SeatNumber,ShowTime)
   Values(1234, 'A', 6, '2017-12-15 14:00:00');
   
   insert into Ticket(CustomerID, SeatRow,SeatNumber,ShowTime)
   Values(1234, 'A', 8, '2017-12-15 14:00:00');
  
  insert into Ticket(CustomerID, SeatRow,SeatNumber,ShowTime)
   Values(1234, 'A', 10, '2017-12-15 14:00:00');
   
   insert into Ticket(CustomerID, SeatRow,SeatNumber,ShowTime)
   Values(1234, 'A', 9, '2017-12-15 14:00:00');
  
    -- select * from seat ORDER by seatNumber;
     -- select * from seat ORDER by seatRow;
    -- select * from seat;
    
    
   
     select Ticket.ticketnumber, ticket.customerid, ticket.seatrow, ticket.seatnumber, ticket.showtime, private.customer.creditcard
     from Ticket
     join private.customer
     on Ticket.customerID = private.Customer.customerID
     ;
    -- select * from seatNum;
    