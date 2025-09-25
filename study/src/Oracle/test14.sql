-- 142p~178p DQL(SELECT �� => �˻�)
/*
    1. SQL : ���ڿ� ����

        1) DQL : ����Ŭ���� ���� ���� ���Ǵ� ���
                     - SELECET 
        2) DML : INSERT / UPDATE / DELETE
        3) DDL : ���̺� ����, �� ����...
                     - CREATE / ALTER(����) / DROP / RENAME
        4) DCL : ������             
                     - GRANT(���Ѻο�) / REVOKE(��������)
        5) TCL : ���� / ���
                     - COMMIT / ROLLBACK
     2. �� ����

        1) SELECT      : ������ ��ȸ
        2) WHERE      : ���� �˻�
        3) GROUP BY : �׷캰 ����
        4) JOIN          : �ٸ� ���̺� ����
        5) SUBQUERY : SQL���� �������� ��Ƽ� �Ѱ��� �������� 
        6) DDL          : ����
        7) DML          : ����
        8) TCL            : Ʈ����� ���� 

     3. ������ �˻�
          SELECT
          ����) 
                  ���̺��� ���� : �÷��� / �������� => DESC table_name
                  --------------------------------------------------
                  SELECT (DISTINCT | ALL)* | ����(column_list) 
                  FROM table_name | view_name | SELECT
                  -------------------------------------------------- �ʼ�
                  [
                        WHERE ���ǹ�(������)
                        GROUP BY => ��� / ���� => ���� ���� ������ �ִ� �÷�, �Լ�
                        HAVING => �׷쿡 ���� ����
                        ORDER BY => ����(� �÷�)      
                  ]
           1) ������

                 - ��������� : - , + , * , / => %(MOD)
                                     / => ����/����=�Ǽ�
                                     + => ������ɸ� ������ �ִ�
                                         => ���ڿ� ���� : ||
                 - �񱳿����� : = , !=(<>) , < , > , <= , >=
                                      => ������������ �ַ� ���
                 - �������� : AND : ���� ����
                                     OR   : �� �߿� �Ѱ� �̻� true
                 - BETWEEN ~ AND : �Ⱓ, ���� ����
                 - IN : OR�� ���� ��쿡 ��ü
                 - NOT : ���� ������
                 - LIKE : �˻��ÿ� �ַ� ���
                            ���ڼ��� ������ ��� : _
                            ���ڼ� ������ : %
                 - NULL : ����ó���� �ȵȴ�
                             IS NULL / IS NOT NULL
           2) �����Լ�

                 - �������Լ� 
                        ���� �Լ�
                               SUBSTR : ���� �ڸ���
                                             => SUBSTR(���ڿ�|�÷�,������ġ,����)
                                             => ����Ŭ�� ���ڹ�ȣ : 1~
                               INSTR    : ������ ��ġ Ȯ��
                                             => INSTR(���ڿ�|�÷�,ã�¹���,������ġ,���°)
                                             => indexOf / lastIndexOF
                                             => ex) ����� ���ʱ�  ~��... -> �ι�° ���� => ~��
                               REPLACE : ����
                                             => REPLACE(����|�÷�,ã�¹���,���湮��)
                                             => �̹���(URL) => &
                               LENGTH : ���� ����
                                             => LENGTH(���ڿ�|�÷�)
                               RPAD : ���ڰ� ������ �������� ���� ��� �ٸ����ڷ� ��ü (���̵� ã��)
                                             => RPAD(����|�÷�),��±��ڼ�,��ü����)              
                        ���� �Լ�
                               MOD : ������
                                             => MOD(10,2) => 10%2
                               ROUND : �ݿø�
                                             => ROUND(�Ǽ�,�ڸ���)
                               CEIL : �ø�
                                             => ��������
                                             => CEIL(�Ǽ�) => �Ҽ��� 1�̻� 
                        ��¥ �Լ�
                               SYSDATE : �ý����� ���� ��¥ / �ð�
                                             => �Խ���, ȸ��, ����, ����...
                               MONTHS_BETWEEN : ������ �Ⱓ�� ���� �� 
                                             => MONTHS_BETWEEN(����,����)
                        ��ȯ �Լ�
                               TO_CHAR : ���ڿ� ��ȯ
                                             => ��¥ ����
                                                     YYYY / RRRR �⵵
                                                     MM             ��
                                                     DD              ��
                                                     HH : HH24    �ð� => ��� / ��������...
                                                     MI               ��
                                                     SS               ��
                                                     DY              ����
                                             => ���� ����
                                                     999,999,999
                        ��Ÿ �Լ�
                               NVL : NULL���� ��� �ٸ� ������ ����
                                             => NVL(�÷�,��ü��)
                                                         ----- NULL�� ��쿡�� ����
                                             => �÷��� ��������, ��ü���� ���������� ��ġ
                 *** �����Լ�, �������Լ��� ���� ��� �Ұ�
                 *** ���� ���ÿ��� GROUP BY
                 - �����Լ�
                        COUNT : ROW�� ����
                                             => COUNT(*) / COUNT(�÷�)
                                                  NULL ����    NULL ����
                                             => �α���, ���̵� ã��, ��ٱ��� ����, �˻� �Ǽ�
                        MAX : ROW��ü �ִ밪
                                             => �ڵ� ������ȣ => CREATE SEQUENCE
                        SUM : ROW�� ����
                        AVG : ROW�� ���
    3. GROUP BY 
          = ���� ���� ���� �÷��� �׷����� ���� �� �׷캰�� ��� => ID / �μ��� / �Ի�⵵ ...

    4. HAVING 

          = GROUP�� ���� ������ ����

    5. ORDER BY
          = ����
          = ORDER BY �÷�|�Լ� ASC|DESC
          = ����
              ORDER BY �÷�, �÷�
                             -----  ----- ���� ���� ������ �ִ� ���
              => ���� / ���� ���ϱ� ...
  ------------------------------------------------------------------------------------------------------------- ���� SELECT
    6. JOIN : �Ѱ� �̻��� ���̺��� �����ؼ� ������ ����
              = ���̺��� ����ȭ�� ���� �������� ������ �۾�

           1) INNER JOIN : ���� ���� ������ �ְų�, �����ϴ� ���
                                 ----------------------- =    --------------- BETWEEN, ��������              
                    => ���帹�� ���Ǵ� JOIN
                    => ����Ŭ JOIN
                              SELECT �÷�(A), �÷�(B)
                              FROM A,B
                              WHERE A.col = B.col
                    => ANSI JOIN

                              SELECT �÷�(A), �÷�(B)
                              FROM A JOIN B
                              ON A.col = B.col

           2) OUTER JOIN : ��������

                              SELECT �÷�(A), �÷�(B)
                              FROM A,B
                              WHERE A.col = B.col(+)
 
                              SELECT �÷�(A), �÷�(B)
                              FROM A,B
                              WHERE A.col(+) = B.col

                              SELECT �÷�(A), �÷�(B)
                              FROM A LEFT OUTER JOIN B
                              ON A.col = B.col   

                              SELECT �÷�(A), �÷�(B)
                              FROM A RIGHT OUTER JOIN B
                              ON A.col = B.col                    

           3) SELF JOIN : �ڽ��� ���̺�(���� ���̺��� ������ ����)
  -------------------------------------------------------------------------------------------------------------
    ���� ���� : ���� ����ȿ� �ٸ� ���� ���� �߰� => �������� SQL ������ �Ѱ��� ����
           ����)
                    MainQuery ������(��������)
                                              ---------- ���� => ����� MainQuery�� 
            ����
               - SQL������ ������ ���� ó��
               - �������� ���� : ������ �ܰ躰�� ������ �ۼ�
               - �ӵ��� ������ (����Ŭ ���� => �ð��� �����ɸ���)
               
            ����
               - SQL ������ ����ϴ� => �м��� ��ƴ�
        ------------------------------------------------------------------------------
         1. ���� => ���������� SELECT �� ����
               ���� => SELECT 
               �������� => SELECT. INSERT, UPDATE, DELETE
              1) ��� ��ġ
                       - SELECT �ڿ�
                              SELECT ename, (SELECT ~) => �÷���� ��� ���� : ��Į�󼭺�����
                       - FROM �ڿ�
                              (SELECT ~) =>���̺� ��� ��� : �ζ��κ�
                               ----------- ����              
                       - WHERE �ڿ� ���ǰ� => ���� ����
                                           ------------------------
                                           **1. ������ �������� => �÷� 1��
                                                     �񱳿����� �ַ� ���
                                           **2. ������ �������� => �÷� 1��
                                                     IN / ANY / SOME / ALL
                                                     IN : �˻��� ��� �� ����
                                                            IN(SELECT DISTINCT deptno FROM emp)
                                                            IN(10, 20, 30)
                                                     > ANY(SOME)   
                                                            ANY(SELECT DISTINCT deptno FROM emp)
                                                            >ANY(10, 20, 30) => 10�� ���� => �ּҰ� ����
                                                     < ANY(SOME)
                                                            <ANY(10, 20, 30) => 30 ���� => �ִ밪 ����
                                                     > ALL
                                                             >ALL(10, 20, 30) => 30 ���� => �ִ밪 ����
                                                     < ALL  
                                                             <ALL(10, 20, 30) => 30 ���� => �ּҰ� ����
                                                    ------------------------------------------------------------------  MIN / MAX �� ����
                                             3. �����÷� ��������
                                             4. ���� ��������    
                 2) ����
                        -- �޿��� ���
                         SELECT AVG(sal) FROM emp => 2073
                        -- ��պ��� ���� ���
                         SELECET * FROM emp 
                         WHERE sal < 2073;                          
                       ---------------------------------------------------
                         SELECET * FROM emp 

                         WHERE sal < (SELECT AVG(sal) FROM emp);   
                                             -------------------------------- ��������
                                               ����
                                   2073
                          => MainQuery ����        
*/
-- 1. KING �� ���� �μ��� �ִ� ��� ��� ���� ���
-- KING�� �μ� ã��
-- WHERE���� ����
set linesize 250
set pagesize 25

