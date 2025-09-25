-- ������ (��������)  : �ΰ��� ������ ���� ��� AND, OR
-- AND => ����, �ΰ��� ���� ���ÿ� true
-- ������ SALESMAN�̰� �޿��� 1500�̻��� ����� ��� ���� ���
/*
SELECT *
FROM emp
WHERE job = 'SALESMAN' AND sal >=1500;

-- 81�⿡ �Ի��� ��� ����� ���� ���
SELECT *
FROM emp
WHERE hiredate >= '81/01/01' AND hiredate <= '81/12/31';

SELECT *
FROM emp
WHERE hiredate LIKE '81%';

SELECT *
FROM emp
WHERE SUBSTR(hiredate,1,2)='81';

-- OR : ���߿� �Ѱ��̻��� true�϶� ó��
-- ������ MANAGER / CLERK�� ����� ��� ���� ���
SELECT *
FROM emp
WHERE job = 'MANAGER' OR job = 'CLERK';
*/
------------------------------------------------------------------------
-- ����Ŭ���� �����ϴ� ������
-- BETWEEN ~ AND : �Ⱓ, ���� => �ڹ� : ����Ⱓ, üũ�αⰣ, ����¡...)
-- >= AND <=
/*
- �޿��� 1000~3000������ ����� ��� ���� ���
SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 3000;

-- 80�⵵ �Ի��� ��� ����� ���� ���
SELECT *
FROM emp
WHERE hiredate BETWEEN '80/01/01' AND '80/12/31';

-- 5���� ���
SELECT empno, ename, job, hiredate, rownum
FROM emp
WHERE rownum BETWEEN 1 AND 5;

-- IN => OR�� �������� ��� ���
-- deptno(�μ���ȣ) 10,20,30�� ���
SELECT *
FROM emp
WHERE deptno = 10 OR deptno = 20 OR deptno = 30;

-- WHERE �÷��� IN(��)
SELECT *
FROM emp
WHERE deptno IN(10,20,30);

-- ���� -> ���� ���� �˻� : <imput type=checkbox>, ��¥(���ڿ�)
-- KING, ADAMS, SCOTT, FORD, MARTIN
SELECT *
FROM emp
WHERE ename = 'KING' OR ename = ' ADAMS' OR ename = 'SCOTT' OR ename = 'FORD' OR ename = 'MARTIN';

SELECT *
FROM emp
WHERE ename IN('KING', 'ADAMS', 'SCOTT', 'FORD', 'MARTIN');

-- NOT(����������)
-- job�� MANAGER, CLERK�� �ƴ� ����� ��� ���� ���
SELECT *
FROM emp
WHERE NOT(job='MANAGER' OR job='CLERK');

-- 'KING', 'ADAMS', 'SCOTT', 'FORD', 'MARTIN' ����� �ƴ� ��� ��� ���� ���
SELECT *
FROM emp
WHERE ename NOT IN('KING', 'ADAMS', 'SCOTT', 'FORD', 'MARTIN');

-- 81�⵵�� �Ի����� ���� ����� ��� ���� ���
SELECT *
FROM emp
WHERE hiredate NOT BETWEEN '81/01/01' AND '81/12/31';
-- NOT IN, NOT BETWEEN, NOT LIKE

-- NULL => NULL ���� ���� ���� => ����ó�� �Ұ�
-- ����ó���� ���� ������ ���� => IS NULL, IS NOT NULL
-- ���(mgr)�� ���� ����� ��� ���� ���
SELECT *
FROM emp
WHERE mgr IS NULL;

-- ���(mgr)�� �ִ� ����� ��� ���� ���
SELECT *
FROM emp
WHERE mgr IS NOT NULL;
*/
/*
    LIKE ===> ��ȭ REGEXP_LIKE(ename,'[��-�R]')
      = % : ������ ������ �𸦶� ���(���Ѿ���)
      = _  : �ѱ���

     === �˻�

      = ���� ���ڿ�       : ���ڿ�%   IN%
      = ������ ���ڿ�    : %���ڿ�   %EN
      = ���ԵǴ� ���ڿ� : %EN%
      = ���ڼ��� �˰� �ִ� ��� : _____, __T__
*/
/*
-- ����߿� A �ڷ� �����ϴ� ��� ��� ���� ���
SELECT *
FROM emp
WHERE ename LIKE 'A%';

-- T�ڷ� ������ ��� ����� ���� ���
SELECT *
FROM emp
WHERE ename LIKE '%T';

-- ��� �̸��߿� IN���� �����ų� EN���� ������ ����� ��� ���� ���
SELECT *
FROM emp
WHERE ename LIKE '%IN' OR ename LIKE '%EN'; 

-- ��� �̸� �߿� O�� �����ϰ� �ִ� ����� ��� ���� ���
SELECT *
FROM emp
WHERE ename LIKE '%O%';

-- ��� �̸��߿� A�� �����ϰ� 5������ ����� ��� ���� ���
SELECT *
FROM emp
WHERE ename LIKE 'A____';

-- ����̸��� 5�����̰� ����� O�� ����� ��� ���� ���
SELECT *
FROM emp
WHERE ename LIKE '__O__';
*/
-- BOOK => �౸�� �����ϰ� �ִ� å ���
SELECT *
FROM book
WHERE bookname LIKE '%�౸%';

-- name, type => food
-- �ѽ��� ���Ե� ��� ���� ���
/*
SELECT name,type
FROM food
WHERE type LIKE '%�ѽ�%';

SELECT name,type
FROM food
WHERE type LIKE '%�н�%';
*/

-- address ������ �ִ� ���� ���
SELECT name,type
FROM food
WHERE address LIKE '%����%';

SELECT name,type
FROM food
WHERE address LIKE '%����%';

-- emp : ��� �̸��߿� A,D,K,E,S �� ������ ������� ���
SELECT *
FROM emp
WHERE ename LIKE '%A%' OR ename LIKE '%D%' OR ename LIKE '%K%' OR ename LIKE '%E%' OR ename LIKE '%S%';

SELECT *
FROM emp
WHERE REGEXP_LIKE(ename,'A|D|K|E|S');








