-- JOIN
/*
      자바 프로그램 : 관련된 소스를 어떻게 묶어서 사용 할 건가
                     같은 데이터 여러개 => 배열
                     다른 데이터 여러개 => 클래스
                     명령어 관련 => 메소드
                    ------------------------------------- 클래스 
      오라클 프로그램
                  묶는 방법
                     1. 같은 컬럼끼리 묶어서 사용 : GROUP BY
                     2. 같은 데이터를 가지고 있는 테이블 : JOIN
                     3. 다른 데이터를 묶어서 연결한다 : SUBQUERY
                 *** 여러개 테이블에서 필요한 데이터 추출 : JOIN
                 *** SQL문장이 여러개인 경우 SQL을 한개로 묶어서 사용 : SUBQUERY
                 => SQL => 5개 => 데이터 추출 => 1개

         1. 조인의 필요성
               1) 관계형 데이터베이스 (RDBMS) => 오라클
                    = 모든 데이터를 하나의 테이블에 몰려 있는 것이 아니라 여러개의 테이블에 정규화되어 분산되어있다
                         = 각 테이블끼리 특정한 규칙과 관계를 가지고 있게 설계
                    = 여러개 테이블에서 관련된 정보를 읽어온다  
                        ex)      
                                 학생
                                   = 학번
                                   = 이름
                                  *** 제거 = 전공(복수)
                                 --------------------------------------------
                                   학번         이름        전공 
                                 --------------------------------------------
                                      1         홍길동       국어
                                      2         홍길동       영어, 수학
                                      3         박문수       영어,수학,국어   ==> 원자성
                                 --------------------------------------------

                                  학생 : 학번, 이름
                                  전공 : 학번, 전공
                                 -----------------
                                  학번      전공
                                 -----------------
                                     1       국어
                                     2       영어
                                     2       수학
                                     3       영어
                                     3       수학
                                     3       국어
                                 ----------------- 
          2. JOIN 기법
               => 가장만이 사용되는 기법 (INNER JOIN)
               1) EQUI JOIN         : 같은 값을 가지고 있는 경우, NULL값인 경우 처리 불가
               2) NON-EQUI-JOIN : 같은 값을 가지고 있는 것이 아니고 포함된 경우        
                       ex)  호봉제, 내신성적...

*/
/*
CREATE TABLE salgrade(
     grade NUMBER,
     losal NUMBER,
     hisal NUMBER
);
INSERT INTO salgrade VALUES(1,700,1200);
INSERT INTO salgrade VALUES(2,1201,1400);
INSERT INTO salgrade VALUES(3,1401,2000);
INSERT INTO salgrade VALUES(4,2001,3000);
INSERT INTO salgrade VALUES(5,3001,5000);
COMMIT;
*/
/*
    1) INNER JOIN
         = 같은 값일 경우, 포함된 경우
            ----------------- 교집합인 경우
            EQUI=JOIN        : = 연산자 사용
            NON-EQUI-JOIN : = 아닌 연산자 사용(BETWEEN, 논리 연산자)
         주의점) 
            양쪽의 테이블에서 같은 컬럼을 가지고 있는 경우
            반드시 구분 후 사용
           ex)  emp => deptno => emp.deptno
                 dept => deptno => dept.deptno
                 FROM emp e (별칭) => e.deptno
                          ---------------
                          테이블 명이 긴 경우 (30자 제한)
                 CREATE TABLE 이이르으음이기이인테이브을 e(별칭)
                 같은 테이블에서 조인
                 ------------------------ SELF JOIN
                 FROM emp e1, emp e2
                 => 이름, 사수번호
           *** JOIN은 항상 같은 컬럼을 비교하는게 아니다
                => 컬럼이 같은 값을 가지고 있어야 한다    
                   ex) 
                         게시판 : no
                         댓글    : no, bno
                                          ---- 게시판
                       
                         맛집 : no
                         댓글 : no, fno
                                       ---- 맛집

                1) emp : 사원정보
                     empno, ename, job, mgr, hiredate, sal, comm, deptno
                   dept : 부서정보
                     deptno, dname(부서명), loc(근무지)
          
          JOIN의 형식
             1) 오라클 JOIN
                   SELECT 컬럼명(A table), 컬럼명(B table)
                   FROM A,B
                   WHERE A.col = B.col
                     => 다른 조건이 있는 경우에는 반드시 AND 사용

             2) ANSI JOIN 
                   SELECT 컬럼명(A table), 컬럼명(B table)
                   FROM A (INNER)JOIN B
                                ------- 생략 가능
                   ON A.col = B.col
                                 | 같은 값인 경우 => 교집합
            
             3) NATURAL JOIN
                ------------------- 단점 : 같은 컬럼명이어야 한다
                    SELECT 컬럼(A table), 컬럼(B table)
                    FROM A NACURAL JOIN B

             4) JOIN USING   
                ------------------- 단점 : 같은 컬럼명이어야 한다
                    SELECT 컬럼(A table), 컬럼(B table)
                    FROM A JOIN B USING(컬럼)
*/
-- 사번 , 이름, 직위, 입사일, 급여, 부서명, 근무지, 부서번호
/*
     사번 , 이름, 직위, 입사일, 급여 : emp
     부서명, 근무지, 부서번호 : dept
     부서번호 : emp, dept => 어느 테이블에서 가져올건가
                   emp.deptno, dept.deptno : 선택 안하면 애매한 정의 오류 발생

SELECT empno, ename, job, hiredate, sal, dname, loc, emp.deptno
FROM emp, dept
WHERE emp.deptno = dept.deptno;

SELECT empno, ename, job, hiredate, sal, dname, loc, emp.deptno
FROM emp JOIN dept
ON emp.deptno = dept.deptno;

SELECT empno, ename, job, hiredate, sal, dname, loc, deptno
FROM emp NATURAL JOIN dept;

SELECT empno, ename, job, hiredate, sal, dname, loc, deptno
FROM emp JOIN dept USING(deptno);

SELECT empno, ename, job, hiredate, sal, dname, loc, e.deptno
FROM emp e, dept d
WHERE e.deptno = d.deptno;

SELECT empno, ename, job, hiredate, sal, dname, loc, e.deptno
FROM emp e JOIN dept d
ON e.deptno = d.deptno;
*/
-- SELF JOIN
/*
SELECT e1.ename "본인", e2.ename "사수명"
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno;

SELECT e1.ename "본인", e2.ename "사수명"
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno(+);
*/
/*
SELECT empno, ename, sal, grade
FROM emp, salgrade
WHERE sal BETWEEN losal AND hisal;
*/
/*
-- empno, ename, job, hiredate, dname, loc, grade
SELECT empno, ename, job, hiredate, dname, loc, grade
FROM emp,dept,salgrade
WHERE emp.deptno = dept.deptno AND sal BETWEEN losal AND hisal;

SELECT empno, ename, job, hiredate, dname, loc, grade
FROM emp JOIN dept 
ON emp.deptno = dept.deptno 
JOIN salgrade
ON sal BETWEEN losal AND hisal;


-- 30번 부서에 있는 사원의 이름, 직위, 입사일, 급여, 부서명, 근무지
SELECT ename, job, hiredate, sal, dname, loc
FROM emp, dept
WHERE emp.deptno = dept.deptno
AND emp.deptno = 30;

-- emp, dept에 있는 모든 정보값 출력 (조인)
SELECT *
FROM emp,dept;
WHERE emp.deptno = dept.deptno;
*/
/*
    book : 책 정보
       bookid : 구분자 => 번호
       bookname : 책이름
       publisher : 출판사
       price : 가격
    customer : 회원 정보
       custid : ID
       name
       address
       phone
    orders : 구매내역
       orderid : 구매번호
       custid : 회원 아이디
       bookid : 책 id
       saleprice : 구매 금액
       orderdate : 구매일
   
*/
-- 구매내역 => orderid, 회원이름, 책이름, 구매일
SELECT orderid, name, bookname, orderdate
FROM orders, customer, book
WHERE orders.custid = customer.custid
AND orders.bookid = book.bookid;
  












