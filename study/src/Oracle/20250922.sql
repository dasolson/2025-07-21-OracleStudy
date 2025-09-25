-- 2025-09-22 : 오라클 정리 / SQL 튜닝 / 웹 개발시 필요한 SQL
/*
     1. SQL 튜닝 : SQL 실행 속도를 최적화
         = database에 저장된 데이터를 효율적으로 사용
      = 불필요한 컬럼은 사용하지 않는다
        SELECT * FROM table_name (x)
        SELECT 컬럼 나열... (o)
      = DISTINCT / UNION => 사용 -> 최소화
                   ----- UNION ALL
      = WHERE절 조건 최소화
        WHERE SUBSTR(name.1.3) = 'ABC;  (x)
        WHERE name LIKE 'ABC%'   (o)
        OR 대신 UNION ALL / IN
      = ORDER BY 최소한만 사용 => 필요시에만 사용
        -------- INDEX 사용
    2. INDEX 활용 중심
        ex)  검색어로 많이 사용 (Food => title, type)
        => 데이터베이스 설계
        => SEQUENCE / INDEX
        JOIN에서 자주 사용되는 FK / PK 컬럼
        => WHERE문장에 자주 등장하는 다중 조건
    3. JOIN
        데이터가 작은 데이블을 선행 테이블로 배치
        emp / dept => dept를 앞에 설정
        => 인덱스가 걸린 컬럼으로 JOIN
        => 서브쿼리보다 JOIN 권장
        => 소량일때 => IN
        => 다량일때 => EXISTS
    4. 집계 / 서브쿼리
        GROUP BY / HAVING 최적화
         1) WHERE에서 먼저 데이터를 추출 => GROUP BY
         2) 서브쿼리는 JOIN
    5. ORDER BY => 힌트 INDEX / INDEX_ASC. INDEX_DESC
    
    --------------------------------------------------------
    SQL 문장 최적화 => 실행계획 분석 => 인덱스 설정 => JOIN / 집계 최적화 => DB환경 점검
    
    3장 / 4장 => DDL / DML
    5장 => INDEX
    6장 => DB 설계
    7장 => 정규화
    8장 => 트랜잭션
    -----------------------
    자바
    1장 ~ 8장 : 기본 문법 => 예외처리
    9장 ~ 10장 : 라이브러리 => java.lang / java.util / java.io / java.sql
                                                                  |
                                                         |       Connection / Prepa
                                             |         파일 관련
                                                       FileInputStream / FileOutputStream
                                                       FileReader / FileWriter
                                                       BufferedReader
                                 |         StringTokenizer / Date / Calendar / Collection
                                                                                  | List (ArrayList)
                                                                                  | Map (HashMap)
                             String / Object / Math / Wrapper (Integer. Double, Boolean)
      => 객체지향 설계 => ~VO / ~DAO / IO / Open API                       
       
       자바 + 오라클 : HTML / CSS / JavaScript
                     -------------------------
                        |화면 UI
                        | 속도 / 화면 변경
                         ----------------
                           Ajax(Jquery) / VueJS / ReactJS
    ---------------------------------------------------------------------------------------------------  
      오라클 (3장)
        SQL 문장
        ---
         *** = DQL : 데이터 검색 => SQL튜닝
              SELECT => executeQuery()
         *** = DML : 데이터 조작 => 추가 / 삭제 / 수정 => TCL이 반드시 필요
              INSERT / UPDATE / DELETE => executeUpdate()
                                            | COMMIT()을 포함
          = DDL : 정의 언어 => 테이블 생성 / 뷰 생성 / 시퀀스 생성 / 시노님
                                함수 생성 / 프로시져 생성 / 트리거 제작
              CREATE / ALTER / DROP / RENAME / TRUNCATE                  
          = DCL : 권한 부여 / 권한 해제
              => 계정 : system / sysdba
              GRANT / REVOKE
         *** = TCL : 정상적 수행 / 비정상일때 / 어디서부터 처리
                      | COMMIT     | ROLLBACK   | SAVEPOINT
        
        1) SELECT 문장
             형식)  
               SELECT (DISTINCT | *) *| column_list
                                         | 불필요한 컬럼 없이
               FROM table_name | view_name | SELECT~
                    -------------------------------
                     1) View이용
                     2) SELECT ~ => 인라인뷰 (보안, ROWNUM)
               [
                   WHERE 조건 : 필요한 데이터만 추출
                   GROUP BY 그룹 컬럼 : 그룹별 집계
                   ------------------------------
                          1) 마이페이지  2) 관리자 페이지
                   HAVING 그룹 조건 : GROUP BY가 있는 경우에만 사용
                   ORDER BY 정렬 컬럼 / 함수
                   ------------ 데이터가 많은 경우 주로 인덱스 사용
               ]
             튜닝)  146p  
               => Book (bookid(pk), bookname, publisher, price)
                   책정보
               => Customer (custid(pk), name, address, phone)
                   고객정보
               => Orders (orderid(pk), custid(fk), bookid(fk),saleprice, orderdate)
                      매핑 테이블
                                  --- N : 1 --- 
                                  |            |
               Customer ====== Orders ====== Book
                   |              |
                   --- 1 : N -----
           1) 예제 (3-1)
               모든 도서의 이름과 가격을 검색
               SELECT * 
               FROM book;
               => 테이블의 모든 컬럼과 모든 행을 조회
                  => FULL TABLE SCAN 발생
               => 테이블의 데이터가 많을 수록 I/O 서버의 부담 증가
               => 컬럼이 많은 경우 => 데이터가 크고 네트워크 전송률이 낮아진다
               
               브라우저 (HTML / CSS) <==== 자바 <==== 오라클
                    |                     | |          |
                    |                     | --- JDBC ---
                    ---------------------- JSP
               => 튜닝
                   => SELECT bookid, bookname, publisher
                      FROM book;
                   => I/O 감소
                      -------- 네트워크 속도 향상
             => 요구사항 분석
                     |
               데이터베이스 설계  
                     |
                 데이터 수집
                     |
                  화면 UI
                     | ---------
                    구현
                     |           => 웹 개발자 구간
                   테스트
                     |
                    배포 --------
           2) 조건 (149p)
              WHERE 문장 뒤
              = 연산자
                비교연산자 : = , <> , < , > , <= , >=
                논리연산자 " AND ,  OR
                           && => Scanner
                           || => 문자열 결합
                           AND => 범위 포함
                           OR => 두개 이상의 조건
                BETWEEN ~ AND : 범위 => 체크인 / 체크아웃, 페이징
                           | MySQL => LIMIT
                IN : OR가 여러개 있는 경우
                     => 동적쿼리 (MyBatis) => 필터
                NOT : 부정 => NOT IN , NOT BETWEEN , NOT LIKE
                LIKE : 유사문자열 검색
                       REGEXP_LIKE()
                NULL : 데이터 NULL값인 경우에는 연산처리가 안된다
                       IS NULL / IS NOT NULL
           
            1) SELECT * 
               FROM book
               WHERE price > 20000;
               = 전체 스캔 => * : 컬럼리스트
               = 불필요한 행을 읽을 수 있다
                 ---------
                   => 인덱스 활용 가능
               CREATE INDEX idx_book_price ON book(price);
               DROP INDEX idx_book_price;
               SELECT * => 인덱스 활용이 어렵다
            = 컬럼 리스트를 이용
            = 검색으로 많이 사용되는 컬럼이 있는 경우 : 인덱스            
            -- 실행 계획 
            EXPLAIN PLAN FOR
            SELECT * FROM book;
            
            SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());
            
            TABLE ACCESS FULL
            => INDEX RANGE SCAN
            => 코드리뷰 / 리팩토링
            
            EXPLAIN PLAN FOR
            SELECT bookid, bookname, price
            FROM book
            WHERE publisher = '굿스포츠';
            
            SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());
            
            CREATE INDEX idx_book_publisher ON book(publisher);
            
            => BETWEEN ~ AND
              10000이상 ~ 20000이하
              SELECT bookid, bookname, publisher, price
              FROM book
              WHERE price BETWEEN 10000 AND 20000;
                    ----- 컬럼 (INDEX)
              
              -- WHERE price >= 10000 AND price <= 20000
              -- 검색 / 조건에서 많이 사용되는 컬럼
              DESC menupan_food;
              
FNO       NOT NULL NUMBER   => PK (index)
    => ORDER BY : INDEX
NAME      NOT NULL VARCHAR2(200) 
TYPE      NOT NULL VARCHAR2(100) 
PHONE              VARCHAR2(20)  
ADDRESS   NOT NULL VARCHAR2(500) 
SCORE              NUMBER(2,1)   
THEME              CLOB          
PRICE              VARCHAR2(50)  
TIME               VARCHAR2(100) 
PARKING            VARCHAR2(100) 
POSTER    NOT NULL VARCHAR2(260) 
IMAGES             CLOB          
CONTENT            CLOB          
HIT                NUMBER        
JJIMCOUNT          NUMBER

         IN 연산자 (151p)
        -----------------
        3-6
          출판사 굿스포츠 / 대한미디어
                ------------------
                 OR / IN
          SELECT bookid, bookname, publisher, price
          FROM book
          WHERE publisher = '굿스포츠' OR publisher = '대한미디어';
          
          => IN
          SELECT bookid, bookname, publisher, price
          FROM book
          WHERE publisher IN('굿스포츠','대한미디어');
          => foreach 
          
          => 다중값 비교 (IN)
          => 인덱스 활용
          *** IN 내부값이 많은 경우 => 실제로는 OR 조건 변환후 처리
          => 이론상으로는 이런경우에 속도가 빠르다
          
         ex) 
              SELECT empno, ename...
              FROM emp
              WHERE empno = '7788';
              
              SELECT empno, ename...
              FROM emp
              WHERE empno = TO_NUMBER('7788');
              
              SELECT empno, ename...
              FROM emp
              WHERE hiredate BETWEEN '81/01/01' AND '81/12/31';
              
              SELECT empno, ename...
              FROM emp
              WHERE hiredate BETWEEN TO_DATE('81/01/01') AND TO_DATE('81/12/31');
              
              SELECT empno, ename...
              FROM emp
              WHERE hiredate LIKE '81%'; => hiredate가 INDEX로 만들어져 있어야 한다
              
              
        LIKE : 유사 문자열 찾기
        ---------------------
         => name LIKE '%값%' => 인덱스 적용(x)
         => name LIKE '값%'  => 인덱스 적용(x)
         => REGEXP_LIKE(name,'값') => 인덱스 적용(o)
         
         WHERE address LIKE '%서교%'
                OR address LIKE '%동교%'
                OR address LIKE '%신촌%'
                OR address LIKE '%홍대%'
         WHERE REGEXP_LIKE(address,'서교|동교|신촌|홍대')
         
      152p
      LIKE 
        SELECT bookname, publisher
        FROM book
        WHERE bookname LIKE '축구의 역사';
        
        SELECT bookname, publisher
        FROM book
        WHERE bookname = '축구의 역사';
        => 단일 연산자를 사용한다 
        SELECT bookname, publisher
        FROM book
        WHERE REGEXP_LIKE(bookname,'축구의 역사');
        
             
        SELECT bookname, publisher
        FROM book
        WHERE REGEXP_LIKE(bookname,'[A-Za-z]');
        
        153p LIKE
        = % => 문자열 길이를 모르는 경우
        = - => 문자 1글자
        
        %데이터% => 인덱스 적용(x)
        데이터% => 인덱스 적용(o)
        _데이터% => 부분적으로 인덱스 적용
        _앞에 있으면 인덱스 적용
        
        SELECT bookname, publisher
        FROM book
        WHERE bookname LIKE '%축구%';
        
        SELECT bookname, publisher
        FROM book
        WHERE bookname LIKE '축구%';
        
        => 인덱스 활용 => 시작문자열
        => REGEXP_LIKE => 중간에 포함
        
        1) 인덱스 활용
        2) 컬럼은 출력에 필요한 컬럼만 선택
        3) OR가 많은 경우에는 IN 사용시 속도가 느리다
        4) LIKE 문장 사용시 => 데이터% => StartsWith 사용
        
        => TABLE ACCESS FULL
        => INDEX RANGE SCAN
        
        EXPLAIN PLAN FOR
        SELECT bookid, bookname, price
        FROM book
        WHERE publisher = '굿스포츠';
            
        SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());
        
        핵심)
              튜닝 : SQL 실행속도의 최적화
              => SELECT의 형식과 순서 
              => 조건 => 연산자
              => BETWEEN / IN / NOT / NULL / LIKE
              => SELECT의 핵심
                  JOIN / SUBQUERY / 내장함수
             ---------------------------------------
             
             JOIN : 데이터 추출 (여러개의 테이블로부터)
                 = INNER JOIN : 교집합 (같은 값, 포함된 값)
                                ** NULL이 있는 경우 제외
                     - EQUI_JOIN
                     - NON_EQUI_JOIN
                 = OUTER JOIN : 교집합 + MINUS
                     - LEFT OUTER JOIN
                     - RIGTH OUTER JOIN
             SUBQUERY : SQL 문장을 통합
                 = 서브쿼리 : WHERE의 조건에 해당되는 값
                     - 단일행 : 비교연산자
                     - 다중행 : IN / ANY / ALL
                                   ----------- MIN / MAX
                 = 인라인 뷰 : 테이블 대신 사용
                              FROM 뒤에 
                 = 스칼라 서브쿼리 : 컬럼 대신 사용
                                   SELECT 뒤에
             => 내장 함수 : SELECT                       
*/
/*
   2025.09.23
   
      조인 / 서브쿼리 => 최적화 (SQL 튜닝)
      SQL 튜닝 조건
      1) 불필요한 JOIN제거
      2) JOIN 순서 최적화
          => 작은 집합 -> 큰 집합
            emp / dept => 순서 변경 (힌트)
      3) 인덱스 사용
      
      = 조인의 종류 => 한개 이상의 테이블에서 필요한 데이터 추출
                      => 정규화를 하면 테이블이 분리가 된다
         INNER JOIN => 단점 : NULL값이 있는 경우에는 제외
                       보완 : OUTER JOIN
            - EQUI_JOIN : = 연산자 (교집합)
                SELECT A.col, B.col
                FROM A,B
                WHERE A.col = B.col;
                
                SELECT A.col, B.col
                FROM A JOIN B
                ON A.col = B.col;
            - NON_EQUI_JOIN : = 아닌 연산자 => 포함
                SELECT A.col, B.col
                FROM A,B
                WHERE A.col BETWEEN B.col AND B.col
              * JOIN인 경우에는 해당 ROW전체 값을 제어 
            *** JOIN => 컬럼명이 다른 경우도 있다
            *** 같은 컬럼을 가지고 있는 경우
                 => NATURAL JOIN (자연조인)
                     SELECT col1, col2... => 구분자가 없어야 한다
                     FROM A NATURAL JOIN B
                 => JOIN ~ USING
                     SELECT col1, col2...
                     FROM A JOIN B
                     USING(공통컬럼)
          OUTER JOIN : NULL 포함
            - LEFT OUTERR JOIN
                 SELECT A.col, B.col
                 FROM A, B
                 WHERE A.col = B.col(+);
                 
                 SELECT A.col, B.col
                 FROM A LEFT OUTER JOIN B
                 ON A.col = B.col;
            - RIGHT OUTER JOIN
                 SELECT A.col, B.col
                 FROM A, B
                 WHERE A.col(+) = B.col;
                 
                 SELECT A.col, B.col
                 FROM A RIGHT OUTER JOIN B
                 ON A.col = B.col;
*/ 
-- 예제 (emp. dept)
SELECT empno, ename, job, hiredate, sal, dname, loc, emp.deptno
FROM emp, dept
WHERE emp.deptno = dept.deptno;
/*
     실행순서
     FROM - WHERE - GROUP BY - HAVING - SELECT - ORDER BY
*/
SELECT empno, ename, job, hiredate, sal, dname, loc, e.deptno
FROM emp e, dept d
WHERE e.deptno = d.deptno;

