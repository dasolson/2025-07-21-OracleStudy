--179p DDL / DML
/*
             SQL
               |
             DQL : �����Ͱ˻�
                      SELECT
             DDL : ������ ���� ���
                      CREATE : ���� => TABLE : ������ ���� ���� (����)
                                                VIEW : ���� ���̺� => ���� ���̺��� ����
                                               SEQUENCE : �ڵ� ���� ��ȣ
                                               INDEX / �ó��
                                               PS / SQL => �Լ�. Ʈ���� 
                      DROP : ����
                      ALTER : ���� => ADD, MODIFY, DROP
                                        => �÷�����, ��������
                      TRUNCATE : �߶󳻱�
                      ENAME : ���̺� �̸� ����
             DML : ������ ����
                      INSERT : ������ �߰�
                      UPDATE : ������ ����
                      DELETE : ������ ���� 
             DCL : GRANT : ���� �ο� / REVOKE : ���� ����
             TCL : ������� : COMMIT / ������ ���� : ROLLBACK
                  *** ����Ŭ ��ü������  COMMIT�� �Ǿ� ����
                       �ڹٴ� AutoCommit
                        => TRANSACTION

        1. ������ ���� ����
                1) ��������
                       - ���ڿ� 
                               CHAR (1~2000byte) ���� => CHAR(10)
                                 => ���� ����Ʈ (�޸𸮰� �׻� ����)
                                    ex) CHAR(10) => 'A' ===> 
                                                                           ---------------------
                                                                            'A' \0 \0 ...10��
                                                                           ---------------------
                                           => ���ڼ��� ���� ��� (���� / ����, admin / user...)
                               VARCHAR2 (1~4000byte) => ����Ŭ���� �ѱ� (�ѱ��� 3byte)
                                  => ���� ����Ʈ (�޸�=> ���ڼ��� ���� ũ�Ⱑ �޶�����)
                                  => ���� ���� ���Ǵ� ���ڿ�
                                  => ����Ŭ���� �����ϴ� ��������
                               CLOB : 4�Ⱑ => ������
                                  => �ѱ� 1000�� �Ѵ� ��� ���
                                  => �ٰŸ�, ȸ��Ұ�, �ڱ�Ұ�...
                               ------------------------------------------------------------------------- �ڹٿ��� String���� ó�� (10g)                                           
                       - ���� : NUMBER => int , long , double
                                 ----------- (38�ڸ�)
                                  NUMBER : default => 8�ڸ� ��� ����
                                                                 ------ ���ڰ� 8�� ����
                                                 NUMBER(8,2) => 12345678.12 (x)
                                                                          123456.12   (o)
                                  NUMBER(4) => 0~9999
                                  NUMBER(2,1) => ����
                       - ��¥ : DATE / TIMESTEMP
                                  ------ java.util.Date
                       - ��Ÿ (��� �� ����)
                                  ���� / ������ / �α�
                                  BLOB : 2������ (���̳�����)
                                  BFILE : File���·� ���� => ������ ���� => ������ �о ���              
                      ����)
                                 �÷��� ��������                    
                1-1) ���̺� �ĺ���
                        = ���� �����ͺ��̽����� ���� ���̺���� ��� �Ұ�
                        = XE
                           - ���ڷ� �����Ѵ� (���ĺ�, �ѱ�) 
                                  => ���ĺ��� ��ҹ��� ������ ���� �ʴ´� (���� ������ �빮�ڷ� ����ȴ�)
                                                                               ex)  WHERE table_name = 'emp' => 'EMP'
                                  => ���� �������
                                        ���̺� Ȯ�� : user_table
                                         user_view ... user_sequence ..., user_constraints
                           - ���̺���� 30(byte)�� ����� ���� (�÷��� ����)
                           - ���ڴ� ����� ���� => �տ� ��� ����
                           - Ư������ ( _ , $) => �ܾ �ΰ��� ��� file_name
                           - Ű���� ��� �Ұ� 
                                 SELECET / FROM / GRUOP BY / ORDER BY / JOIN ...
                2) ����ȭ�� ������ : �ʿ��� �����͸� ���� => ���� ����
                         - �������� : �̻����� ����
                                          --------- ����, ���� => ������ �ʴ� �����Ͱ� ����
                         - NOT NULL : �ݵ�� �Է°��� �־�� �Ѵ�
                               *** �ʿ��Է� / �Է� �޼���
                         - UNIQUE : �ߺ��� ���� ������ (NULL ���� ���)
                               *** �ĺ�Ű (�⺻Ű�� ��ü) => ��ȭ��ȣ / �̸��� ...
                         - PRIMARY KEY : �⺻Ű => ��� ���̺��� 1�� �̻��� �⺻Ű�� ������ �ִ�
                               => NOT NULL + UNIQUE
                               => ���ڷ� �̿� (�Խù���ȣ, ��ȭ��ȣ, ������ȣ...)
                                     => ��� : ���̵� (�ߺ�üũ)
                         - FOREIGN KEY : ����Ű, �ٸ� ���̺�� ����
                               ex)  ���� = ��� (������ȣ)
                                     ��ȭ = ���� (��ȭ��ȣ)
                                     ȸ�� = ���� (ȸ��ID)
                         - CHECK : ������ �����͸� ����
                               => ������ư / üũ�ڽ� / �޺��ڽ�
                               => ���� / ����, �μ���, �帣...
                         - DEFAULT : �̸� �⺻���� ����
                               => ����� : redate DATE DEFAULT SYSDATE
                               => HIT : hit NUMBER DEFAULT 0
                3) � �����͸� ���� �� �� => �����ͺ��̽� ����
                         - ��ġ��ŷ => ������ �м�
                         - �Խ���, ����...
                4) ���̺� ���� => �ڵ� COMMIT
                     4-1) �⺻�� ���̺��� ���� (��ü �����ͱ���)
                               CREATE TABLE table��
                               AS
                                 SELECT * FROM emp
                     4-2) ������ ���̺� ���¸� ���� (������ ����)
                               CREATE TABLE table��
                               AS
                                  SELECT * FROM emp
                                  WHERE 1 = 2;
                                             ------ false�� ����
                                                 ex) 'A' = 'B'
                     4-3) ����� ���� 
*/
--���̺� ����
/*
CREATE TABLE myEmp2
AS
  SELECT * FROM emp;

CREATE TABLE myEmp3
AS
 SELECT * FROM emp
 WHERE 1=2;
*/
-- ���̺� ����
/*
    ����)
             DROP TABLE table_nama;

DROP TABLE myEmp;
DROP TABLE myEmp2;
DROP TABLE myEmp3;

CREATE TABLE myEmp
AS
  SELECT empno, ename, job, hiredate, sal, dname, loc
  FROM emp, dept
  WHERE emp.deptno = dept.deptno;
*/
-- �÷� �߰�
/*
    ALTER TABLE myEmp ADD mgr NUMBER(4);
*/
-- ALTER TABLE myEmp ADD mgr NUMBER(4);
-- �÷� ����
/*
    ALTER TABLE myEmp MODIFY �÷��� �����ҵ�������
*/
-- ALTER TABLE myEmp MODIFY ename VARCHAR2(52);
-- �÷� ����
/*
    ALTER TABLE table_name DROP COLUMN column��

-- ALTER TABLE myEmp DROP COLUMN mgr;
--ALTER TABLE myEmp ADD mydate DATE;
--                                     --------- regdate => �÷��� ����
--ALTER TABLE myEmp RENAME COLUMN mydate TO regdate;
-- ���̺�� ����
-- RENAME myEmp TO empDept;
-- ������ �߶󳻱� => ���� �Ұ�
-- TRUNCATE TABLE empDept;

DROP TABLE empDept;
CREATE TABLE empDept
AS
  SELECT empno, ename, job, hiredate, sal, dname, loc
  FROM emp, dept
  WHERE emp.deptno = dept.deptno;
*/
-- ALTER TABLE empDept ADD mgr NUMBER(4) DEFAULT 7788 NOT NULL;
/*
    ���̺� ���� ��ɾ� => AUTO COMMIT => �ѹ� ����� ���� �Ұ�
        1. CREATE : ����
        2. ALTER   : �÷� ���� / ���� ���� ����
                 - ADD : �÷��߰�
                 - MODIFY : �÷� ���� => ũ������
                 - DROP : �÷� ����
        3. DROP : ���̺� ����
        4. RENAME : ���̺�� ����
        5. TRUNCATE : ���̺� ������ ���� 
*/





















