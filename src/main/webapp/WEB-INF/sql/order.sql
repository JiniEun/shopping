-- 밑에 order table을 만드려면 cart 필요.

CREATE TABLE cart(
	cartno		NUMBER(10)		NOT NULL	PRIMARY KEY,
	ID			VARCHAR2(10)	NULL ,
	FOREIGN KEY (ID) REFERENCES member (ID)
);

COMMENT ON TABLE cart is '장바구니';
COMMENT ON COLUMN cart.cartno is '장바구니번호';
COMMENT ON COLUMN cart.id is '아이디';


drop table orders CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 주문 */
/**********************************/
CREATE TABLE orders(
	orderno                        NUMBER(10)  NOT NULL  PRIMARY KEY,
	id                             VARCHAR2(10)  NOT NULL,
	contentsno                     NUMBER(10)  NULL ,
	cartno                         NUMBER(10)  NULL ,
	odate                          DATE  NOT NULL,
	quantity                       NUMBER(10)  NOT NULL,
	total                          NUMBER(10)  NOT NULL,
	payment                        VARCHAR2(50)  NOT NULL,
	mname                          VARCHAR2(20)  NOT NULL,
	pname                          VARCHAR2(50)  NOT NULL,
  	FOREIGN KEY (contentsno) REFERENCES contents (contentsno),
  	FOREIGN KEY (cartno) REFERENCES cart (cartno)
);
 
insert into orders(orderno, cartno, contentsno, odate, quantity, total, payment, id, mname, pname)
values((select nvl(max(orderno),0)+1 from orders),null,1,sysdate,1,90000,'신용카드',
'user1','개발자1','Mega Ripped Jeans');
 
insert into orders(orderno, cartno, contentsno, odate, quantity, total, payment, id, mname, pname)
values((select nvl(max(orderno),0)+1 from orders),null,10,sysdate,1,33000,'신용카드',
'test','홍길동','Crocodile bag');

 
-- (2) left outer join 문작성

select  m.id, m.mname, m.fname, m.zipcode, m.address1, m.address2,
         o.orderno,o.odate,o.pname,o.quantity,o.total,o.contentsno
 from  member m left outer join orders o
    on  m.id = o.id
where  m.id='user1'; 
-- user1

-- inner join

select *		
from member inner join cart 		
on member.id = cart.id	 inner join orders		
on cart.id = orders.id		
where member.id = 'user1';	

select member.id, cart.CARTNO, orders.ORDERNO, orders.CONTENTSNO, orders.QUANTITY, orders.PNAME, orders.total
from member inner join cart 		
on member.id = cart.id	 inner join orders		
on cart.id = orders.id		
where member.id = 'user1';	