SELECT empno, ename, job, hiredate, sal, dname, loc, emp.deptno
FROM emp JOIN dept
ON emp.deptno = dept.deptno;
/*
    식별자
       테이블명.컬럼명
       별칭.컬럼명
*/
SELECT empno, ename, job, hiredate, sal, dname, loc, deptno
FROM emp e NATURAL JOIN dept d;

SELECT empno, ename, job, hiredate, sal, dname, loc, deptno
FROM emp e JOIN dept d USING(deptno);

/*
     for(EmpVO e:Emp){
         for(DeptVo d:Dept){
             if(e.deptno == d.deptno) {
                 데이터 출력
             }
         }
      }  
      
      for(DeptVO e:Dept){
         for(EmpVo d:Emp){
             if(e.deptno == d.deptno) {
                 데이터 출력
             }
         }
      }  
*/
-- 튜닝 (작은 데이터 -> 큰데이터 비교)
SELECT /*+ LEADING(emp, dept) USE_NL(dept)*/ 
    e.empno, e.ename, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;
/*
    LEADING(emp, dept) => 조인 순서 emp -> dept 고정
    USE_NL(dept) : dept 조인시에 Nested Loop를 사용
*/
-- 필터 조건 (조인 + 일반 조건)
-- deptno = 10 => empno, ename, job, hiredate, dname, loc
-- 잘 못 된 예시
SELECT empno, ename, job, hiredate, dname, loc
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE d.deptno = 10;
-- 좋은 예시 => 필터링 선행
SELECT empno, ename, job, hiredate, dname, loc
FROM (SELECT * FROM dept WHERE deptno = 10) d
JOIN emp e ON e.deptno = d.deptno;
-- dept => 전체 풀 스캔 -> emp와 불필요한 JOIN 발생
/*
     for(int i = 0; i < arr.length-1; i++) {
         
     }     
*/
SELECT empno, ename, dname
FROM emp
JOIN dept ON emp.deptno = dept.deptno
WHERE dept.loc LIKE '%NEW%';
-- 인덱스 적용
SELECT empno, ename, dname
FROM emp
JOIN dept ON emp.deptno = dept.deptno
WHERE dept.loc LIKE 'NEW%';
-- Loop 줄이기
SELECT empno, ename, dname
FROM (SELECT deptno, dname FROM dept WHERE loc LIKE '%NEW%') d
JOIN emp ON emp.deptno = dept.deptno;

