/* 2�� ���� 
 * 2-1. fruit ���̺� �ִ� ��� ��(fruit_stock)�� �ҷ����� getStock function�� ���ϴ� ������ �������� �����ϴ� updateFruitDR procedure�� �����.
 * 		(�� ��� fruit_no�� parameter�� �޴´�.)
 * 2-2. isOverStock(no) procedure�� ���� ������ no�� �ʰ��ϴ� ������ ������ 50%�� �����Ѵ�.  
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

/* ���� */
exec isOverStock(500);