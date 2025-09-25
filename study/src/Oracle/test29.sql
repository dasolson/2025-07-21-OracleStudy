-- ������ ����
/* 
        1. ��������
             = ���� : CHAR(1~2byte), VARCHAR2(1~4000byte), CLOB (4�Ⱑ)
             = ���� : NUMBER = int / double NUMBER(2,1)
             = DATE 
        2. Ŭ���� ���� ���
             = CREATE TABLE table_name(
                     �÷��� �������� [��������],
                     �÷��� �������� [��������],
                     �÷��� �������� [��������],  => DEFAILT / NOT NULL
                     [��������]...  => PK, UK, CK, FK
                 )
         3. �÷� ���� = �������� Ȯ�� = ���̺� ����
                                                     ------------- �ߺ����� / ���ϰ� ����
         4. ���� ����
             = �̹��� ���� (�����̹���) / �̹��� ������
             = ��ü�� / ���� / ��ȭ / �ּ� / ���� / �׸� / �����ð� / ���� / �Ұ� / ���ݴ�
              
*/
/*
CREATE TABLE menupan_food(
    fno NUMBER,
    name VARCHAR2(200) CONSTRAINT menuf_name_nn NOT NULL,
    type VARCHAR2(100) CONSTRAINT menuf_type_nn NOT NULL,
    phone VARCHAR2(20),
    address VARCHAR2(500) CONSTRAINT menuf_address_nn NOT NULL,
    score NUMBER(2,1),
    theme CLOB,
    price VARCHAR2(50),
    time VARCHAR2(100),
    parking VARCHAR2(100),
    poster VARCHAR2(260) CONSTRAINT menuf_poster_nn NOT NULL,
    images CLOB,
    content CLOB,
    hit NUMBER DEFAULT 0,
    CONSTRAINT menuf_fno_pk PRIMARY KEY(fno)
);

CREATE SEQUENCE menuf_fno_seq
      START WITH 1
      INCREMENT BY 1
      NOCACHE
      NOCYCLE;

-- �̸� �˻� ����ȭ
CREATE  INDEX idx_menuf_name ON menupan_food(name);
-- ���� ���� ����ȭ
CREATE  INDEX idx_menuf_type ON menupan_food(type);
-- �ּ� �˻� 
CREATE  INDEX idx_menuf_address ON menupan_food(address);
-- ���� ����
CREATE  INDEX idx_menuf_score ON menupan_food(score);
-- ��ȸ��  (�α���� �˻�)
CREATE  INDEX idx_menuf_hit ON menupan_food(hit);
*/