-- 서브쿼리 -> 부서별 그룹핑 후 emp에 두번 접근
-- Loop를 여러번 수행
SELECT empno,ename, sal, dname
FROM (SELECT deptno
      FROM emp
      GROUP BY deptno
      HAVING AVG(sal) >= 2000) v
JOIN emp e ON e.deptno = v.deptno
JOIN dept d ON e.deptno = d.deptno;

-- ROWNUM => 데이터가 많은 경우에는 페이징 처리
-- CI / CD : Thymeleaf = .jar / JSP = .war
-- 급여를 가장 많이 받는 사원 찾기
-- 사번, 이름, 급여, 부서명, 근무지
SELECT empno, ename, sal, dname, loc
FROM emp
JOIN dept ON emp.deptno = dept.deptno
WHERE sal = (SELECT MAX(sal) FROM emp);
-- MAX(sal) => emp 전체에서 검색 (풀스캔)
-- emp가 두번 접근
/*
    int[] sal = {10, 20, 30, 40, 50, 60, 70, 80, 90}
    int max = sal[0]
    for(int i = ; i < sal.length; i++){
        if(max < sal[i]) {
            max = sal[i])
        }
     }   
*/
-- ORDER BY  + ROWNUM (TOP-N)
-- ROWNUM : 랜덤 처리 가능
SELECT empno, ename, sal, dname, loc
FROM (SELECT empno, ename, sal, dname, loc
      FROM emp
      JOIN dept ON emp.deptno = dept.deptno
      ORDER BY sal DESC)
