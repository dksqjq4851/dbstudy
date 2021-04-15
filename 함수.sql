desc dual;
select dummy from dual;

select round(123.4567, 2) from dual;
select round(123.4567, 1) from dual;
select round(123.4567, 0) from dual;
select round(123.4567, -1) from dual;
select round(123.4567, -2) from dual;


--����
select trunc(567.7878, 2) from dual;


--2)�ø��Լ�
-- ceil �����οø�
--�ڸ��� ������ ����� ���ؼ� ó���մϴ�.
select ceil(123.4567) from dual;

--(1) �Ҽ� �ڸ��� 2�ڸ��� �ø�
--100�� ���Ѵ�. -> cile()ó���Ѵ� -> 100���� ������

--(2) �Ҽ� �ڸ��� 1�ڸ��� �ø�
--10�� ���Ѵ�. -> cile()ó���Ѵ� -> 10���� ������
select (ceil(123.4567 * 100))/100 from dual;
select (ceil(123.4567 * 10))/10 from dual;


--(3) ���� �ڸ��� �ø�
--10�� -1������ ���Ѵ�. -> ceil()ó���Ѵ� -> 10�� -1�������� ������.
select ceil(123.4567 * 0.1)/0.1 from dual;
--3)�����Լ�
--floor(��) : ������ ����
--ceil()�� ���� ������� ����մϴ�.
select floor(567.8989 *100)/100 from dual;
select floor(567.8989 *1)/1 from dual;
select floor(567.8989) from dual;

--������ ������ ���̴� �ִ�.
--�������� ���̰� �߻��Ѵ�.
select floor(-1.5) from dual;
select trunc(-1.5) from dual;

--5. ��ȣ �Ǻ�

--sign ��
--���� �礵�Ӥ� 1
--���� �����̸� -1
--���� 0�̸� 0
select sign(5) from dual;
select sign(0) from dual;
select sign(-5) from dual;

--7)������
--mod(a,b) a�� b �� ���� ������
select mod(7,2) from dual;
--8)����
--power(a,b): a�� b����
select power(10,2) from dual;
select power(10,1) from dual;
select power(10,0) from dual;
select power(10,-1) from dual;
select power(10,-2) from dual;
--4.��¥ �Լ�
--1)���� ��¥
--sysdate(Ÿ���� date)
select sysdate from dual;
--2)���糯¥(Ÿ���� timestamp)
--systimestamp
select systimestamp from dual;

--3) ����Ͻú��� ����
--extract(���� from ��¥)
select extract(year from sysdate) as ����⵵ ,
        extract(month from sysdate) as ����� ,
        extract(day from sysdate) as ������ ,
        extract(hour from systimestamp) as ����ð� ,
        extract(minute from systimestamp) as ����� ,
        extract(second from systimestamp) as ������ 


from dual;


--4) ��¥ ����(����, ����)
--1�� : ���� 1
-- 12�ð� : ���� 0.5
select sysdate + 1 as ����,
         sysdate - 1 as ����,
         sysdate + 0.5 as ���νð���
         
    from dual;
    
--5) ���� ����
--add_minths(��¥,n) : n������
select add_months(sysdate, 3 )as �ﰳ����,
        add_months(sysdate ,-3)as �ﰳ����
from dual;
--month_between(��¥1, ��¥2) : �� ��¥ ���� ����� ������

--5. �� ��ȯ �Լ�
--1)��¥ �Ť�ȯ �Լ�
-- to_date(���ڿ�, [����])
select to_date('2021-04-01'),
        to_date('2021/04/01'),
        to_date('2021/01/04', 'yyyy/dd/mm'),
        to_date('0401, 21','mmdd, yy')
        
from dual;

--2)���� ��ȯ �Լ�
--to_number(���ڿ�)
select to_number('100')from dual;
select name, kor
from score where kor >= '50';--���������� where kor >= to_number('50'); ó���˴ϴ�.
--3)���ڿ� ��ȯ �Լ�
--to_char(��, [����])
--(1) ���� ����
select to_char(123),
        to_char(123, '9999999'),
        to_char(123, '0000000')
    from dual;
    
--(2)��¥ ����
select to_char(sysdate, 'yyyymmdd') from dual;

--4 ��Ÿ�Լ�
--1)nulló�� �Լ�
select * from score;
update score set for = null where trim(name) = 'JADU';

SELECT kor, nvl(kor, 0) from score;

select avg(kor) as ���1,
        avg(nvl(kor, 0)) as ���2
        
from score;

--2)nvl2(��, ����null�ƴҶ�, ���� null�϶�)
select nvl2(kor, eng + mat, kor +eng + mat) from score;

--2)�б��Լ�
--decode(ǥ����, ����1, ���1,���ä�2, ���2,...,_
select decode('����',
                '��', '�ɳ���',
                '����','������',
                '����','��ǳ����',
                '�ܿ�','���ο�') as ����������
from dual;

--3)�б� ǥ����
--case ǥ����
--when �񱳽� then �����
--
--else ���������
--end;
--case ���
-- when >= 90 then 'a����'
select name,
        (nvl(kor, 0 ) + eng + mat)/3  as ���,
        (case 
        when (nvl(kor, 0 ) + eng + mat)/3 >= 90 then 'a����'
        when (nvl(kor, 0 ) + eng + mat)/3 >= 80 then 'b����'
        when (nvl(kor, 0 ) + eng + mat)/3 >= 70 then 'c����'        
        when (nvl(kor, 0 ) + eng + mat)/3 >= 60 then 'd����'
        else 'f����'
        end) as ����
    from score;


