/*********************************/
/* Table Name: 상품분류 */
/**********************************/
CREATE TABLE category(
                cateno                                  NUMBER(10)     NOT NULL,
                catename                              VARCHAR2(50)     NOT NULL,
                categrpno                              NUMBER(10)      NULL,
        PRIMARY KEY (cateno),
        FOREIGN KEY (categrpno) REFERENCES category     
);
 
COMMENT ON TABLE category is '상품분류';
COMMENT ON COLUMN category.cateno is '분류번호';
COMMENT ON COLUMN category.catename is '분류명';
COMMENT ON COLUMN category.categrpno is '상위번호';

insert into category(cateno, catename, categrpno)
values((select nvl(max(cateno),0)+1 from category),
        'Jean', null);
insert into category(cateno, catename, categrpno)
values((select nvl(max(cateno),0)+1 from category),
        'Bag', null);
insert into category(cateno, catename, categrpno)
values((select nvl(max(cateno),0)+1 from category),
        'Shoes', null);
        
select cateno, catename
from category
where categrpno is null;
 
 
/**********************************/
/* Table Name: 컨텐츠 */
/**********************************/
CREATE TABLE contents(
                contentsno                            NUMBER(10)         NOT NULL    PRIMARY KEY,
                cateno                                  NUMBER(10)         NULL ,
                pname                                 VARCHAR2(50)       NOT NULL,
                price                                   NUMBER(10)           NOT NULL,
                filename                                VARCHAR2(100)     NULL ,
                detail                                  CLOB             NOT NULL,
                rdate                                   DATE             NOT NULL,
                stock                                   NUMBER(10)    DEFAULT 0      NOT NULL,
  FOREIGN KEY (cateno) REFERENCES category (cateno)
);
 
COMMENT ON TABLE contents is '컨텐츠';
COMMENT ON COLUMN contents.contentsno is '상품번호';
COMMENT ON COLUMN contents.cateno is '분류번호';
COMMENT ON COLUMN contents.pname is '상품명';
COMMENT ON COLUMN contents.price is '가격';
COMMENT ON COLUMN contents.filename is '상품이미지';
COMMENT ON COLUMN contents.detail is '상세내용';
COMMENT ON COLUMN contents.rdate is '등록일';
COMMENT ON COLUMN contents.stock is '재고량';

insert into contents(contentsno, cateno, pname, price, filename, detail, rdate, stock)
values((select nvl(max(contentsno),0)+1 from contents), 1, 'Ripped Skinny Jeans', 
50000, 'jean.jpg','찢어진 스키니 청바지 입니다.',sysdate,10);
 
select contentsno, cateno, pname, price, filename, detail, stock 
from contents 
where contentsno = 1;
 
update contents
set pname ='Ripped Skinny Jeans2',
    price = 55000,
    filename = 'jean1.jpg',
    detail = '청바지'
where contentsno = 1;
 
delete from contents
where contentsno = 1;
 
select contentsno, cateno, pname, price, filename, stock, r
from (
    select contentsno, cateno, pname, price, filename, stock, rownum r
    from(
        select contentsno, cateno,pname, price, filename, stock
        from contents
        order by contentsno desc
    )
)where r >= 1 and r <= 12;

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