WHERE rownum = 1;    
-- Full Scan을 방지
-- 부서별 인원 수 + 평균 급여
-- 부서번호, 부서명, 인원수, 평균급여 => 그룹
SELECT dept.deptno, dname, COUNT(empno) AS emp_cnt, AVG(sal) AS avg_sal
FROM dept
JOIN emp ON dept.deptno = emp.deptno
GROUP BY dept.deptno, dname;
-- dept : 소속이 없는 부서가 있다
-- emp에만 존재하는 부서 => 누락 가능 => OUTER JOIN
-- 불필요한 JOIN 순서 => 성능 저하 => 순서 결정
SELECT /*+ USE_HASH(emp, dept)*/
     dept.deptno, dname, COUNT(empno) "cnt",
     AVG(sal) "emp_sal"
FROM dept
LEFT OUTER JOIN emp ON dept.deptno = emp.deptno
GROUP BY dept.deptno, dname;
/*
    인라인뷰 => 테이블에 접근 횟수를 줄일 수 있다
    데이터 누락 방지 => 필요시에는 OUTER JOIN
    JOIN 전에 다른 조건을 처리
    인덱스 활용 / 실행 계획
    
      => LIKE => 인덱스 적용 => startsWith
      => GROUP BY => (테이블 접근)중복 최소화
                      -------------------- 인라인뷰
      => MAX / MIN => 서브쿼리 대신 ORDER BY => ROWNUM
      
      IN 보다 EXISTS 
       => 서브쿼리 여러번 사용 하지말고 JOIN 사용
*/
-- 비효율적 (IN)
SELECT empno, ename, sal
FROM emp
WHERE deptno IN(SELECT deptno FROM dept WHERE loc = 'NEW YORK');
-- FULL Scan 안되게 
SELECT empno, ename, sal
FROM emp
WHERE EXISTS(SELECT 1 FROM dept WHERE 
             dept.deptno = emp.deptno
             AND loc = 'NEW YORK');
