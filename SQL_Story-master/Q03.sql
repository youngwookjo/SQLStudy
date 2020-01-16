/* 3�� ���� 
 * 3-1. ���(fruit_stock)�� �����ִ� purchaseFruit, �Ǹ��ϴ� sellFruit�� �����Ѵ�.
 * 3-2. Fruit ���̺� fruit_stock�� 0 ~ 10000 �̾�� �ϴ� ���� ������ �ְ� �̸� ����� �� ȣ��Ǵ� EXCEPTION ó���� �߰��� �ش�.
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
			DBMS_OUTPUT.PUT_LINE('��� �����ϴ�');
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
			DBMS_OUTPUT.PUT_LINE('��� �ʹ� �����ϴ�.');
		when OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Something else went wrong - ');
end;
/