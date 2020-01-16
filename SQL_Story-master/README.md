# SQL_Story

## 개요
PLSQL에 대해 학습하고 그에 대하여 실습하고자

PLSQL을 활용한 시나리오를 만들고 배웠던 내용들을 이용하여 SQL 문장들을 만들었다

### 문제예시

** 수경청과의 영욱사장님과 동성사원

0. 과일 정보

1. 친절한 영욱 사장님은 동성 사원에게 가장 수익률이 높은 과일을 알려달라고 하셨다.
   이 때 다음과 같은 상황이 발생 하였다.

   1-1. 수익률을 구하던 중 과일의 원가컬럼이 모두 사라졌다. 다행히 원가항목은 cost라는 백업 테이블을 갖고 있었다.
		동성사원은 사장님이 아시기 전에 fruit 테이블 원가(fruit_cost)컬럼에 값을 채워 넣어야 한다.

   1-2. 허겁지겁 원가컬럼을 채운 동성사원을 돕기 위해 수익률이 가장 높은 과일을 찾고 해당 과일의 모든 정보를 출력해주는 프로시저를 개발하시오.


2. 영욱 사장님은 과일의 재고가 너무 많이 남은 과일에 대하여 할인을 지시하셨다.

   2-1. 재고가 100개 이상인 과일을 찾으시오.

   2-2. 해당과일들의 할인율(fruit_discount) 0.5로 update 하시오.

3. 꼼꼼하신 영욱 사장님은 모든 과일의 재고가 0~10,000 사이에서 유지되길 바라신다.
	판매 procedure sellFruit, 구매 procedure purchaseFruit을 구현하고, 각각
	판매시 재고가 -1 이하로, 구매시 10,000 이상으로 변경될 때의 예외처리를 구현하시오.