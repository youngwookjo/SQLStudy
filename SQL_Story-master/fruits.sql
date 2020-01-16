
/* Drop Tables */

DROP TABLE Fruit CASCADE CONSTRAINTS;
DROP TABLE cost CASCADE CONSTRAINTS;



/* Create Tables */

CREATE TABLE Fruit
(
   fruit_no number PRIMARY KEY,
   fruit_name varchar2(15) NOT NULL,
   fruit_stock number NOT NULL,
   fruit_price number NOT NULL,
   fruit_cost number,
   fruit_discount number(2,2)
);

insert into fruit (fruit_no, fruit_name, fruit_stock, fruit_price) values (1, 'water melon', 100, 15000);
insert into fruit (fruit_no, fruit_name, fruit_stock, fruit_price) values (2, 'apple', 1000, 1000);
insert into fruit (fruit_no, fruit_name, fruit_stock, fruit_price) values (3, 'banana', 300, 3000);
insert into fruit (fruit_no, fruit_name, fruit_stock, fruit_price) values (4, 'grapes', 350, 5000);
insert into fruit (fruit_no, fruit_name, fruit_stock, fruit_price) values (5, 'plum', 2000, 800);

CREATE TABLE cost AS SELECT fruit_cost FROM fruit where 1 = 0;

insert into cost (fruit_cost) values(8000);
insert into cost (fruit_cost) values(150);
insert into cost (fruit_cost) values(800);
insert into cost (fruit_cost) values(3500);
insert into cost (fruit_cost) values(200);

ALTER TABLE fruit
	ADD CONSTRAINT check_fruit_stock
  	CHECK (fruit_stock between 0 and 10000);
 
commit;

  	