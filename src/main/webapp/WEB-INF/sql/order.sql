-- 밑에 order table을 만드려면 cart 필요.

CREATE TABLE cart(
	cartno		NUMBER(10)		NOT NULL	PRIMARY KEY,
	ID			VARCHAR2(10)	NULL ,
	FOREIGN KEY (ID) REFERENCES member (ID)
);

-- 추가한 
CREATE TABLE cart(
	cartno		NUMBER(10)		NOT NULL	PRIMARY KEY,
	ID			VARCHAR2(10)	NULL ,
	contentsno	NUMBER(10)  NULL ,
	amount		NUMBER(10)  NULL ,
	FOREIGN KEY (ID) REFERENCES member (ID)
);

COMMENT ON TABLE cart is '장바구니';
COMMENT ON COLUMN cart.cartno is '장바구니번호';
COMMENT ON COLUMN cart.id is '아이디';


ALTER TABLE cart ADD contentsno NUMBER(10)  NULL;
ALTER TABLE cart ADD amount NUMBER(10)  NULL;

COMMENT ON COLUMN cart.contentsno is '상품번호 ';
COMMENT ON COLUMN cart.amount is '수량';

ALTER TABLE cart
ADD CONSTRAINTS contentsno FOREIGN KEY (contentsno) 
REFERENCES contents(contentsno);


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

select COUNT(*)
from member inner join cart 		
on member.id = cart.id	 inner join orders		
on cart.id = orders.id		
where member.id = 'user2';	


select member.id, cart.CARTNO, orders.ORDERNO, orders.CONTENTSNO, 
orders.QUANTITY, orders.PNAME, orders.total, contents.FILENAME, contents.DETAIL
from member inner join cart 		
on member.id = cart.id	 inner join orders		
on cart.id = orders.id	inner JOIN CONTENTS
ON contents.CONTENTSNO = cart.CONTENTSNO 
where member.id = 'user1';	



select COUNT(*) 
from cart
where id = 'user2' AND contentsno = 1;	

--#{amount}
UPDATE CART SET amount = 1
where id = 'user2' 
AND contentsno = 1;	

SELECT member.id, cart.CARTNO, cart.CONTENTSNO, contents.PNAME, 
		contents.FILENAME, contents.DETAIL, contents.PRICE 
FROM MEMBER INNER JOIN cart
ON member.id = cart.id INNER JOIN CONTENTS
ON contents.CONTENTSNO = cart.CONTENTSNO
WHERE member.id = 'user1';


select constraint_name, table_name, r_constraint_name
from user_constraints
where constraint_name = 'SYS_C0028323';


UPDATE orders
SET cartno = NULL
where contentsno = 15;

SELECT *
FROM cart
WHERE contentsno = 15;

DELETE FROM cart
WHERE cartno = 2;


SELECT member.id, member.mname, contents.pname, cart.CONTENTSNO 
		FROM cart INNER JOIN member
		ON member.id = cart.id INNER JOIN contents
		ON contents.contentsno = cart.contentsno
		WHERE member.id = 'user1';


select contentsno, cateno, pname, price, filename, stock,  r
from (
    select contentsno, cateno, pname, price, filename, stock, rownum r
    from(
        select contentsno, cateno,pname, price, filename, stock
        from contents
         
        where pname like '%Jean%'
 
        and cateno = 1
       
        order by contentsno desc
    )
 
)where r >= 1 and r <= 5;
