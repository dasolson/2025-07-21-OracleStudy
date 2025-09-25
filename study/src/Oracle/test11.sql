/* 
1. GROUP BY 
      값은 값을 가진 컬럼을 묶어서 따로 통계






실행순서
     SELECT -------4
     FROM --------1
     GROUP BY ---2
     HAVING ------3
     ORDER BY ----5

=> 컬럼 값중에 같은 값을 가지고 있는 항목 찾아 그룹
      ex) emp
             deptno (부서번호) / job(직위) / 입사년도별 (hiredate)
=> SQL 문장 
      GROUP BY 컬럼 / 함수

      SELECT 컬럼명|함수명, 집계함수...
      FROM table_name
      GROUP BY 컬럼명|함수명
      HAVING 조건(그룹에 대한 조건) => GROUP BY 있는 경우만 사용
      --------- 필요시에만 사용
      ORDER BY 컬럼명|함수명

-- 부서별 급여 평균
set linesize 250
set pagesize 25

SELECT deptno, ROUND(AVG(sal))
FROM emp
GROUP BY deptno
ORDER BY deptno;

-- 부서별 인원수, 급여 총합, 급여평균, 최대값, 최소값
SELECT deptno , COUNT(8) "인원수",
                       SUM(sal) "급여총합",
                       ROUND(AVG(sal)) "급여평균",
                       MAX(sal) "최대값",
                       MIN(sal) "최소값"
FROM emp
GROUP BY deptno
ORDER BY deptno ASC;

-- 직위별 
SELECT job , COUNT(8) "인원수",
                       SUM(sal) "급여총합",
                       ROUND(AVG(sal)) "급여평균",
                       MAX(sal) "최대값",
                       MIN(sal) "최소값"
FROM emp
GROUP BY  job
ORDER BY  job ASC;

-- 입사년도별
SELECT TO_CHAR(hiredate,'YYYY') , COUNT(8) "인원수",
                       SUM(sal) "급여총합",
                       ROUND(AVG(sal)) "급여평균",
                       MAX(sal) "최대값",
                       MIN(sal) "최소값"
FROM emp
GROUP BY  TO_CHAR(hiredate,'YYYY')
ORDER BY TO_CHAR(hiredate,'YYYY') ASC;

-- 입사 요일별 -- MyBatis => 별칭
-- 1차 => Database : MYBatis (XML, Annotation)
SELECT TO_CHAR(hiredate,'DY"요일"') "요일", 
                       COUNT(8) "인원수",
                       SUM(sal) "급여총합",
                       ROUND(AVG(sal)) "급여평균",
                       MAX(sal) "최대값",
                       MIN(sal) "최소값"
FROM emp
GROUP BY  TO_CHAR(hiredate,'DY"요일"')
ORDER BY TO_CHAR(hiredate,'DY"요일"') ASC;

-- 그룹 조건 : HAVING
-- 평균 급여가 2000 이상인 부서만 출력
SELECT deptno, COUNT(*), AVG(sal)
FROM emp
GROUP BY deptno
HAVING AVG(sal) >= 2000;

-- 부서별 인원이 4명이상인 부서의 인원수, 급여의 총합
SELECT deptno, COUNT(*), SUM(sal)
FROM emp
GROUP BY deptno
HAVING COUNT(*) >= 4;
*/
/*
     159p
        GROUP BY에서 사용하는 함수 (집계함수) => CUBE / ROLLUP
        ------------- MIN / MAX / COUNT / AVG / SUM
         | 같은 값을 가지고 있는 컬럼 / 함수 
     161p 주의점 / 실행순서
        => 마이페이지 / 관리자페이지
        => 단일행 함수 : ROW 단위
        => 집합 함수 : COLUMN 단위
        => 단일행 함수와 집합 함수는 혼합 불가
              예외) 그룹으로 사용하는 함수가 나오면 사용가능 
                SELECT ename, UPPER(ename), COUNT(*) => 오류
        => 단일 그룹 / 다중 그룹
              - 부서별 => 직위별 , 입사일별 => 요일별로
                 SELECT deptno, job
                 ...
                 GROUP BY deptno, job

SELECT deptno, job,COUNT(*), SUM(sal),AVG(sal)
FROM emp
GROUP BY deptno, job
ORDER BY deptno ASC;

SELECT TO_CHAR(hiredate,'YYYY'),TO_CHAR(hiredate,'DY"요일"'),COUNT(*), SUM(sal),AVG(sal)
FROM emp
GROUP BY TO_CHAR(hiredate,'YYYY'),TO_CHAR(hiredate,'DY"요일"')
ORDER BY TO_CHAR(hiredate,'YYYY') ASC;
*/
/*
     교재에서 사용하는 테이블
       orders : 구매내역, book : 책 정보, customer : 회원정보
       -------
            ORDERID      => 구매번호 => 중복없는 데이터(PRIMARY KEY)
            CUSTID        => 회원 ID
            BOOKID       => 책 ID
            SALEPRICE    => 가격
            ORDERDATE => 구매일  
          

SELECT orderid, name, bookname, saleprice, orderdate
FROM orders, customer, book
WHERE orders.custid = customer.custid
AND orders.bookid = book.bookid;

-- 1. 가장 비싼책을 출력
SELECT MAX(saleprice)
FROM orders;

SELECT bookname
FROM book
WHERE price = (SELECT MAX(saleprice)
FROM orders);

-- 160p
-- 가격이 8000원 이상 도서를 구매한 고객별 주문도서의 총수량
SELECT custid, COUNT(*) as 도서수량 --5
FROM orders ------------------------------1                                
WHERE saleprice >= 8000 ---------------2
GROUP BY custid -------------------------3
HAVING COUNT(*) >= 2  ----------------4
ORDER BY custid;

-- 고객별 도서수량, 총액 출력
SELECT custid "고객아이디", COUNT(*) "도서수량", SUM(saleprice)"총액"
FROM orders
GROUP BY custid
ORDER BY custid;
*/


