-- IN => NULL 값일 경우도 있다
-- EXISTS => NULL 값에 대한 안정성
/*
    IN vs EXISTS 
    비효율적 : 조건 검색 / FULL Scan
    개선 : EXISTS -> 인덱스 활용
    서브쿼리 => JOIN 활용 => 반복 제거
    MAX => ROWNUM을 이용해서 단일 스캔
    NOT IN => NULL 문제 / FULL Scan => ANSI JOIN 활용 => 안전성 / 성능 개선
*/
/*
     서브쿼리
        : SQL 문장을 통합
        MainQuery = (subQuery) => 반드시 괄호 안에 설정
            2            1
       = 서브쿼리 : 조건 값으로 사용
           - 단일행 서브쿼리 : 컬럼 1개, 결과값 1개
           - 다중행 서브쿼리 : 컬럼 1개, 결과값 여러개
             => WHERE 뒤에 
           - 다중컬럼 서브쿼리 : 컬럼 여러개, 결과값 1개
       = 스칼라 서브쿼리 : 컬럼 대신 사용
           - 튜닝 => 스칼라 서브쿼리 여러개 보다 한번에 정리 (JOIN)
           - SELECT ~ (SELECT ~) 별칭...
           - FUNCTION 처리
       = 인라인뷰 : 테이블 대신 사용
           - SELECT ~
           - FROM (SELECT ~)
            => 페이징 기법    
*/
-- 사원중에 평균 급여보다 적에 받는 사원의 이름, 급여, 입사일 출력
SELECT AVG(sal) FROM emp;
-- 서브쿼리 -> DML 사용이 가능
-- JOIN => SELECT에서만 가능
SELECT ename, sal, hiredate
FROM emp
WHERE sal < 2073;

