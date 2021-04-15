desc dual;
select dummy from dual;

select round(123.4567, 2) from dual;
select round(123.4567, 1) from dual;
select round(123.4567, 0) from dual;
select round(123.4567, -1) from dual;
select round(123.4567, -2) from dual;


--절사
select trunc(567.7878, 2) from dual;


--2)올림함수
-- ceil 정수로올림
--자릿수 조정을 계산을 통해서 처리합니다.
select ceil(123.4567) from dual;

--(1) 소수 자릿수 2자리로 올림
--100을 곱한다. -> cile()처리한다 -> 100으로 나눈다

--(2) 소수 자릿수 1자리로 올림
--10을 곱한다. -> cile()처리한다 -> 10으로 나눈다
select (ceil(123.4567 * 100))/100 from dual;
select (ceil(123.4567 * 10))/10 from dual;


--(3) 십의 자리로 올림
--10의 -1제곱을 곱한다. -> ceil()처리한다 -> 10의 -1제곱으로 나눈다.
select ceil(123.4567 * 0.1)/0.1 from dual;
--3)내림함수
--floor(값) : 정수로 내림
--ceil()와 같은 방식으로 사용합니다.
select floor(567.8989 *100)/100 from dual;
select floor(567.8989 *1)/1 from dual;
select floor(567.8989) from dual;

--내림과 절사의 차이는 있더.
--음수에서 차이가 발생한다.
select floor(-1.5) from dual;
select trunc(-1.5) from dual;

--5. 부호 판별

--sign 값
--값이 양ㅅ임ㄴ 1
--값이 음수이면 -1
--값이 0이면 0
select sign(5) from dual;
select sign(0) from dual;
select sign(-5) from dual;

--7)나머지
--mod(a,b) a를 b 로 나눈 나머지
select mod(7,2) from dual;
--8)제곱
--power(a,b): a의 b제곱
select power(10,2) from dual;
select power(10,1) from dual;
select power(10,0) from dual;
select power(10,-1) from dual;
select power(10,-2) from dual;
--4.날짜 함수
--1)현재 날짜
--sysdate(타입이 date)
select sysdate from dual;
--2)현재날짜(타입이 timestamp)
--systimestamp
select systimestamp from dual;

--3) 년월일시분초 추출
--extract(단위 from 날짜)
select extract(year from sysdate) as 현재년도 ,
        extract(month from sysdate) as 현재월 ,
        extract(day from sysdate) as 현재일 ,
        extract(hour from systimestamp) as 현재시간 ,
        extract(minute from systimestamp) as 현재분 ,
        extract(second from systimestamp) as 현재초 


from dual;


--4) 날짜 연산(이전, 이후)
--1일 : ㅅ자 1
-- 12시간 : 숫자 0.5
select sysdate + 1 as 내일,
         sysdate - 1 as 어제,
         sysdate + 0.5 as 열두시간후
         
    from dual;
    
--5) 개월 연산
--add_minths(날짜,n) : n개월후
select add_months(sysdate, 3 )as 삼개월후,
        add_months(sysdate ,-3)as 삼개월전
from dual;
--month_between(날짜1, 날짜2) : 두 날짜 사이 경과한 개월수

--5. 형 변환 함수
--1)날짜 ㅕㄴ환 함수
-- to_date(문자열, [형식])
select to_date('2021-04-01'),
        to_date('2021/04/01'),
        to_date('2021/01/04', 'yyyy/dd/mm'),
        to_date('0401, 21','mmdd, yy')
        
from dual;

--2)숫자 변환 함수
--to_number(문자열)
select to_number('100')from dual;
select name, kor
from score where kor >= '50';--내부적으로 where kor >= to_number('50'); 처리됩니다.
--3)문자열 변환 함수
--to_char(값, [형식])
--(1) 숫자 형식
select to_char(123),
        to_char(123, '9999999'),
        to_char(123, '0000000')
    from dual;
    
--(2)날짜 형식
select to_char(sysdate, 'yyyymmdd') from dual;

--4 기타함수
--1)null처리 함수
select * from score;
update score set for = null where trim(name) = 'JADU';

SELECT kor, nvl(kor, 0) from score;

select avg(kor) as 평균1,
        avg(nvl(kor, 0)) as 평균2
        
from score;

--2)nvl2(값, 값이null아닐때, 값이 null일때)
select nvl2(kor, eng + mat, kor +eng + mat) from score;

--2)분기함수
--decode(표현식, 조건1, 결과1,조ㅓㄴ2, 결과2,...,_
select decode('가을',
                '봄', '꽃놀이',
                '여름','물놀이',
                '가을','단풍놀이',
                '겨울','눈싸움') as 계절별놀이
from dual;

--3)분기 표현식
--case 표현식
--when 비교식 then 결과값
--
--else 나머지경우
--end;
--case 평균
-- when >= 90 then 'a학점'
select name,
        (nvl(kor, 0 ) + eng + mat)/3  as 평균,
        (case 
        when (nvl(kor, 0 ) + eng + mat)/3 >= 90 then 'a학점'
        when (nvl(kor, 0 ) + eng + mat)/3 >= 80 then 'b학점'
        when (nvl(kor, 0 ) + eng + mat)/3 >= 70 then 'c학점'        
        when (nvl(kor, 0 ) + eng + mat)/3 >= 60 then 'd학점'
        else 'f학점'
        end) as 학점
    from score;


