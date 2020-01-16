/* 3번 문제 
 * 3-1. 재고(fruit_stock)를 더해주는 purchaseFruit, 판매하는 sellFruit을 구현한다.
 * 3-2. Fruit 테이블에 fruit_stock이 0 ~ 10000 이어야 하는 제한 조건을 넣고 이를 어겼을 시 호출되는 EXCEPTION 처리를 추가해 준다.
 */

/* sellFruit */
create or replace procedure sellFruit(
	f_no fruit.fruit_no%type, f_sell number)
is
	CHECK_CONSTRAINT_VIOLATED EXCEPTION;
	PRAGMA EXCEPTION_INIT(CHECK_CONSTRAINT_VIOLATED, -2290);
begin
	update fruit set fruit_stock = fruit_stock - f_sell
	where fruit_no = f_no;
	exception
		when CHECK_CONSTRAINT_VIOLATED then
			DBMS_OUTPUT.PUT_LINE('재고가 없습니다');
		when OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Something else went wrong - ');
end;
/

/* purchaseFruit */
create or replace procedure purchaseFruit(
	f_no fruit.fruit_no%type, f_number number)
is
	CHECK_CONSTRAINT_VIOLATED EXCEPTION;
	PRAGMA EXCEPTION_INIT(CHECK_CONSTRAINT_VIOLATED, -2290);
begin
	update fruit set fruit_Stock = fruit_stock + f_number
	where fruit_no = f_no;
   	exception
		when CHECK_CONSTRAINT_VIOLATED then
			DBMS_OUTPUT.PUT_LINE('재고가 너무 많습니다.');
		when OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Something else went wrong - ');
end;
/