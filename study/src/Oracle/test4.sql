-- ����Ŭ 2���� => DQL(SELECT) : ������ �˻�
-- ���� (WHERE => ������), �����Լ� �̿�
-- ORDER BY : ����
/*
    SELECT : ������ �˻�
                  ���̺� ���� => �÷��� / ��������
                     DESC table��
                  ��������
                       = NUMBER : ���� (int, double)
                       = BARCHAR2, CHAR, CLOB : String
                       = DATE : java.util.Date
                       = BLOB, BFILE : java.io.InputStream
                       = ���ڿ�, ��¥ => ''
                   * ������ ����Ǹ� ; ���
                   * ��ҹ��� ������ ���� => Ű����� �빮�� ���
                    ** ���� ����� ������ ��ҹ��� ����
                    ** �ڹٿ�����  ; �� ������� �ʴ´� (�ڵ� ÷��)
    ����, ����)
              --------------------------------------------------------
              SELECT * (��ü)| column_list(���ϴ� ������ ����)
              FROM table_name (view_name, SELECT~)
              -------------------------------------------------------- �ʼ�
              [
                    WHERE ���ǹ� (������) => if��
                               ----------------- �÷��� ������ �� => true
                    GROUP BY �׷��÷� => ��� (������ ���)
                                                       -------------------- ��ٱ���, �α��� Ƚ��...
                    HAVING �׷�����
                    -------------------- �ݵ�� GROUP BY�� �ִ� ��쿡�� ���
                    ORDER BY �����÷� (ASC | DESC)
                                                 ----- ������ ����
              ]
              SQL Plus ����
               set linesize 250 => width (80)
               set pagesize 25 => default (14��)
               => sqldeveloper
*/
-- 1. ������ ��ü ��� : *
-- * �� ����ϸ� ������ DESC���� ��µ� ������ ���´�
/*
SELECT *
FROM emp;
*/
-- 2. ���ϴ� �����͸� ���� => ��������
SELECT empno,ename,job,hiredate,sal
FROM emp;
-- 3. ���ǿ� �´� �����͸� ���� => ������
-- WHERE �÷� ������ �� => if(�÷��� ������ ��)
/*
     ����Ŭ ������
       = ��������� : SELECT => ���
           + , - , * , /
           -- �����ϰ� ����� ó�� (���ڿ� ������ ���� => ||)
           / : 0���� ���� �� ����
               ����/����=�Ǽ� => 5/2=2.5
          + : ����, �޿�+������
           - : �޿�-�ҵ漼
           * : ���� ���ϱ� / �޼� ���ϱ�
           / : ��¥��
     -------------------------- true / false
       = �񱳿�����
             = : ���� (UPDATE���� =�� ����)
             <>(����), !=, ^= : ���� �ʴ�
             < : �۴�
             > : ũ��
             <= : �۰ų� ����
             >= : ũ�ų� ����
       = ��������
             ||(���ڿ� ����), &&(�Է°��� �޴� ��쿡 ���)
             AND, OR
             => ���Ŀ�����(AND) => (����) AND (����)
                                                 -----           -----
                                                    |               |
                                                    --------------
                                                           |
                                                       ����� => ���� �ΰ��� true �϶��� ����
                                                         => ����, �Ⱓ�� ���� �Ǵ� ���
                                                         => BETWEEN ~ AND 
                          ex)   1~10 ���̸�
                                no >= 1 AND no <= 10
                                no BETWEEN 1 AND 10 => page ������ 
             => ���Ŀ�����(OR) => (����) OR (����)
                                               -----        -----
                                                  |             |
                                                  ------------
                                                         |
                                                     ����� => ���� �Ѱ� �̻��̸� true
                                                       => ����, �Ⱓ�� ����� ���
                                                       => IN
                                                       => �˻��� �������� ���
                         ex) �˻��� A, B, C
                              WHERE fd='A' OR fd='B' OR fd='C'
                              WHERE fd IN('A','B','C')
       = BETWEEN ~ AND : �Ⱓ, ���� ó��
       = IN : �˻��� �����Ͱ� ���� ��� OR�� ��ü
           *** NULL�� ���� ���� ���� => NULL�� ��� ����ó���� �ȵȴ�
                                                     ------------------------------------
                                                      NULL�� �����ϸ� ��� ���� ����� NULL
       = NULL 
             NULL => IS NULL
             NULL�� �ƴѰ�� => IS NOT NULL
           
       = LIKE => �˻�
            % : ���� ������ ���� ���
             _ : �ѱ���
            �����ϴ� ���ڿ� : ���۹���% => startsWith
                => ������Ʈ (�ڵ� �ϼ���)
                => �������� ó��
            ������ ���ڿ� : %������ => endsWith
            ���� ���ڿ� : %����% => contains : ���� ���� ���
            ���ڼ��� �ƴ� ���
                ex)  3��° �ڸ��� C ~ => __C%
                      ���ڼ� 5�� => _B___

       = NOT
            ����������
            WHERE NOT (����)
            => NOT BETWEEN ~ AND
            => NOT IN
            => NOT LIKE
     --------------------------- WHERE
*/
/*
-- �������� �޴� ����� ��� ���� ���
SELECT *
FROM emp
WHERE comm IS NOT NULL AND comm <> 0;
-- �������� ���� ����� ��� ���� ���
SELECT *
FROM emp
WHERE comm IS NULL OR comm=0;
*/
/*
     book
     BOOKID         NOT NULL NUMBER(2)
     BOOKNAME    VARCHAR2(40)
     PUBLISHER      VARCHAR2(40)
     PRICE             NUMBER(8)
*/
/*
-- ��ü ���
SELECT *
FROM book;
-- ���ϴ� �÷��� ���
SELECT bookname,price
FROM book;
*/
/*
SELECT publisher "���ǻ�"
FROM book;
-- �ߺ� ���� => DISTINCT
SELECT DISTINCT publisher "���ǻ�"
FROM book;
*/
-- ���� �˻� => ������ WHERE
/*
    ����Ŭ���� �����ϴ� ��������
      1. ���� ����
           ** ����Ŭ���� �ѱ��� 3byte   ex) ���� => CHAR(2) X CHAR(6) O
           CHAR (1~2000byte) => ���� ����Ʈ (���� ���ڼ� ����)
             ex)  data CHAR(10) => data='A' => �޸𸮴� 10byte�̴� 
           ***VARCHAR2(1~4000byte) => ���� ����Ʈ
             ex)  data VARCHAR2(1000) => data='A' => �޸𸮴� 1byte
           CLOB : 4�Ⱑ => ������
            => �ٰŸ�, ī��, ��α�, ȸ��Ұ�...
      2. ���� ����
           NUMBER => ���� / �Ǽ�
           NUMBER => 8�ڸ�
             NUMBER(4) => 1~4�ڸ� ���� ����� ���� => 0~9999
             NUMBER(7,2) => �ڸ��� 7�ڸ� ��� ����(����)
                                      �ڸ��� 5�ڸ�, ������ 2�ڸ� ���
              ex)   5.0, 4.5...
                     NUMBER(2,1)
              => �ڸ����� 38�ڸ����� ��� ����, �Ҽ��� 128�ڸ����� ��밡��
      3. ��¥ ����
           DATE => ��¥, �ð� => default : YY/MM/DD => '81/01/23'
           => ���ڿ� �������� ����
      ** ���� / ��¥ => �˻��ÿ� �ݵ�� '' ���
      ** ����� �����ʹ� ��ҹ��� ����
*/
/*
-- ���������
CREATE TABLE student(
    hakbun NUMBER,
    name VARCHAR2(51),
    kor NUMBER(3),
    eng NUMBER(3),
    math NUMBER(3)
);
INSERT INTO student VALUES(1,'ȫ�浿',90,87,67);
INSERT INTO student VALUES(2,'��û��',78,82,62);
INSERT INTO student VALUES(3,'�ڹ���',67,83,69);
INSERT INTO student VALUES(4,'�̼���',89,85,68);
INSERT INTO student VALUES(5,'������',77,86,67);
COMMIT;
*/
/*
SELECT hakbun,name,kor,eng,math,(kor+eng+math) "total",
           ROUND((kor+eng+math)/3,2) "avg",
           RANK() OVER(ORDER BY(kor+eng+math) DESC) "rank"
FROM student;
*/
-- ��� ������ : SELECT => ���
-- �� ������ = : �󼼺���
-- ��� �߿� SCOTT����� ��� ���� ���
SELECT *
FROM emp
WHERE ename='SCOTT';
-- ����߿� ����(job)�� CLERK�� ����� ��� ���� ���
SELECT *
FROM emp
WHERE job='CLERK';
-- ����� ����� 7900�� ����� ���(empno), �̸�(ename), �Ի���(hiredate), �޿�(sal) ���
SELECT empno, ename, hiredate, sal
FROM emp
WHERE empno=7900;

