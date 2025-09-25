-- 3��(SQL �⺻)- 4��(SQL ���) 179p
/*
      1. DDL : ���� ��� => �÷� ���� => �ڵ� COMMIT
           ����, ����, ����, �̸�����, ������ �߶󳻱�
              = ���� : CREATE
                ***TABLE : ������ ���� �޸� => ���ϰ� ������ ����
                          CREATE TALBLE
                    VIEW  : ���� ���̺� (����, �ܼ��� SQL)
                          CREATE VIEW
                ***SEQUENCE : �ڵ� ���� ��ȣ
                          CREATE SEQUENCE
                    INDEX : �˻� ����ȭ => ����
                          CREATE INDEX
                    FUNCTION : �������� ������ �ִ� �Լ� (�����Լ�)
                                       => ����� ����
                          CREATE FUNCTION
                    PROCEDURE : ��ɸ� ����
                          CREATE PROCEDURE
                    TRIGGER : �ڵ� �̺�Ʈ ó��
                          CREATE TRIGGER
               = ���� : ALTER
                       => �߰�(�÷�), �������� ==> ADD
                               ALTER TABLE table_name ADD �÷��� �������� [��������]
                       => ����(�÷�), �������� ==> MODIFY
                               ALTER TABLE table_name MODIFY �÷��� ��������
                                                                  ---------- ������ ũ�� ����
                       => ����(�÷�), �������� ==> DROP
                               ALTER TABLE table_name DROP COLUMN �÷���
                = ���� : DROP
                       DROP TABLE table_name
                       DROP SEQUENCE seq_name
                = �̸� ���� : RENAME
                       RENAME old_name TO new_name
                       --------------------------------------- ���̺� ����
                       ALTER TABLE table_name RENAME COLUMN old_name TO new_name
                       --------------------------------------------------------------------------------- �÷� ����
                = ���̺��� ���� => �����͸� ����� ���
                       TRUNCATE
                       TRUNCATE TABLE table_name
                => DDL�� ROLLBACK�� ���� => ������ ��ƴ�

              1. table ����
                   1) ��������
                          = ������ : CHAR(1~2000byte), VARCHAR2(1~4000byte)
                                         ---------------------  ---------------------------- ��������Ʈ : �Ϲ������� ���� ���� ���Ǵ� ������
                                              ��������Ʈ(���ڼ��� ������ ���)
                                         CLOB(4�Ⱑ) : ���ڼ��� ���� ��� (���, ����, �ٰŸ�...)
                                           *** ����Ŭ�� �ѱ� �ѱ��ڴ� 3byte 
                                           *** ���ڼ��� ���� => ������ ����� ������ �߰� ��ƴ�
                          = ������ : NUMBER => 38�ڸ�
                                         => int / long / double
                                         => default �ַ� ��� : NUMBER => NUMBER(8,2)
                          = ��¥�� : DATE, TIMESTAEP
                                         ------ �ð�, ��, ��, ��¥
                          = ��Ī
                                      ����Ŭ              �ڹ�
                                      CHAR
                                      VARCHAR2
                                      CLOB                String
                                      NUMBER           int / double
                                      DATE                java.util.Date
                                      BFILE / BLOB      java.io.InputStream
                                      --------------- ����(�̹���, ������...)
                   2) ���̺�, �÷����� �ĺ���
                           = ���ڷ� �����Ѵ� (���ĺ�, �ѱ�)
                                                                 ----- ����x, �ü������ �ѱ� ó���� �ٸ���
                                                                        ����Ʈ���� ����
                            *** ���ĺ��� ��ҹ��� ������ ���� �ʴ´� 
                                 ���� ����Ŭ ������ �빮�ڷ� ����ȴ�
                               - TABLE ����     => user_tables
                               - �������� ���� => user_constraints
                               - VIEW ����      => user_views
                               ------------------------------------------ Ȯ�� ����
                           = table, column�� ���ڼ� => 30byte => 5~10����
                               ** �÷���� ���̺���� ���� �� �� �ִ�
                           = ���� �����ͺ��̽�(XE)������ table�� ���ϰ��̴�
                           = Ű����� ��� �� �� ����
                                 SELECT, INSERT, UPDATE, JOIN, ORDER BY ...
                           = ���ڸ� ��� �� �� �ִ� (�տ� ����� �Ұ�)
                           = Ư������ ��� ���� ( _ , $)
                                  - �ܾ 2�� �̻��� ���
                                  - goods_info(����Ŭ) => goodsInfo(�ڹ�)
                   3) ��������
                           = �̻����� ���� (����, �����ÿ� ������ �ʴ� �����Ͱ� ����, ������ �� �� �ִ�)
                                 ex)  ȫ�浿 ����                                       1. ȫ�浿 ����
                                       ȫ�浿 ���   => �� ������ �� �ִ� => 2. ȫ�浿 ���
                                       ȫ�浿 �λ�                                       3. ȫ�浿 �λ�
                           = NOT NULL : �ݵ�� �Է°��� �ʿ��� ���
                                 ex)  �ʼ� �Է�, �˾�â...
                                       ''(null), ' '(space)
                           = UNIQUE : �ߺ��� ���� ������ (null�� ���)
                                 ex) �ĺ�Ű : ��ȭ��ȣ, �̸��� ...
                           = NOT NULL + UNIQUE : �⺻Ű => PRIMARY KEY
                                * �������� ���Ἲ
                                * �ڵ� ���� ��ȣ, ���̵� (�ߺ�üũ)
                                  ----------------- SEQUENCE
                           = FOREIGN KEY : �ٸ� ���̺��� ����
                                => JOIN / �ܷ�Ű(����Ű)
                           = CHECK : ������ �����͸� ���
                                => �帣, ����, ����, �ٹ��� ...
                           = DEFAULT : �����Ͱ� �Է��� �ȵ� ��� ó���ϴ� ������
                                => SYSDATE, 0, �����/������

                    ����)
                              CREATE TABLE table_name(
                                   �÷��� �������� [��������], => DEFAULT / NOT NULL
                                   �÷��� �������� [��������], 
                                   �÷��� �������� [��������],
                                   [��������], => CHECK, FK, UK, PK
                                   [��������]
                              );

      2. DML => ROW ����ó��
             = ������ ���۾��
                   - INSERT   : �߰�
                         1) ��ü ������ �߰�, DEFAULT ����
                                   INSERT INTO table_name VALUES (��, �� ...)
                                                      ------------- ���̺��� �÷� �������
                                                                       ����, ��¥ => ''
                         2) ������ �����͸� �߰� : DEFAULT, NULL ���
                                   INSERT INTO table_name (�÷�, �÷� ...)
                                   VALUES(��, �� ...)
                                  => �۾���, ȸ������, ����, ����...
                   - UPDATE : ���� => ������ 1��
                                   UPDATE table_name SET
                                   �÷�=��, �÷�=��...
                                   [����] WHERE ���� 
                                  => �� ����, ȸ�� ����, ���� ����...
                   - DELETE  : ���� => ������ 1��   
                                   DELETE FROM table_name 
                                   [WHERE ����] 
                                  => �� ����, ȸ�� Ż��, ���� ���, ���� ���...
                   - �� ������ => SELECT, INSERT, UPDATE, DELETE

*/
/*
 DROP TABLE student;
*/
/*
    �������� : �Ѱ� ���̺� ���� ���� => �ߺ��� �Ǹ� ���� �߻�
                   ------------- user_constraints
     => �̸� �ο� => ���� �����ϱ� ����
           ---------- ���̺��_�÷���_����
           NOT NULL => nn
           PRIMARY KEY => pk
           FOREIGN KEY => fk
           CHECK => ck
           UNIQUE => uk

        1) ���̺� ����
              => ������ ���� : � �����͸� ���� �� �ǰ�
              => �������� Ȯ��
              => ��������
                     - NOT NULL => �÷� �ڿ� 
                     - DEFAULT => �÷� �ڿ�
                     - pk, fk, ck, uk
*/
/*
CREATE TABLE student(
    hakbun NUMBER,
    name VARCHAR2(51) CONSTRAINT std_name_nn NOT NULL,
    kor NUMBER(3),
    eng NUMBER(3),
    math NUMBER(3),
    regdate DATE DEFAULT SYSDATE,
    CONSTRAINT std_hakbun_pk PRIMARY KEY(hakbun),
    CONSTRAINT std_kor_ck CHECK(kor >= 0 AND kor <=100),
    CONSTRAINT std_eng_ck CHECK(eng >= 0 AND eng <=100),
    CONSTRAINT std_math_ck CHECK(math >= 0 AND math<=100)
);
*/
/*
SELECT * FROM user_constraints
WHERE table_name = 'STUDENT';
  �������Ǹ�
       C(NN, CK) / P(PK) / R(FK)
*/
/*
-- INSERT = hakbun �� �ڵ�����
-- MAX
INSERT INTO student VALUES((SELECT NVL(MAX(hakbun)+1,100) FROM student), 'ȫ�浿',90,90,80, SYSDATE);
INSERT INTO student(hakbun, name, kor, eng, math)
VALUES((SELECT NVL(MAX(hakbun)+1,100) FROM student),'��û��',80,90,70);

INSERT INTO student(hakbun, name, kor, eng, math)
VALUES((SELECT NVL(MAX(hakbun)+1,100) FROM student),'�̼���',82,92,72);

INSERT INTO student(hakbun, name, kor, eng, math)
VALUES((SELECT NVL(MAX(hakbun)+1,100) FROM student),'������',83,93,73);

INSERT INTO student(hakbun, name, kor, eng, math)
VALUES((SELECT NVL(MAX(hakbun)+1,100) FROM student),'�ڹ���',85,95,75);
COMMIT;

SELECT hakbun, name, kor, eng, math, kor + eng + math "total", 
ROUND((kor + eng + math)/3.0,2) "avg",
RANK() OVER(ORDER BY(kor+eng+math) DESC) "rank"
FROM student;
*/
-- ���� ����
/*
UPDATE student 
SET kor = 95, eng = 90, math = 89;
SELECT * FROM student;

ROLLBACK;
SELECT * FROM student;

UPDATE student 
SET kor = 95, eng = 90, math = 89
WHERE hakbun = 103;
COMMIT;

-- ����
DELETE FROM student;
SELECT * FROM student;

ROLLBACK;
SELECT * FROM student;

DELETE FROM student
WHERE MOD (hakbun,2) = 1;
SELECT * FROM student;

ROLLBACK;
SELECT * FROM student;
*/
/*
     UPDATE : ����
     DELETE  : ����
     -----------------   COMMIT
     �ڹ� 
        executeQuery() => SELECT
        executeUpdate() => commit() => INSERT / UPDATE / DELETE

    ����)
            UPDATE table_name 
            SET �÷� = ��, �÷� = ��... => �÷� �������� => ����, ��¥ => '��'
            [WHERE ���ǹ�]

            DELETE FROM table_name
            [WHERE ���ǹ�]

*/
























