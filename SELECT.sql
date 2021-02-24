< 기본 검색 >
SELECT [ALL | DISTINCT] 속성1 [AS X], 속성2 [AS Y],.. 
FROM 테이블1;

* : 모든 속성의 의미로 속성1, 2.. 대신에 *를 사용할 수 있다.
ALL : 튜플 중복 허용.(디폴트)
DISTINCT : 튜플 중복 제거.
AS : 별칭 부여. 속성의 이름을 다른 이름으로 바꾸어 출력한다.

※ 산술식을 이용한 검색
EX) 
SELECT 제품명, 단가 + 500 
FROM 제품;





< 조건 검색 >
SELECT [ALL | DISTINCT ] 속성1, 속성2,.. 
FROM 테이블 
[WHERE 조건];

조건의 위치에는 여러가지 종류가 들어갈 수 있다.

1. 비교 연산자
= : 같다.
<> : 다르다.
< : 작다.
> : 크다.
<= : 작거나 같다.
>= : 크거나 같다.

날짜의 경우, 더 뒤의 날짜가 큰 것.
문자는 더 뒤의 문자가 큰 것.
문자열은 사전 순으로 뒤에 있는 것이 큰 것.
=> 숫자를 제외한 자료형은 ''로 묶어주어야 한다.

2. 논리 연산자
AND : 모두
OR : 하나만
NOT : 아닌것만

3. LIKE
문자열에서만 사용할 수 있다.
% : 0개 이상의 문자
_ : 한 개의 문자

EX) WHERE 이름 LIKE '_한_';  
EX) WHERE 장소 LIKE '%상암%';

4. NULL
속성 값이 NULL인지 판단.
이름 = NULL 형태로 표현하면 안된다.

이름 IS NULL : NULL인지.
이름 IS NOT NULL : NULL이 아닌지.





< 정렬 검색 >
SELECT [ALL | DISTINCT ] 속성1, 속성2,.. 
FROM 테이블 
[WHERE 조건]
[ORDER BY 속성1 [ASC | DESC], 속성2 [ASC | DESC]];

기준이 되는 속성 지정.
ASC : 오름차순(디폴트)
DESC : 내림차순 

NULL 값은 오름차순일 때는 제일 먼저, 내림차순일 때는 제일 마지막에 정렬된다.

※ 2개 이상의 기준으로 정렬
EX) ORDER BY A ASC, B DESC; // A 기준으로 오름차순으로 정렬 후, A가 같은 경우 B의 내림차순으로 정렬.





< 집계 함수를 이용한 검색 >
NULL인 속성은 제외하고 계산. 
WHERE 절에서는 사용 불가. SELECT 절이나, GROUP BY 사용시 HAVING 절에서만 사용 가능.

COUNT : 개수 
( 총 개수를 셀 때는 COUNT(*)를 써야 함. COUNT(일반 속성명)으로 사용할 경우 NULL은 포함되지 않기 때문이다. )
( 특정 속성값의 중복을 없앨 때는 SELECT COUNT(DISTINCT 제조업체) 로 사용. )

MAX : 최댓값
MIN : 최솟값
SUM : 합계(숫자만 가능)
AVG : 평균(숫자만 가능)

EX) 
SELECT AVG(단가) 
FROM 제품;





< 그룹별 검색 >
SELECT [ALL | DISTINCT] 속성1, 속성2,.. 
FROM 테이블 
[WHERE 조건]
[GROUP BY 속성1, 속성2 [HAVING 조건]]
[ORDER BY 속성1, 속성2 [ASC | DESC]]

GROUP BY 속성에 여러개가 나오면, 그 여러개를 하나의 키로 간주.
GROUP BY를 사용할 때는 SELECT 절에 집계함수, GROUP BY 절에 있는 속성 외에는 사용할 수 없다.
GROUP BY를 사용할 때 사용하는 속성값이 NULL인 것은 NULL인 것 끼리 합쳐버린다. 따라서 NULL인 집합은 배제하기 위해서는 그 위 줄에 EX) WHERE NAME IS NOT NULL 을 작성해야 한다.
                    
[ 처리 순서 ]
FROM -> WHERE -> GROUP BY -> ORDER BY -> SELECT

EX) 
SELECT COUNT(*), MAX(단가) 
FROM 제품 
GROUP BY 제조업체 HAVING COUNT(*) >= 3;





< 여러 테이블에 대한 조인 검색 >
테이블을 연결해주는 조인속성이 필요.
일반적으로 테이블의 관계를 나타내는 외래키를 조인속성으로 사용.

FROM 절에 검색에 필요한 모든 테이블을 나열하고, WHERE 절에 조인 속성의 값이 같아야함을 제시한다.

EX) 
SELECT 제품, 제품명 
FROM 제품, 주문 
WHERE 주문.주문고객 = 'BANANA' AND 제품.제품번호 = 주문.주문제품;





< 부속 질의문을 이용한 검색 >
부속질의문은 괄호()로 묶어 작성하고, ORDER BY 사용 불가.

IN : 결과 값 중 일치하는 겂이 있으면 참
NOT IN : 결과 값 중 일치하는 것이 없으면 참
ALL : 모두와 비교한 결과가 참이면 참
ANY : 하나라도 비교한 결과가 참이면 참

EX) 
SELECT 제품명, 제조업체 
FROM 제품 
WHERE 제품번호 NOT IN (
                SELECT 주문제품 
                FROM 주문 
                WHERE 주문고객 = 'BANANA');

EX)
SELECT 제품명, 제조업체
FROM 제품
WHERE 단가 > ALL (
                SELECT 단가
                FROM 제품
                WHERE 제조업체 = '대한식품');
   




< LIMIT 검색 >
SELECT 속성
FROM 테이블
[WHERE 조건]
LIMIT 개수;

EX) LIMIT 2 : 위에서부터 2개만 출력.
EX) LIMIT 2, 5 : 3번째 줄부터 5개(3 ~ 7) 