SELECT ename, sal, hiredate
FROM emp
WHERE sal < (SELECT AVG(sal) FROM emp);

-- 서브쿼리 결과 여러개 (10, 20, 30)
/*
     전체 적용 : IN (*****) => EXISTS
                => NULL 값 포함 할 가능성 (불필요한 데이터 첨부)
     한개 적용 : ANY(SOME)
                > ANY (10, 20, 30) => MIN => 10
                < ANY (10, 20, 30) => MAX => 30
                ALL
                > ALL (10, 20, 30) => MAX => 30
                < ALL (10, 20, 30) => MIN => 10
               --------------------------------- MAX /MIN  
*/
SELECT DISTINCT deptno FROM emp;
SELECT ename, sal, hiredate, deptno
FROM emp
WHERE deptno IN(SELECT DISTINCT deptno FROM emp);

SELECT ename, sal, hiredate, deptno
FROM emp
WHERE deptno > ANY(SELECT DISTINCT deptno FROM emp);

SELECT ename, sal, hiredate, deptno
FROM emp
WHERE deptno < ANY(SELECT DISTINCT deptno FROM emp);

SELECT ename, sal, hiredate, deptno
FROM emp
WHERE deptno > SOME(SELECT DISTINCT deptno FROM emp);

SELECT ename, sal, hiredate, deptno
FROM emp
WHERE deptno < SOME(SELECT DISTINCT deptno FROM emp);

SELECT ename, sal, hiredate, deptno
FROM emp
WHERE deptno >= ALL(SELECT DISTINCT deptno FROM emp);

SELECT ename, sal, hiredate, deptno
FROM emp
WHERE deptno <= ALL(SELECT DISTINCT deptno FROM emp);

-- 스칼라 서브쿼리 => 반드시 결과값 1개의 컬럼만 사용이 가능
SELECT empno, ename, job, hiredate, sal,
      (SELECT dname FROM dept WHERE deptno = emp.deptno) "dname",
      (SELECT loc FROM dept WHERE deptno = emp.deptno) "loc",
FROM emp;  

SELECT empno, ename, job, hiredate, sal, dname, loc
FROM emp, dept
WHERE emp.deptno = dept.deptno;

SELECT empno, ename, job
FROM (SELECT * FROM emp);
-- 3장
/*
    내일 
    내장 함수
    DDL => 효율적 제약조건 설정
    DML => INSERT / UPDATE / DELETE
    
    모레
    VIEW / INDEX
    => 간단하게 ERD
    ------------------------------------
*/


