SELECT *
FROM emp
WHERE deptno = (SELECT deptno FROM emp WHERE ename = 'KING');
/*
    �÷��� 1�� / �÷��� ������ => �����÷� ��������
      1) �ڹٿ��� ����Ŭ ������ ���ٽÿ��� �ִ��� Ƚ���� ���δ�
      2) �ӵ��� ����ȭ
      ** JOIN�� ���̺� �ִ� ������ ����
      ** SubQuery�� SQL���� ����
*/
/*
-- SCOTT�� �޴� �޿��� ������ �޿��� �޴� ��� ���
SELECT *
FROM emp
WHERE sal = (SELECT sal FROM emp WHERE ename = 'SCOTT')
AND ename <> 'CSOTT';

-- �޿��� ���� ���� ����� ���� �μ��� �ִ� ����� ��� ���� ���
SELECT *
FROM emp
WHERE deptno = (SELECT deptno FROM emp WHERE sal = (SELCET MIN(sal) FROM emp));

-- ������ CLECK�� ��� �μ��� ��� ��� ���� ���
SELECT deptno FROM emp WHERE job = 'CLECK';
SELECT *
FROM emp
WHERE deptno IN(SELECT deptno FROM emp WHERE job = 'CLERK');
-- 10�� �μ�
SELECT *
FROM emp
WHERE deptno >ANY(SELECT deptno FROM emp WHERE job = 'CLERK');
-- 30�� �μ�
SELECT *
FROM emp
WHERE deptno <ANY(SELECT deptno FROM emp WHERE job = 'CLERK');

-- 10�� �μ�
SELECT *
FROM emp
WHERE deptno <ALL(SELECT deptno FROM emp WHERE job = 'CLERK');
-- 30�� �μ�
SELECT *
FROM emp
WHERE deptno <ALL(SELECT deptno FROM emp WHERE job = 'CLERK');

-- 10�� �μ�
SELECT *
FROM emp
WHERE deptno = (SELECT MIN(deptno) FROM emp WHERE job = 'CLERK');
-- 30�� �μ�
SELECT *
FROM emp
WHERE deptno = (SELECT MAX(deptno) FROM emp WHERE job = 'CLERK');

-- �μ��� �ְ� �޿��� �޴� ��� ���
SELECT deptno, MAX(sal)
FROM emp
GROUP BY deptno;

SELECT ename, deptno, sal
FROM emp
WHERE (deptno,sal) IN(SELECT deptno, MAX(sal) FROM emp GROUP BY deptno);

-- ����� �̸�, �Ի���, �޿�(emp), �μ���, �ٹ���(dept) ���
-- ���� ���Ǵ� SQL => Function
-- <h1> aaa </h1> : &lt;h1&gt;aaa&lt;/h1&gt;
-- ���� �� �޴� �÷� 1�� => ������, �÷� ������ => �����÷� 
SELECT ename, hiredate, sal, dname, loc
FROM emp, dept
WHERE emp.deptno = dept.deptno;

-- ��Į�󼭺����� => ������ �⺻, �����Ҷ� ��Į�� ���
SELECT ename, hiredate, sal, (SELECT dname FROM dept WHERE deptno = emp.deptno) "dname",
                                        (SELECT loc FROM dept WHERE deptno = emp.deptno) "loc"
FROM emp;
-- ���̺� ��� ��� (�ζ��κ�)
SELECT ename, hiredate, sal
FROM (SELECT * FROM emp);

-- ���ϴ� ������ŭ ���
-- emp ���� ���������� 5�� ���� => rownum
SELECT empno, ename, hiredate, job, rownum
FROM emp
WHERE rownum <= 5;

-- �޿��� ���� ������ 5�� ���
SELECT ename, sal
FROM emp
ORDER BY sal DESC;

SELECT empno, ename, hiredate, sal, rownum
FROM (SELECT * FROM emp ORDER BY sal DESC)
WHERE rownum <= 5;

-- rownum �� ���� => TOP-N (���������� �), �߰������� �� �ڸ���
SELECT empno, ename, hiredate, sal, rownum
FROM (SELECT * FROM emp ORDER BY sal DESC)
WHERE rownum BETWEEN 6 AND 10;  

-- �ζ��κ�(����, ����¡) => ���̺� ���� �÷� ��� �Ұ�
SELECT empno, ename, hiredate, job, num
FROM (SELECT empno, ename, hiredate, job, rownum as num
FROM (SELECT empno, ename, hiredate, job FROM emp ORDER BY sal DESC))
WHERE num BETWEEN 1 AND 5;
*/
/*
    **������ ��������
    **������ �������� => IN(��ü), MAX / MIN
    �����÷� �������� => GROUP BY 
    ���(����) �������� 
    EXISTS => ���翩�� (true => ���� ���� / false => ���� ���� X) => ��ٱ���, �˻���...
*/
-- �μ� ���̺�(DEPT)�� �����ϴ� �μ��� ���� ����� �̸�, �μ���ȣ ���
SELECT ename, deptno
FROM emp e
WHERE EXISTS(SELECT 0 FROM dept d WHERE d.deptno = e.deptno);

-- ����������� 
/*
     ������������
         = ���������� ���������� ���� ����
     �����������
         = ������������ ROW���� �ݺ� ����
*/
-- �� �μ��� ��� �޿����� ���� ��� ���
SELECT e1.ename, e1.sal, e1.deptno
FROM emp e1
WHERE e1.sal > (SELECT AVG(e2.sal) FROM emp e2 WHERE e2.deptno = e1.deptno);
/*
    ������ / ������(IN)
    ��Į�� �������� / �ζ��κ�

    => �������� ���� ����
       1. �������� ���� => ����� ��ȯ
       2. ������������ ������� �޾Ƽ� ����/���̺� Ȱ��
       3. ���ο��� ���� �����
*/










