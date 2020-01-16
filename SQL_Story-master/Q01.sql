/* 1�� ���� 
 * 1-1. backupCost���� updateFruitCost�� �����Ͽ� cost���̺� ����� fruit_cost �÷��� �����͸� fruit ���̺��� fruit_cost �÷��� update�Ѵ�.
 * 1-2. getBestFruit�� ���ͷ��� ���� ���� ������ fruit_no�� ��ȯ �ް�, �� ���� getFruit�� �Է��� �ش��ϴ� ������ ��� ������ ��¹޴´�.  <getFruit ������ ���� array ����>
 * ==> ���� procedure q01 ����. 
 */

/*drop procedures*/
DROP PROCEDURE updateFruitCost
DROP PROCEDURE backupCost
DROP function getBestFruit
DROP type dataArray
DROP function getFruit
DROP PROCEDURE q01

/*updateFruitCost*/
create or replace procedure updateFruitCost(
	f_no fruit.fruit_no%type, f_cost fruit.fruit_cost%type)
is
begin
	update fruit set fruit_cost = f_cost
	where fruit_no = f_no;
end;
/

/*backupCost*/
create or replace procedure backupCost
is
	no number;
	cursor f_cost
	is
	select * from cost;
begin
	no := 1;
	for cost_data in f_cost loop
		updateFruitCost(no, cost_data.fruit_cost);
		no := no + 1;
	end loop;
end;
/

/*getBestFruit*/
create or replace function getBestFruit
return varchar2
is
	f_no fruit.fruit_no%type;
begin
	select fruit_no
		into f_no
	from fruit
	where (fruit_price - fruit_cost)/fruit_cost = (
		select max((fruit_price - fruit_cost)/fruit_cost)
		from fruit);
	return f_no;
end;
/

/*dataArray*/
create or replace type dataArray
as varray(6) of varchar2(15);
/

/*getFruit*/
create or replace function getFruit(f_no fruit.fruit_no%type)
return varchar2
is
	f_no2 fruit.fruit_no%type;
	f_name fruit.fruit_name%type;
	f_stock fruit.fruit_stock%type;
	f_price fruit.fruit_price%type;
	f_cost fruit.fruit_cost%type;
	f_discount fruit.fruit_discount%type;
	
	aFruit dataArray;
	returnFruit varchar2(100);
begin
	select fruit_no, fruit_name, fruit_stock, fruit_price, fruit_cost, fruit_discount
		into f_no2, f_name, f_stock, f_price, f_cost, f_discount
	from fruit
	where fruit_no = f_no;
	
	aFruit := dataArray(f_no, f_name, f_stock, f_price, f_cost, f_discount);
	returnFruit := aFruit(1) || ' ' || aFruit(2) || ' ' || aFruit(3) ||
					' ' || aFruit(4) || ' ' || aFruit(5) || ' ' || aFruit(6);
					
	return returnFruit;
end;
/

/*���� procedure*/
create or replace procedure q01
is
	f_fruit varchar2(100);
begin
	backupCost;
	f_fruit := getFruit(getBestFruit);
	dbms_output.put_line('���ͷ��� ���� ���� ������: ' || f_fruit);
end;
/

/* ���� */
exec q01;
