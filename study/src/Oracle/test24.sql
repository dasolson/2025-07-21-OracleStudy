/*
    2025.09.11 전체 정리, 튜닝
     => PL / SQL : FUNCTION, PROCEDURE. TRGGER
     => 데이터베이스 설계 / 정규화
   -------------------------------------------------------------
-- 2025.09.10
    -- 222p (rownum), 서브쿼리, 시노님, 시퀀스, 인덱스 
    1. ROWNUM
         = 실제 컬럼이 아니고, 가상 컬럼이다 => 각 ROW 번호 (오라클 처리)
         = 결과값에 따라변경이 가능
         = ORDER BY, INDEX를 이용하면 변경이 가능
         = 주된 사용처
              인기순위 10개, 페이징 기법, 이전 / 다음(상세보기)
         = 사용시에는 SELECT, WHERE 에서 주로 사용       
              
*/
/*
set linesize 250
set pagesize 25
SELECT empno, ename, job, hiredate, sal, rownum
FROM emp;

-- rownum 순서 변경 => 인라인뷰 사용
SELECT empno, ename, job, hiredate, sal, rownum
FROM (SELECT * FROM emp ORDER BY sal DESC);

-- 가장 많이 사용되는 형태
-- 인기순위 5개
SELECT name, rownum
FROM (SELECT name, hit FROM food ORDER BY hit DESC)
WHERE rownum <=5;
*/
/*
    rownum의 단점
      1. TOP-N : 1부터 ~원하는 갯수 만큼 출력 가능
         --------  중간에는 자를 수 없다
      2. rownum을 변경 => 서브쿼리 사용 => 반드시 ORDER BY 사용
*/
-- 범위 => sal값이 6~10위 => 페이징 기법
-- 중첩 서브쿼리 사용
-- 방법 1
/*
SELECT empno, ename, job, num
FROM (SELECT empno, ename, job, rownum as num
FROM (SELECT empno, ename, job
FROM emp ORDER BY empno ASC))
WHERE num BETWEEN 6 AND 10;
*/
/*
-- 방법 2
SELECT empno, ename, job
FROM (SELECT empno, ename, job, rownum as rn
FROM (SELECT empno, ename, job 
FROM emp ORDER BY empno ASC) e
WHERE rownum <= 10
)
WHERE rn >=6;
*/
-- 방법 3 => ROW_NUMBER => 한개의 서브쿼리 사용 => 12c
-- ROW_NUMBER() OVER (ORDER BY empno)
/*
SELECT empno, ename, job
FROM (SELECT empno, ename, job, ROW_NUMBER() OVER (ORDER BY empno) AS
rn
FROM emp)
WHERE rn BETWEEN 6 AND 10;
*/
/*
       1. INSERT => rownum / rowid (인덱스)
       전체 번호 설정 : SELECT rownum 컬럼명... => 이전 / 다음의 상세보기 이동
       상위 N (TOP-N) : WHERE rownum <= N   => 인기순위, 급상승
       N부터 M까지 : rownum 서브쿼리 + BETWEEN N AND M
       정렬 후 번호 설정 (변경) => 서브쿼리 이용
       최신 방법 : ROW_NUMBER() => 권장
*/
/*
      시퀀스 : SEQUENCE
          1. 독립적으로 존재, 테이블과 직접적으로 연결되지 않는다
          2. 값을 읽는 경우 
                = 현재값 : currval
                = 다음값 : nextval
          3. PRIMARY KEY => 중복 불가
                                      중복 없는 자동 증가번호 생성
          4. 초기값 : START WITH
          5. 증가값 : INCREMENT BY
          6. CACHE : 메모리에 미리 값을 저장한 후에 사용
                         성능 향상,  단점 : 번호가 일정하지 않을 수 있다
                         NOCACHE
          7. 대용량 데이터를 INSERT 할 경우 성능 저하 
             ---------------- SELECT NVL(MAX(no)+1,1) FROM food
                                  | MyBatis 에서 증가번호 생성시 많이 사용
                                       <selectKey statement=""> : 자동 증가번호
                                       @SelectKey 
          8. 속성값
                = START WITH => 초기값 i =1
                = INCREMENT BY => 증가값 i++, i+=2
               ------------------------------
                = MINVALUE => 1 
                = MAXVALUE => 100 
               ------------------------------ 증가값 무한대
                = CACHE => 20 
                = NOCACHE 
                = CYCLE => 100까지 도달 => 다시 1부터 시작 
                = NOCYCLE => 100까지만
           * 단점 : 삭제시에 변경이 없다 (일괄적이지 않다, 번호 빵꾸)
           * 장점 : 중복 번호가 없다
*/
/*
=> 테이블에 정보 한개의 테이블에 저장
     user_tables => table_name PRIMARY KEY
CREATE TABLE myfood (
    fno NUMBER,
    name VARCHAR2(30) CONSTRAINT mf_name_nn NOT NULL,
    cate VARCHAR2(20) CONSTRAINT mf_cate_nn NOT NULL,
    price NUMBER,
    CONSTRAINT mf_fno_pk PRIMARY KEY(fno),
    CONSTRAINT mf_price_ck CHECK(price >= 800 AND price <= 5000)
);
중복 방지 : user_sequences
=> constraint : 제약조건 => user_constraints : table명_컬럼명_nn
CREATE SEQUENCE myfood_fno_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 100
    NOCACHE
    NOCYCLE;
*/
/*
-- 시퀀스 이용 방법 => 초기화 => DROP SEQUENCE myfood_fno_seq
-- 크롤링 실패 => TRUNCATE / DROP SEQUENCE
INSERT INTO myfood VALUES(myfood_fno_seq.nextval, '김밥','한식',2500);
INSERT INTO myfood VALUES(myfood_fno_seq.nextval, '라면','한식',4000);
INSERT INTO myfood VALUES(myfood_fno_seq.nextval, '피자','양식',5000);
INSERT INTO myfood VALUES(myfood_fno_seq.nextval, '치킨','양식',5000);
INSERT INTO myfood VALUES(myfood_fno_seq.nextval, '짜장면','중식',3000);
INSERT INTO myfood VALUES(myfood_fno_seq.nextval, '꼬마김밥','한식',800);
INSERT INTO myfood VALUES(myfood_fno_seq.nextval, '초밥','일식',1990);
INSERT INTO myfood VALUES(myfood_fno_seq.nextval, '된장찌개','한식',1500);
COMMIT;

SELECT myfood_fno_seq.currval FROM DUAL;

SELECT myfood_fno_seq.nextval FROM DUAL;

INSERT INTO myfood VALUES(myfood_fno_seq.nextval, '우동','일식',1800);
COMMIT;
*/















