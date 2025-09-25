-- 3�� ~ 4�� => ���� / ����
/*
      => PL/SQL / ���Խ� (REGEXP_LIKE, REGEXP_COUNT, REGEXP_REPLACE, REGEXP_STRSUB, REGEXP_INSRT)
      => �׷��Լ� : GROUPING / CUBE /ROLLUP
      => �����ͺ��̽� ���� (����ȭ) / Ʈ������ ����
      
      1. 3��
           => SELECT => ������ �˻� => ������Ʈ (80%)
                  ����, ����)
                       ------------------------------------------------------------------- 
                         SELECT (DISTINCT | *) * | column_list (������(���), �Լ�)
                         FROM table_name|view_name|SELECT~
                       ------------------------------------------------------------------- �ʼ� 
                         [
                                WHERE ���ǹ�(�񱳿�����, ��������, BETWEEN~AND,
                                                      IN, LIKE, NOT, NULL (ISNULL , IS NOT NULL))
                                GROUP BY �׷��÷�|�Լ� => �׷캰 ����
                                                ---------------- �÷��� ����
                                HAVING �׷� ���� => GROUP BY�� �־�� ��� ����
                                ORDER BY ���� �� �÷� | �Լ� (ASC | DESC)
                                                                          ----- ���� ����
                                => �����Ͱ� ���� ��� ���Ľÿ� INDEX ���
                                      INDEX_ASC(), INDEX_DESC()
                          ]
                          1) ������ (ROW����) => ���پ� ���� ���
                                 - ��� ������ : + , - , * , / => MOD() : %������
                                       => ROW���� ��� => �����ϴ� �Լ��� ����
                                 - �� ������ : = , <> , < , > , <= , >=
                                 - �� ������ : AND (����, �Ⱓ ����), OR (����, �Ⱓ�� ��� ���)
                                                                                     ---- ���� �˻�
                                 - BETWEEN ~ AND : AND ��� ��� => ���� ����
                                       => ����¡ ���, üũ��, ���� �Ⱓ ...
                                 - IN : OR �������� ��� => MyBatis : forEach
                                       => ���� ����
                                 - NOT : ���� => NOT IN , NOT LIKE , NOT BETWEEN
                                                        => !�� ������� �ʴ´�
                                 - NULL : ���� ���� ����
                                       => �ڹ� : NullPointException : �����߻�      
                                       => ����Ŭ : Null�� ����ó�� => ����� (null)
                                       => IS NULL , IS NOT NULL
                                             ex) WHRER ename = null => ó�� x
                                                  WHERE ename IS NULL => ó�� o
                                       => image�� ���� ���
                                 - LIKE : % => ���� ������ ����
                                            _  => ���� �ѱ���
                                              startsWith : ����% ====> index ���� o => ^����
                                              endsWith : %���� ====> index ���� x => ����$
                                              contains  : %����% ===> index ���� x => ����
                                                 ���Խ�
                                                     ���� : [��-�R] , [A-Za-z] , [0-9]
                                              => REGEXP_LIKE(�÷�, ���Խ�)

                          2) �����Լ�
                                 - ������ �Լ� : ROW ���� ó�� (�� �پ� ó��)
                                        ���� �Լ�
                                                SUBSTR => ���� �ڸ���
                                                      ����)   SUBSTR(�÷���, ������ġ, ����)
                                                                                      ---------- 1������ ����
                                                INSTR => ���� ��ġ ã��
                                                      ����)   INSTR(�÷���, ã�¹���, ������ġ, ���°)
                                                LENGTH => ������ ����
                                                      ����)   LENGTH(�÷���) : ��й�ȣ
                                                RPAD => ���� ������ ���ڶ�� ��� (������ ���� ���)
                                                      ����)   admin => ad***
                                                                RPAD(�÷���, ���ڰ���, '*')
                                                                                   ---------- LENGTH
                                                                => ���̵� ã�� / ���
                                            ** REPLACE : ���� ���� => & , | , "
                                                                => ������ ä�� (ä�ù��� ����)
                                                                => URL => &�� ��û�� ����
                                                                => http://localhost:8080/food_detail.jsp?fno=1&page=3
                                                                                                                       ------------------
                                                                                                                        ���̰�-> GET
                                                                                                                        ����� -> POST
                                                                     GET    /    POST    /     PUT    /    DELETE
                                                                   SELECT     INSERT       UPDATE      DELETE

                                                      ����)   REPLACE(�÷���, ��������, ������ ����)                                                                                   
                                                  => ������ �Լ� : TRIM() , INITCAP() , UPPER() , LOWER()
                                                                    => �ڹ��� String���� ó��

                                        ���� �Լ�
                                                  => MOD : ������ => %
                                                      ����)    MOD(����1, ����2) => ����1%����2%
                                                  => ROUND : �ݿø� = ���
                                                      ex)    ROUND(123.567,2) => .57                                                                  
                                                  => CEIL : �ø� = �������� ���ϱ�
                                                   ** TRUNC : ����
                                                         ex)  TRUNC(123.567,2) => .56

                                        ��¥ �Լ�
                                                  => SYSDATE : �ý��۽ð�, ��¥
                                                          ��������ڸ� �̿��ؼ� ����, ��ĥ��...
                                                          ex) SYSDATE-1 = ����
                                                               SYSDATE-7 = ��������
                                                  => MONTHS_BETWEEN : �Ⱓ�� ������
                                                        MONTHS_BETWEEN(���糯¥, ������¥)

                                        ��Ÿ �Լ�
                                                  => NVL : NULL�� ��� �ٸ������� ����
                                                          ����)    NVL(�÷���, ��ü��)
                                                                                |          |
                                                                                ---------- ���������� �����ؾ� �Ѵ�
                                                            ex)   NVL(ename, 0) => ����
                                                                   NVL(address, ' ') => o  => "(NULL), ' ' (space)
                                        ��ȯ �Լ� : ��¥, ���ڸ� ���ڿ� ��ȯ
                                                 TO_CHAR(����, '����')
                                                     ex)  TO_CHAR(1234567, '9,999,999') => 1,234,567
                                                 TO_CHAR(��¥,'����')
                                                     ex)  YYYY / RRRR => �⵵
                                                           MM => ��
                                                           DD => ��
                                                           HH / HH24 => �ð�
                                                           MI => ��
                                                           SS => ��
                                                           DY => ����
                                                         => ��¥ + �ð� => �������� / ��� ...
                                                         => ��¥ (�ڹٿ���ó��)
                                                         => �ð� (�ڹٿ��� ó�� ��ƴ�) => �ڹ� 12:00
                                 - ���� �Լ�    : COLUMN ���� ó��
                                          COUNT : row�� ����
                                                       => �α��� / ���̵� üũ / ��ȭ��ȣ üũ
                                                       COUNT(*) / COUNT(�÷�)
                                                       -----------   ----------------
                                                      NULL ����    NULL ����
                                          MAX /MIN
                                          ----- �ڵ� ���� ��ȣ �̿� => SEQUENCE
                                          SUM / AVG
                                                    ----- ���
                                          ----- �� ��
                                          => GROUPING / CUBE / ROLLUP
                                 *** GROUP BY�� ���� ��� => ������ �Լ�, �����Լ��� ���� ��� �Ұ�

                          3) ���� / �������� => ������Ʈ (�ݵ�� SQLDeveloper)
                              �ڹ� => "" 
                                          LIKE ���常 ���� '%A%'
                                            => ����Ŭ : '%'||?||'%'
                                            => MYSQL " CONCAT ('%',?,'%') => MARIADB ����
                             
                           ���̺��� 2�� �̻󿡼� ������ ���� : JOIN => SELECT������ ��� ����
                                = INNER JOIN (������)
                                        - EQUI_JOIN (=)
                                        - NON_EQUI_JOIN ( =�ܿ� �ٸ� ������ : ��������, BETWEEN) 
                                              ����) 
                                                       ����Ŭ ���� 
                                                             SELECT A.col, B.col
                                                             FROM A,B
                                                             WHERE A.col = B.col;
                                                       ǥ�� ���� (ANSI JOIN) => MySQL, MSSQL
                                                             SELECT A.col, B.col
                                                             FROM A (INNER) JOIN B   => INNER �� ���� ����
                                                             ON A.col = B.col;
                                                      ===> SELECT A.col
                                                                FROM A
                                                                INTERSECT (������)
                                                                SELECT B.col
                                                                FROM B
                                = OUTER JOIN (������ �� �ٸ� ������)                                        
                                               ����) 
                                                     = LEFT OUTER JOIN
                                                       ����Ŭ ���� 
                                                             SELECT A.col, B.col
                                                             FROM A,B
                                                             WHERE A.col = B.col(+);
                                                       ǥ�� ���� (ANSI JOIN) => MySQL, MSSQL
                                                             SELECT A.col, B.col
                                                             FROM A LEFT OUTER JOIN B 
                                                             ON A.col = B.col;
                                                      ======> A INTERSECT B AND A MINUS B
                                                      = RIGHT OUTER JOIN
                                                       ����Ŭ ���� 
                                                             SELECT A.col, B.col
                                                             FROM A,B
                                                             WHERE A.col(+) = B.col;
                                                       ǥ�� ���� (ANSI JOIN) => MySQL, MSSQL
                                                             SELECT A.col, B.col
                                                             FROM A RIGHT OUTER JOIN B 
                                                             ON A.col = B.col;
                                                        ======> A INTERSECT B AND B MINUS A
                                               *** UNION /UNION ALL / INTERSECT / MINUS
                                                 ���տ�����
                                                    A 1, 2, 3, 4 ,5
                                                    B 4, 5, 6, 7, 8
                                                    A UNION B ==> 1,2,3,4,5,6,7,8
                                                    A UNION ALL B ==> 1,2,3,4,5,4,5,6,7,8
                                                    A INTERSECT B ==> 4,5                                                    
                                                    A MINUS B ==> 1,2,3
                                                    B MINUS A ==> 6,7,8                                                     

                           SQL���� 2�� �̻� �����ϴ� ���� : SUBQUERY
                                     = ��������
                                          - ������ �������� (�÷� 1��, ����� 1��)
                                                 �ַ� ����ϴ� ������ : �񱳿�����
                                                   ����)    SELECT * 
                                                              FROM table_name
                                                              WHERE �÷� ������ (SELECT ~)
                                                                                    |      ----------- ����� 1��, ���̺��� �ٸ� ��쵵 �ִ�
                                                                                    | �� ������
                                          - ������ �������� (�÷� ��, ����� ������)
                                                 IN : ��ü ����
                                                 ANY, ALL : MAX, MIN
                                                     ����)   SELECT *
                                                               FROM table_name
                                                               WHERE �÷� ������ (SELECT ~)
                                                                                     |      ----------
                                                                                     |       ����� ������
                                                                                     | IN => ����� ��ü ����
                                                                                     | ANY (SOME)
                                                                                         > ANY(10, 20, 30) => MIN (10)
                                                                                         < ANY(10, 20, 30) => MAX (30)
                                                                                     | ALL
                                                                                         >= ALL(10, 20, 30) => MAX (30)
                                                                                         <= ALL(10, 20, 30) => MIN (10)
                                          - �����÷� �������� ( �÷� ������, ����� 1��)
                                                 ���տ��� ���� �ַ� ��� ( ���󵵴� ���� ����)
                                         -------------------------------------------------------------------- WHERE
                                     = ��Į�� �������� : �÷� ��� ���
                                                                 ---------- �ݵ�� ������� 1��
                                                     ����)    SELECT �÷� (SELECT ~)
                                                                                  ------------ ������� 1��, �ٸ� ���̺��� ����
                                                                FROM table_name
                                                     ==> ���� ��� ��� / ������ ���� �� ���
                                                     ==> �̹� SQL ������ ������ �� ��� => �ٸ� ���̺��� �߰������� ������ ����
                                                                                                                 => ��������
                                                     ==> FUNCTION �� ���� ó���ϴ� ��쵵 �ִ�
                                     = �ζ��κ� : ���̺� ��� ��� (����)
                                                     ����)    SELECT *
                                                                FROM (SELECT ~)
                                                                => TOP-N : 1������ ���� �����´�
      
      2. 4��
           => CREATE / DROP / TRUNCATE / RENAME / ALTER
           => DML (INSERT, UPDATE, DELETE)
           1. DML : ������ ���� => �� ������ => CRUD
                         1) ������ ���� : INSERT
                               = ��ü ������ ����
                                      INSERT INTO table_name VALUES(��, ��...)
                                                                                   ---------- ��� �÷��� ����
                                                                                                ������� ����
                                                                                                ���� => ''
                                                                                                ��¥ => ���� ��¥�� �ƴѰ��
                                                                                                              'YY/MM/DD'
                                                                                                             ���� ��¥ : SYSDATE
                                       *** ps.setString(1, vo.getName()) => �ڵ����� '' �ٴ´�
                                       *** ����Ŭ������ ���� : COMMIT
                                       *** �ڹٿ����� �ڵ����� COMMIT�� �ȴ� (Auto Commit())
                                        => INSERT / INSERT / INSERT / INSERT ...
                                        => conn.setAutoCommit(false)
                                             INSERT / INSERT / INSERT / INSERT ...
                                             conn.setAutoCommit() 
                               = ���ϴ� �����͸� ���� = NULL���� ���, DEFAULT ����
                                        INSERT INTO table_name(�÷�, �÷�, �÷�...)
                                          VALUES(��, ��, ��...)
                         2) ������ ���� : UPDATE
                                UPDATE table_name
                                SET �÷�=��, �÷�=�� ...
                                      �÷�=SYSDATE
                                [WHERE ����] => ���� ��쿡�� ��ü ����
                         3) ������ ���� : DELETE
                                DELETE FROM table_name
                                [WHERE ����]
           *** COMMIT�� ���� => ROLLBACK �ȵ�   
      ---------------------------------------------------------------------------------------------------------------------------------------- DML
                                       
           DDL : ���� ���
                 TABLE : ���� ����
                 VIEW  : ���� ���̺�
                 SEQUENCE : �ڵ� ���� ��ȣ
                 SYNONYM  : ���̺� ��Ī
                 INDEX : ������ (���� �˻� ����ȭ)
                 FUNCTION / PROCEDURE / TRIGGGER
                 -------------------------------------------- ����Ŭ : OBJECT(��ü)
              1. TABLE 
                   1) ��������
                         = ���� => �ѱ� (�ѱ��� 3byte)
                                CHAR(1~2000byte) : ���� ����Ʈ (���ڼ��� ���� ���)
                                VARCHAR2(1~4000byte) : ���� ����Ʈ (���ڼ��� ���� �޸𸮰� �޶�����)
                                CLOB(4�Ⱑ) : ���� ����Ʈ
                         = ���� => NUMBER : ����/�Ǽ� NUMBER(8,2)
                                         NUMBER(2,1) - ����
                         = ��¥ => DATE, TIMESTAMP
                                         ------ �⺻
                   2) ����ȭ�� ������ => �ʿ��� �����͸� ÷��
                         => NOSQL (������, ElasticSearch) 
                         => ��������
                                 = �̻����� ���� (����, ����) 
                                         - �ߺ��� ���� ������ ���� = �⺻Ű (������)
                                                 : ���Ἲ = PRIMARY KEY
                                         - �ܺ� ������ ���� = �ܷ�Ű, ����Ű
                                                 : ���� ���Ἲ = FOREIGN KEY
                                 = NOT NULL : ���� �ݵ�� ����
                                 = UNIQUE : �ߺ��� ���� �� (NULL ���)
                                        => PRIMARY KEY ��ü ��
                                 = CHECK : ������ ���� ����
                                 = PRIMARY KEY : NOT NULL + UNIQUE
                                        => ���̺� �ݵ�� 1�� �̻� ���� => �⺻Ű
                                 = FOREIGN KEY : �ٸ� ���̺��� ������ ����
                   
                   3) ������ ����
                   4) �������� ����
                   5) ���� ����
                         ����)   ���̺��
                                    1) �ѱ� / ���ĺ� => ��ҹ��� ������ ����
                                                                 ���� ����Ŭ�� ������ �빮�ڷ� ����ȴ�
                                                                  user_tables : PRIMARY KEY (�ߺ� �Ұ�)
                                    2) ���ڼ��� 30byte (�ѱ� 10����)    
                                    3) Ű���� ��� �Ұ� (SELECT, INSERT...)
                                    4) ���� ��� ���� (�ڿ� ����ؾ��Ѵ�)
                                    5) Ư������ ��� ���� ( _ ) => 5~10��
                                   CREATE TABLE table_name(
                                        �÷��� �������� [��������],
                                                                ---------- ������ ���� ����
                                                                             DEFAULT / NOT NULL
                                                                             ---------- �켱����
                                        �÷��� �������� [��������],
                                        �÷��� �������� [��������],
                                        [��������], => PK, CK, FK, UK
                                        [��������]
                                   ); 
                                  ���������� ��� / ����
                                  ��� => 
                                  CREATE TABLE table_name(
                                        id VARCHAR2(20) PRIMARY KEY,
                                        name VARCHAR2(50) NOT NULL
                                        ...
                                  );
                                     => ���������� �����ϱ� ��ƴ�

                                  ���� => ���������� �̸� �ο�
                                               �Ѱ��� ���̺� ����
                                               ---------------- user_constraints : �ߺ����� ����
                                               table��_�÷���_nn, _pk ...
                                   CONSTRAINT table��_�÷���_nn NOT NULL

                                   CONSTRAINT table��_�÷���_pk PRIMARY KEY

                                   CONSTRAINT table��_�÷���_ck CHECK (�÷� IN('',''))

                                   CONSTRAINT table��_�÷���_uk UNIQUE(�÷�)

                                   CONSTRAINT table��_�÷���_fk FOREIGN KEY(�÷�)
                                   REFERENCES �������̺�(�÷�) 
                                    => FOREIGN KEY 
                                            ���� �������̺� ���� => ���߿� �����ϰ� �ִ� ���̺� ����
                                            �����ÿ��� �ݴ�� ����
                 ------------------------------------------------------------------------------------------------------
                 = ���� : ALTER = ����
                      ����) 
                              = �÷� �߰�
                                ALTER TABLE table_name ADD likecount NUMBER DEFAULT 0 => ���ƿ� �߰�
                                                                           �÷���     �������� [�������� | DEFAULT]
                              = �÷� ����
                                ALTER TABLE table_name DROP COLUMN �÷���
                              = �÷� ���� 
                                ALTER TABLE table_name MODIFY �÷��� ��������
                              = �÷��� ����
                                ALTER TABLE table_name RENAME COLUMN old_name TO new_name

                          ==> ALTER�� �ַ� �����Ͱ� �Է��� �ִ� ��쿡 �ַ� ��� 
                          ==> ���������� ���� ���
                  = ���̺� ����
                       DROP TABLE table_name : ���� ����
                  = �����͸� ����
                       TRUNCATE TABLE table_name : ���̺��� ����, �����͸� ����
                  = RENAME
                       RENAME old_name To new_name
            -------------------------------------------------------------------------------------------------------------
             SEQUENCE : �ڵ� ���� ��ȣ
                  CREATE SEQUENCE table��_�÷���_seq
                      - START WITH =====> ���۹�ȣ
                      - INCREMENT BY ===> ������
                      - NOCACHE ======> �̸� �����ϴ� �� ���� ���
                      - NOCYCLE =======> �������̸� �ٽ� ó������
                  *** �ʱ�ȭ => DROP �� ���
                 = ���� : DROP SEQUENCE seq��
            ------------------------------------------------------------------------------------------------------------------
            VIEW : ������ �ʿ�, SQL ������ �� ���, ����
                      = ������ ���̺��� �����ؼ� ���� ���� ���̺�
                  1.  ����
                        1) �ܼ��� : ���̺� 1�� ����
                                *** DML�� ����
                                    ------------- �丸 ����Ǵ� ���� �ƴ϶�, �����ϴ� ���̺��� ���� �ȴ�
                                    => WITH READ ONLY : �б� ����
                        2) ���պ� : ���̺� ������ ���� (JOIN, SUBQUERY)
                                *** SQL ���� �ܼ�ȭ => ���� �� ����
                        3) �ζ��κ� : ���̺� ��� SELECT ���         
                                => user_views�� ���� : SQL���常 ����ȴ�
                  2. ����
                         CREATE VIEW view_name
                         AS
                           SELECT ~~ (���� �� ����)
                           ------------- JOIN / SUBQUERY / GROUP BY...
                  3. ����
                         CREATE OR REPLACE VIEW view_name
                         AS
                           SELECT ~~
                  4. ����
                         DROP VIEW view_name
                  5. ���� VIEW�� �����ϸ� ����� ���� ����
  ---------------------------------------------------------------------------------------------------------------------------
          INDEX : �˻��� ���� (����ȭ)
                  ����)
                             CREATE INDEX index�� ON table��(�÷��� (ASC|DESC))
                             CREATE INDEX index�� ON table��(�÷���, �÷���)
                               => �˻� �ӵ� / ����
                                      - INDEX_ASC()
                                      - INDEX_DESC()
                                   * ���� ����ϴ� �˻�� �ִ� ���
                                      => �����Ͱ� ���� ��쿡�� ���x
                                            �����Ͱ� ���� ��� ��� o
                                   * JOIN ���� ����ϴ� �÷��� �ִ� ���
                                   * NULL ���� ���� �����ϴ� �÷��� �̿�
                                   * INSERT / UPDATE / DELETE �� ���� ��쿡�� �ӵ��� ���� �ȴ�
                                         => REBUILD�� ����ؼ� ó��
                    ����)
                             DROP INDEX index��        
-------------------------------------------------------------------------------------------------------------------------------
         rownum (222p)
             => ����Ŭ���� �����ϴ� ���� �÷� (SQL ���忡���� ���)
             => row ���� ��ȣ�� �Է�
             => ��ȣ �ߺ��� ����
             => SQL �������� ROWNUM�� ���� ���� �� �� �ִ� => �ζ��κ�
             => �� �� / ������ ���
             => TOP-N : ���������� �� �� 
                  -------- �߰����� �ڸ����� ��ø ���������� ���
---------------------------------------------------------------------------------------------------------------------------------
        
                                                                               
*/








































