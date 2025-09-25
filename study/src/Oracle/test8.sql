-- 2025-09-03 �����Լ�
/*
     1. ���� / ���ۼ��� / ������ / �����Լ� => ���� ���̺�
          ���� ���̺� : ����, �������� => SELECT
     1) SELECT ������ ����
          ***������ => ����Ŭ�� ��û (������ ����) => 142p
                                                   SQL
          �ڹ�(JDBC = MyBatis = JPA) ===> ����Ŭ
                                                  <=== 
                                                  ������ ResultSet (�޸� ����)
                         |
                      �ܼ�
                      ������, ������
          ***SELECT => ����Ŭ ������ �˻�(����) ��û => ���ڿ�
          => 
          SELECT *(��ü) | clumn_list (ȭ�� ��ºκ�)
          FROM table_name
          [
               WHERE => ���ǿ� �´� �����͸� ����
                               ------------------------------ ������
               GROUP BY => �׷캰�� ��� ���, ��� ó�� ==> �����ڸ��
               HAVING => GROUP BY�� �ִ� ��쿡�� ��� (�׷� ����)
               ORDER BY => ���� (�ֽ� ������ => DESC)
               ------------ �ܼ��� ������ => �����Ͱ� ���� ��� (INDEX)
          ]
          WHERE ���� ��� => ������
               ��������� : + , - , * , /(����/����=�Ǽ�)
                                --- �������
                                     ���ڿ� ���� : ||
                                     '100'+1 => 101
                                      ----------------- �ӵ��� �ʴ�
                                     TO_NUMBER('100') + 1
               �񱳿����� : = , !=(<>) , < , > , <= , >=
               �������� : AND(���� ����), OR(�������� X)
               BETWEEN ~ AND : �Ⱓ, ���� >= AND <=
                                                        -------------- ����
               => ������ : ������ (���ڿ�, �̹���) 2��
               IN : OR�� ���� ���
               NULL : �ķ����� NULL�� ��� => ����ó�� X (����� : NULL)
                         �÷�=null -> IS NULL
                         �÷� != null -> IS NOT NULL
               NOT : ����
                          NOT IN, NOT BETWEEN, NOT LIKE
               LIKE : % -> ������ ������ ����
                       _   -> �ѱ���
                                �÷� LIKE 'A%'   => �ڵ��ϼ���
                                �÷� LIKE '%A'   
                                �÷� LIKE '%A%' => �ַ� �˻� 
           --------------------------------------------------------------------------------------
           �����Լ�
                ROW���� ó�� (������ �Լ�)
                      ���� �Լ�
                           LENGTH : ���� ���� -> LENGTH(�÷���)
                           SUBSTR : ���� �ڸ��� -> SUBSTR(�÷���, ������ġ, �ڸ� ����)
                                                             ** �ڹٴ� ���ڿ� ��ȣ 0 ~
                                                             ** ����Ŭ ���ڿ� ��ȣ 1 ~
                           INSTR : ���� ã�� -> INSTR(�÷�|���ڿ�|, ã�� ����, ������ġ, ���°)
                                                              �ڹ� => indexOF, lastIndexOf 
                           RPAD : ���ڰ� ���� ��췹 �ٸ� ���� ��ü
                                      => ID ã��
                           REPLACE : �ٸ� ���ڷ� ��ü &, ||
                                            REPLACE(���ڿ�|�÷�, ã�¹���, ���湮��)
                      ���� �Լ�
                           MOD : ������ -> MOD(10,3) => 10%3
                           ROUND : �ݿø� => ���
                                           ROUND(�Ǽ�,�ڸ���)
                           CEIL : �ø� => ��������
                                           CEIL(�Ǽ�) => ���� => �Ҽ����� 1�̻�
                      ��¥ �Լ�
                           SYSDATE : �ý����� ��¥ / �ð� => �����
                           MONTHS_BETWEEN : �ش� �Ⱓ�� �޼�
                                           MONTHS_BETWEEN(�ֱ�, ����)               
                      ��ȯ �Լ�
                           TO_CHAR : ��¥, ����=>���ڿ�ȭ
                                           -----
                                           YYYY (RRRR) / MM / DD
                                           HH(HH24) / MI / SS
                                           DY => ����
                      ��Ÿ �Լ�
                           NVL => NULL�� ��ü�ؼ� ���
                                           NVL(�÷���,��ü��)
                                           =>  -------- ���������� ����
                                           => �÷� : VARCHAR2 => ���ڿ�
                                                         NUMBER    => ����
                                                         DATE         => ��¥��
                �÷� ��ü ���� (���� �Լ�, ���� �Լ�) => ���         
---------------------------------------------------------------------------------------------------
        �÷� ��ü ���� (�����Լ�, �����Լ�) => ���
        ***1. COUNT : ROW�� ����
                 COUNT(�÷���) => NULL�� ����
                 COUNT(*)         => NULL�� ����
                     => �α��� (ID���� ����)
                     => �˻� ���
                     => ID �ߺ� üũ
                     => ��ٱ��� �� ���� Ȯ��
        ***2. MAX / MIN : ��ü ������� �ִ밪 / �ּҰ�
           3. AVG : ��ü ����� ���
        ***4. SUM : ��ü ����� ���� => ����
           5. RANK() : ���� ���� => DESC / ASC
                 RANK() OVER(ORDER BY �÷��� ASC|DESC) => ��� ���...
                              1
                              2
                              2
                              4
                 DENSE_RANK() OVER(ORDER BY �÷��� ASC|DESC) => �뷡 ����, ��ȭ ����...
                              1
                              2
                              2
                              3
     *** ������ : �����Լ��� ���ÿ��� �÷�, ������ �Լ��� ����� �� ����
                      ��, �÷��� ��� �� �� GROUP BY ���                
*/
-- emp�� �ִ� �ο� Ȯ�� => COUNT
/*
SELECT COUNT(*) "���ο�" , COUNT(mgr) " ����� �ִ�  ���" ,COUNT(comm) " ������"
FROM emp;
*/
-- emp�ȿ� �޿��� ���� ���� �޴� ���, ���� �۰� �޴� ���
-- MAX(�÷���) / MIN(�÷���) => MAX�� �ڵ� ���� MAX+1 => SEQUENCE
/*
SELECT MAX(sal) , MIN(sal)
FROM emp;
*/
-- emp ���� �޿��� ��� / ����
-- AVG(�÷���) / SUM(�÷���)
/*
SELECT ROUND(AVG(sal)), SUM(sal)
FROM emp;
*/
-- �μ���ȣ�� 10�� => �޿��� ���� / �޿��� ��� / ���� ���� �޿� / ���� ���� �޿� / �ο�
/*
SELECT SUM(sal), AVG(sal), MAX(sal), MIN(sal), COUNT(*)
FROM emp
WHERE deptno=10;

SELECT SUM(sal), AVG(sal), MAX(sal), MIN(sal), COUNT(*)
FROM emp
WHERE deptno=20;

SELECT SUM(sal), AVG(sal), MAX(sal), MIN(sal), COUNT(*)
FROM emp
WHERE deptno=30;

SELECT deptno, SUM(sal), ROUND(AVG(sal)), MAX(sal), MIN(sal), COUNT(*)
FROM emp
GROUP BY deptno;
*/
--emp���� ����߿� �޿��� ��պ��� ���� �޴� ����� ��� ���� ���
/*
SELECT ROUND(AVG(sal))
FROM emp;
 
SELECT *
FROM emp
WHERE sal <2073;

SELECT *
FROM emp
WHERE sal <(SELECT ROUND(AVG(sal)) FROM emp);
*/

























