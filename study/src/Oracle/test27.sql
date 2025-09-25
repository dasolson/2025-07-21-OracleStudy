-- �� (view)
/*
         TABLE / SEQUENCE / VIEW / SYNONYM / PL/SQL(Function, procedure, trigger)
             |                                   ---------------------------------------------------------
             |                                    ���� : ����
          SELECT / UPDATE / DELETE / INSERT
               | JOIN / SUBQUERY
        ---------------------------------------------------- �����ͺ��̽� ���� �����

       VIEW
          = ������ ���̺�κ��� �����͸� �����ϴ� �������̺�
          = ������ �پ�� / SQL ���� �ܼ�ȭ
          = ���� �����Ͱ� ����Ǵ� ���� �ƴ϶� SELECT ������ �����ϰ� �ִ�
         ����
            1. �ܼ���    : ���̺� 1�� ����
            2. ���պ�    : ���̺� ������ ���� (JOIN / SUBQUERY)
            3. �ζ��κ� : FROM �ڿ� SELECT
            ** ������ : DML�� ���� (INSERT / UPDATE / DELETE)
                           -----------------------------------------------
                            => �����ϴ� ���̺� ��ü�� ����ȴ�
            => WITH CHECK OPTION / READONLY OPTION ( VIew => �б� ����)
*/
-- ���պ�
/*
conn system/happy
GRANT CREATE VIEW TO hr;
conn hr/happy

CREATE VIEW emp_dept
AS
  SELECT empno, ename, sal, job, hiredate, dname, loc
  FROM emp, dept
  WHERE emp.deptno = dept.deptno; 
*/
/*
        1. �� => �������� ����
              ���Ѻο� : GRANT CREATE VIEW TO hr
              �������� : REVOKE CREATE VIEW FROM hr
              ---------- system / sysdba
        2. ���̺� 1�� �̻��� �����ؼ� ���Ӱ� ��������� �������̺�
        3. ���� ����
                1) �ܼ��� (���̺� 1�� ����) => ���󵵰� ���� ���� (���̺� ���)
                          => DML ���� ( INSERT, UPDATE, DELETE)
                               -----------  View�� ����Ǵ� ���� �ƴ϶� ���� �����ϴ� ���̺� ����
                2) ���պ� (���̺� 2�� �̻� ����) => JOIN / SUBQUERY => ������ SQL ���� ����
                3) �ζ��κ�
        4. ����
                1) ���� => ���� ���̺��̶� ���� ������ �ȵȴ�
                      => VIEW�� ���� �����͸� �����ϴ� ���� �ƴϰ� SQL���常 �����Ѵ�
                2) ���� : SQL ������ �����ϰ� �ֱ� ������ ������ ���ϴ�
                3) ���������� ��� ����
        5. ���� ���� (����)
                1) WITH CHECK OPTION => DML ���� (DEFAULT)
                2) WITH READ ONLY => �б� ���� (SELECT)
        6. �� ���� 
               CREATE VIEW view_name
               AS
                  SELECT ~~
        7. �� ���� (******)
               CREATE OR REPLACE VIEW view_name
               AS
                  SELECT ~~
        8. �� ����
               DROP VIEW view_name
        9. �� Ȯ��
               SELECT text
               FROM user_views
               WHERE view_name = '�빮��'
     
        *** ������ SQL �� ��� => ��� ����� �Ǹ� View�� ���
        *** ������ �ʿ��� �κ�
             --------------------- Spring Security
*/
/*
SELECT text 
FROM user_views
WHERE view_name = 'EMP_DEPT';
*/
/*
-- �ܼ��� : ���̺� 1���� ���� => DML����
-- ���̺� ����
CREATE TABLE myDept 
AS
  SELECT * FROM dept;

CREATE VIEW myView
AS
  SELECT * FROM myDept;

INSERT INTO myView VALUES(50, '���ߺ�', '����');
COMMIT;

-- �ܼ���=> �б�����
DROP VIEW myView;

CREATE VIEW myView
AS
  SELECT * FROM myDept WITH READ ONLY;

INSERT INTO myView VALUES(50, '���ߺ�', '����');
COMMIT;

DROP VIEW myView;
DROP TABLE myDept;

-- ����
CREATE OR REPLACE VIEW emp_dept
AS
  SELECT empno, ename, job, hiredate, sal, dname, loc, grade
  FROM emp, dept,salgrade
  WHERE emp.deptno = dept.deptno
 AND sal BETWEEN losal AND hisal;
*/
-- �Ϲ� ���̺�� �����ϰ� ��� ����
-- ������ �ִ� ��
/*
CREATE OR REPLACE VIEW emp_view1
AS
  SELECT empno, ename, job, hiredate, sal,
          (SELECT dname FROM dept WHERE deptno=emp.deptno) "dname",
          (SELECT loc FROM dept WHERE deptno=emp.deptno) " loc"
  FROM emp
  WHERE MOD(empno,2)=0;

CREATE OR REPLACE VIEW emp_view1
AS
  SELECT empno, ename, job, hiredate, sal,
          (SELECT dname FROM dept WHERE deptno=emp.deptno) "dname",
          (SELECT loc FROM dept WHERE deptno=emp.deptno) " loc"
  FROM emp
  WHERE MOD(empno,2)=0;
--SELECT ename, dname FROM emp_view1; 

-- ���� ��
CREATE OR REPLACE VIEW emp_view2
AS
  SELECT empno, ename, job, sal, hiredate, dname, loc, grade
  FROM emp JOIN dept
  ON emp.deptno = dept.deptno
  JOIN salgrade
  ON sal BETWEEN losal AND hisal;
-- ����/�׷�
CREATE OR REPLACE VIEW emp_view3
AS
 SELECT deptno, TO_CHAR(hiredate,'YYYY') "regdate", COUNT(*) "count",
            MAX(sal) "max_sal", MIN(sal) "min_sal", 
            SUM(sal) "sum_sal", ROUND(AVG(sal)) "avg_sal"
 FROM emp
 GROUP BY deptno, TO_CHAR(hiredate,'YYYY')
 HAVING AVG(sal) > 2073
 ORDER BY deptno;
*/
