-- SELECT 1 + '10' FROM DUAL;  
-- SELECT 1 || '10' FROM DUAL;
-- <> ���� �ʴ� (!=, <>, ^=)
-- ��ü ������� ������ ����� �ƴ� ������� ���
SELECT *
FROM emp
WHERE job <> 'CLERK';

SELECT *
FROM emp
WHERE job != 'CLERK';


SELECT *
FROM emp
WHERE job ^= 'CLERK';
-- ����Ŭ�� ���� : ���� ������ ��½ÿ� ����� ���� ���� (�м��� ��ƴ�)
-- ���α׷��� ��������� �������� �ֱ� ������ ��ƴ�
-- ex) �Ϲ� �޼ҵ�, ���ٽ�
-- ���� ���� ���α׷� : �����ͺ��̽� ���� 
-- < : �۴� ==> ��¥, ���ڱ��� ����� ����
-- ����߿� �޿�(sal)�� 2000���� ���� ����� ��� ���� ���
SELECT *
FROM emp
WHERE sal < 2000;

-- ����߿� �Ի����� '81/05/09' ���� ���� �Ի��� ����� ��� ���� ���
SELECT *
FROM emp
WHERE hiredate < '81/05/09';

-- ����߿� �޿�(sal)�� 2000���� ���� ����� ��� ���� ���
SELECT *
FROM emp
WHERE sal > 2000;

-- ����߿� �Ի����� '81/05/09' ���� ���߿� �Ի��� ����� ��� ���� ���
SELECT *
FROM emp
WHERE hiredate > '81/05/09';

-- ����߿� �޿�(sal)�� 2000(����)���� ���� ����� ��� ���� ���
SELECT *
FROM emp
WHERE sal >= 2000;

-- ����߿� �Ի����� '81/05/09' (����)���� ���߿� �Ի��� ����� ��� ���� ���
SELECT *
FROM emp
WHERE hiredate >= '81/05/09';















