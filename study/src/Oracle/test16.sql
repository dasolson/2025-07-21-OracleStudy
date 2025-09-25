-- 179p ������ ���� ���
/*
    1. table : ������ ���� ����
           1) ��������
           2) ����ȭ ������ : ��¿� �ʿ��� �����͸� ���� => ���ϴ� ������
              ---------------- ���� ����
    2. view  : ���� ���̺�
    3. sequence : �ڵ� ���� ��ȣ
    4. �ó�� : ���̺��� ��Ī
    5. INDEX : �ӵ� ����ȭ => �˻�, ���� ****** 
    6. PL/SQL
          = FUNCTION / PROCEUDE / TRGGER
                                                  ---------- ������� => �ڵ�ȭ ó��
                                                                �Խù� = ���
                                                                 ex)  �԰� -> ��� , ��� -> ���
                               ------------- �ڹ� �޼ҵ�� ���� (�������� ����)
             ------------- �������� �ִ� �Լ�(���� �Լ�) => SELECT
   ----------------------------------------------------------------------------------------------
    �����ͺ��̽� ���� (����ȭ = 1,2,3 ����ȭ) 
      => DML (INSER, UPDATE, DELETE) => ��������
      
        1. DDL => ������ ���� (COMMIT / ROLLBACK)
             - ��ɾ� : CREATE, ALTER, DROP, TRUNCATE, RENAME
                  ����
                      CREATE TABLE
                      CREATE VIEW
                      CREATE SEQUENCE
                      CREATE FUNCTION
                   ����
                      DROP TABLE
                      DROP VIEW
                      DROP SEQUENCE
                   ���� 
                      ALTER TABLE table_name ADD     => �÷� �߰�
                                                         MODIFY => �÷� ����
                                                         DROP    => �÷� ����
                   �߶󳻱�
                      TRUNCATE TABLE table_name
                   �̸� ����
                      RENAME old_name TO new_name

                   table�� / �÷���
                      => XE������ ���� => ���ϰ��� �ʿ�(�ߺ� �Ұ�)
                      => ���ڼ� : 30�� ����
                      => Ư������ : _ 
                      => ���� ��� ���� (�տ� ��� ����)
                      => ���ĺ�, �ѱ� ��� ���� (���ĺ� ����)
                           -------- ��ҹ��� ���� X
                                      ���� �޸𸮿� ���� (�빮�ڷ� ����)

                    ����) 
                             CREATE TABLE table_name(
                                  �÷��� �������� [��������],
                                  �÷��� �������� [��������],
                                  �÷��� �������� [��������]                           
                             )
                          1) �÷��� ���� : � �����͸� �������� �м� = �䱸���� �м�
                          2) ��������
                                   = ���� ����
                                           CHAR (1~2000byte) => ��������Ʈ
                                                => ���� ũ���� �����Ͱ� �ִ� ���
                                           VARCHAR2 (1~4000byte) => ��������Ʈ
                                                => �Ϲ������� ���Ǵ� ����
                                           CLOB (4�Ⱑ) => ���� 
                                                => ���� / �ٰŸ� ...
                                   = ���� ����
                                           NUMBER : 8�ڸ�
                                           NUMBER(4) : 4�ڸ�
                                           NUMBER(2,1) : �Ҽ� (����...)
                                   = ��¥ ����
                                           DATE / TIMESTEMP
                          3) ��������
                                   NOT NULL  => �ݵ�� �Է°��� �־�� �Ѵ�
                                ----------------------------------------------------------
                                |  UNIQUE => �ߺ��� ���� �� => NULL ���� ��� |
                                |  --------- ��ȭ��ȣ / �̸��� ...                            |
                                |  NOT NULL + UNIQUE : PRIMARY KEY (�⺻Ű)   |
                                |   => ���� / ���̵� (��� ������ ã��)                |
                                ---------------------------------------------------------- => �ڵ����� INDEX   
                                   �ܷ�Ű : FOREIGN KEY (����Ű)
                                         
                                       ex)  primary key    foreign key
                                              member          reserve
                                                  id              �����ȣ
                                                                       id => ���� �����ؾ� �Ѵ�
                                   CHECK : ������ ���ڸ� ��� ����
                                       ex)   ���� / ����, ����, ����, �帣...
                                   DEFAULT : �̸� ���� ����
                                ---------------------------------------------------------------------------------------
                                 * �Ѱ��� ����ϴ� ���� �ƴ϶� ������ ����� ����
                                 
                                    ���� ���̺�
                                    ------------- �������ǿ� ���� ����
                                        �߿� : ���̺� / ũ�Ѹ��� �Ѹ� ������ �Ѵ�
                                        ����)
                                            = �÷� ���� : �÷� ������ ���ÿ� ���������� ����
                                                         => NOT NULL, DEFAULT
                                            = ���̺� ���� : ���̺� ���� �Ŀ� �������� ����
                                                         => PK, FK, CK, UK
                                            *** ��� ���������� user_constaints�ȿ� ����
                                                CREATE TABLE table_name (
                                                     �÷��� �������� CONSTRAINT table��_�÷���_nn NOT NULL,
                                                     �÷��� �������� DEFAULT ��,
                                                     ...,
                                                     CONSTRAINT table��_�÷���_pk PRIMARY KEY(�÷�),
                                                     CONSTRAINT table��_�÷���_uk UNOQUE(�÷�),
                                                     CONSTRAINT table��_�÷���_ck CHECK(�÷� IN(...)),
                                                     CONSTRAINT table��_�÷���_fk FOREIGN KEY(�÷�)
                                                     REFERENCES ���������̺�(�÷�)
                                                )
*/
/*CREATE TABLE A(
    name VARCHAR2(10) CONSTRAINT a_name_nn NOT NULL
);
CREATE TABLE B(
    name VARCHAR2(10) CONSTRAINT a_name_nn NOT NULL
);
DROP TABLE A;
*/


DROP TABLE A;

/*CREATE TABLE A(
    name VARCHAR2(20) CONSTRAINT a_name_nn NOT NULL,
    sex VARCHAR2(20)
);
ALTER TABLE A DROP CONSTRAINT a_name_nn;

INSERT INTO A VALUES('ȫ�浿','����');
INSERT INTO A VALUES('','����');
INSERT INTO A VALUES('','����');
INSERT INTO A VALUES('','����');
INSERT INTO A VALUES('�ڹ���','����');

CREATE TABLE A(
    name VARCHAR2(20)  NOT NULL,
    sex VARCHAR2(20) NOT NULL
);
*/
/*
    a , 1
    b,  2
    a,  2
    b,  1
*/
CREATE TABLE A(
    id VARCHAR2(10), 
    phone VARCHAR2(20),

    PRIMARY KEY(id, phone)
);
















