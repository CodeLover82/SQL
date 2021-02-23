< 기본 검색 >
SELECT [ALL | DISTINCT] 속성1 [AS X], 속성2 [AS Y],.. from 테이블1;

* : 모든 속성의 의미로 속성1, 2.. 대신에 *를 사용할 수 있다.
ALL : 튜플 중복 허용.(디폴트)
DISTINCT : 튜플 중복 제거.
AS : 별칭 부여. 속성의 이름을 다른 이름으로 바꾸어 출력한다.

※ 산술식을 이용한 검색
EX) SELECT 제품명, 단가 + 500 FROM 제품;





< 조건 검색 >
SELECT [ALL | DISTINCT ] 속성1, 속성2,.. from 테이블 [WHERE 조건];

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


            




            
            종이, 책, 밑에 문장들, 문제에서 나온거



ORDER BY 속성 : 해당 속성의 오름차순으로 정렬.
ORDER BY 속성 DESC : 해당 속성의 내림차순으로 정렬.

비교연산자 <> 다르다 => 문자열, 정수 상관없이

A로 정렬후 , 같은경우 B로 정렬 하기
ORDER BY A ASC, B DESC; ( 디폴트 오름차순)


MySQL은 limit을 걸어 추출한다.

limit 3, 7 : 위에서 3부터 7까지의 정보 추출
limit 5 : 위에서 5개의 정보 추출

