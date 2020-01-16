/* 2번 문제 
 * 2-1. fruit 테이블에 있는 재고 값(fruit_stock)을 불러오는 getStock function과 원하는 과일의 할인율을 조정하는 updateFruitDR procedure를 만든다.
 * 		(둘 모두 fruit_no를 parameter로 받는다.)
 * 2-2. isOverStock(no) procedure를 통해 재고수가 no를 초과하는 과일은 할인율 50%를 적용한다.  
 */


/*getStock*/
create or replace function getStock(
   f_no fruit.fruit_no%type)
return number
is
   f_stock fruit.fruit_Stock%type;
begin
   select fruit_stock
      into f_stock
   from fruit
   where fruit_no = f_no;
   
   return f_stock;
end;
/

/*updateFruitDR*/
create or replace procedure updateFruitDR(
	f_no fruit.fruit_no%type, f_discount fruit.fruit_discount%type)
is
begin
	update fruit set fruit_discount = f_discount
	where fruit_no = f_no;
end;
/

/*isOverStock*/
create or replace procedure isOverStock(over fruit.fruit_stock%type)
is
	f_stock fruit.fruit_stock%type;
begin
	for no in 1..5 loop
		f_stock := getStock(no);
		if(f_stock > over) then
			updateFruitDR(no, 0.5);
		end if;
	end loop;
end;
/		

/* 실행 */
exec isOverStock(500);