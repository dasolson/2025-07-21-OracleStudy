-- ���� �Լ� : column����(���� �Լ�)
/*
    -- SQL���� ���� ���� ���� => 144p
    -- SELECT ���� => 145p
    -- ������ => 149p
    -- �����Լ� => ������ �Լ� => 209p~210p
    -- ���� ���� => 211p
    -- ���� ���� => 213p
    -- ��¥ ���� => 216p
    -- ��ȯ ���� => 218p
    -- NULL =>219p
       
    COUNT : row�� ����
           - COUNT(*) : NULL ����
           - COUNT(column) : NULL ����

      => �α��� ���̵� ���� ���� Ȯ��
      => ���̵� �ߺ� üũ
      => �˻� ����
      => ��ٱ��� 

   MAX : �ִ밪 ==> MAX(�÷���)
      => �ڵ� ������ȣ
      => �ߺ����� ������ ÷�� (PRIMARY KEY)
      => ��ȣ / ��¥(�����)
                    -------------- ����� �Է� (������, ����...) 

   MIN : �ּҰ� => ���� ����
      
   SUM : ����
   AVG : ���

*/
/*
SELECT COUNT(*)
FROM emp
WHERE empno = 8000;

SELECT COUNT(*)
FROM food
WHERE address LIKE '%����%';
*/
SELECT MAX(empno), MAX(empno)+1
FROM emp;























