/*
     * 총 정리 : SELECT / 연산자 / 내장함수
       

     * 총 정리 : SELECT / 연산자 / 내장함수
       
145p
   형식
     SELECT ALL(*) | 컬럼 리스트
     FROM table_name(view_name | SEKECT)
     [
         WHERE 조건문
         GROUP BY
         HAVING
         ORDER BY
     ]
     *** SELECT 문장 : 데이터 추출
           = 컬럼 대신 사용 ======> 스칼라 서브 쿼리
           = table 대신 사용 ====> 인라인뷰
           = 조건값 대신 사용 ====> 서브 쿼리
     형식
       SELECT 
       FROM
       WHERE
           
1. emp에서 급여가 2000 이상인 사람을 출력하세요.
                --------- >=
   셀렉션  : 조건에 맞는 데이터 추출
   프로젝션 : 원하는 컬럼만 추출
   
   SELECT * 
   FROM emp 
   WHERE sal >= 2000;
   
2. emp에서 급여 sal가 2000 이상인 사람의 이름 ename과 사번 empno을 출력하세요.

     SELECT ename, empno
     FROM emp
     WHERE sal >= 2000;

3. emp에서 이름이 'FORD'인 사람의 사번 empno과 급여 sal을 출력하세요
     1) 문자 / 날짜 => ''
     2) 별칭 => 컬럼 "별칭", 컬럼 as 별칭

     SELECT empno, sal
     FROM emp
     WHERE ename = 'FORD';
     
4. emp에서 입사일자 hiredate가 82년 이후에 입사한 사람의
   이름과 입사일자를 출력하세요.
(날짜를 넣을때는 YY/MM/DD형태를 사용하면된다.)
    1) 문자 / 날짜 => 비교 연산자 이용

     SELECT ename, hiredate
     FROM emp
     WHERE hiredate > '82/12/31';

5. emp에서 이름이 J가 들어가는 사원의 이름과 사번을 출력하세요.
     LIKE => %j%

     SELECT ename, empno
     FROM emp
     WHERE ename LIKE '%J%';


6. emp에서 이름이 S로 끝나는 사원의 이름과 사번을 출력하세요.

     SELECT ename, empno
     FROM emp
     WHERE ename LIKE '%S';


7. emp에서 이름의 두번째 글자가 A가 들어가는 사원의 이름과 사번을 출력하세요.

     SELECT ename, empno
     FROM emp
     WHERE ename LIKE '_A%';


8. emp에서 보너스가 300이거나 500이거나 1400인 사람의
    이름, 사번, 보너스를 출력하세요.
    => OR => IN
    
    SELECT ename, empno, comm
    FROM emp
    WHERE comm = 300 OR comm = 500 OR comm = 1400;
    
    SELECT ename, empno, comm
    FROM emp
    WHERE comm IN(300,500,1400);

9. emp에서 보너스가 500에서 4000 사이의 사원의 이름과 사번, 보너스를 출력하세요.
    => BETWEEN ~ AND / >= ( ) AND <= ( )

    SELECT ename, empno, comm
    FROM emp
    WHERE comm BETWEEN 500 AND 4000;
    
    SELECT ename, empno, comm
    FROM emp
    WHERE comm >= 500 AND comm <= 4000;

10. emp에서 부서가 10이고 직책이 CLERK인
     직원이름,사번,직책(job),부서(deptno)를 출력하세요.
      => AND => 두개의 조건이 동시에 true
      
    SELECT ename, empno, job, deptno
    FROM emp
    WHERE deptno = 10 AND job ='CLERK';

11. emp에서 입사일자가 82년 이후이거나 직책이 MANAGER인 사람의
     이름과 입사일자를 출력하세요.
      => OR
     
     SELECT ename, hiredate
     FROM emp
     WHERE SUBSTR(hiredate,1,2) > 82 OR job = 'MANAGER';
     
     -- 날짜 관련 => SUBSTR

12. emp에서 부서번호가 10이 아닌 직원의 사번,이름,부서번호를 출력하세요.
     => <> , != , ^=
 
     SELECT empno, ename, deptno
     FROM emp
     WHERE deptno <> 10;
     
     SELECT empno, ename, deptno
     FROM emp
     WHERE NOT(deptno = 10);
     
     SELECT empno, ename, deptno
     FROM emp
     WHERE deptno NOT IN(10);
     

13. emp에서 이름에 A가 없는 직원의 사번과 이름을 출력하세요.
         => NOT LIKE
 
     SELECT empno, ename
     FROM emp
     WHERE  ename NOT LIKE '%A%';

14. emp에서 보너스가 500에서 1400이 아닌 직원의 사번과 보너스를 출력하세요.

     SELECT empno, comm
     FROM emp
     WHERE comm NOT BETWEEN 500 AND 1400;

15. emp에서 매니저를 갖지 않은 직원이름을 출력하세요.
                  ---------- NULL (IS NULL)
     SELECT ename
     FROM emp
     WHERE mgr IS NULL;     

16. emp에서 커미션을 받는(커미션이 null값이 아닌) 직원이름과 커미션을 출력하세요.

     SELECT ename, comm
     FROM emp
     WHERE comm IS NOT NULL AND comm <> 0;

17. emp에서 사번, 이름, 급여를 출력하는데 급여가 적은사람부터 출력하세요.
       => ORDER BY 정렬
          ORDER BY 컬럼명 ASC / DESC
                   컬럼번호

     SELECT empno, ename, sal
     FROM emp
     ORDER BY sal ASC;
     
     SELECT empno, ename, sal
     FROM emp
     ORDER BY sal;
     
     SELECT empno, ename, sal
     FROM emp
     ORDER BY 3 ASC;

18. emp에서 사번, 이름, 급여를 출력하는데 급여가 많은 사람부터 출력하세요.

     SELECT empno, ename, sal
     FROM emp
     ORDER BY sal DESC;
     
     SELECT empno, ename, sal
     FROM emp
     ORDER BY 3 DESC;

19. emp에서 사번, 이름, 급여를 출력하는데 이름이 빠른사람부터 출력하세요.

     SELECT empno, ename, sal
     FROM emp
     ORDER BY ename ASC;
     
     SELECT empno, ename, sal
     FROM emp
     ORDER BY 2 ASC;

20. emp에서 사번, 이름, 입사일을 출력하는데 입사일자가 최근인 사람부터 출력하세요.

     SELECT empno, ename, hiredate
     FROM emp
     ORDER BY hiredate DESC;
     
     => 변경이 안되는 데이터 => 크롤링 => ASC
          
     => 자주 변경하는 데이터 => DESC
         ex) 게시판, 댓글, 예매...

21. emp에서 사번, 이름, 급여를 출력하는데 먼저 급여가 많은 순서로
     그리고 이름이 빠른 순서로 정열하세요.
     
     SELECT -----4
     FROM -------1
     WHERE ------2
     ORDER BY ---3
     
     SELECT empno, ename, sal
     FROM emp
     ORDER BY sal DESC, ename ASC;
     
     => 대댓글, 답변형 게시판(묻고 답하기)

22. 사원이름과 월급을 출력하는데, 이름의 컬럼명을 employee라고 하고 월급의 컬럼명을 salary라고 하시오.
     *** 별칭 => 컬럼명이 긴 경우 / 알지 못하는 명칭
             ex) aaaaa "sabun"
             
     SELECT ename "employee", sal as salary
     FROM emp;
     
24. 사원이름과 입사일을 출력하는데 사원이름의 컬럼명이 employee name으로 출력되게 하시오. 

     SELECT ename "employee", hiredate
     FROM emp;
     
25. 직위를 중복없이 출력하시오.
     DISTINCT 컬럼
     
     SELECT DISTINCT job
     FROM emp;
 
26. 부서번호를 출력하는데 중복제거해서 출력하시오.

    SELECT DISTINCT deptno
    FROM emp;

    => 음식 종류 / 장르... => 등록 => 게시판 유형 / 공지사항
    => 자바 => HashSet
    => 기본 : 요청값 => 제어 (자바)
       실제 출력물 => 제어 (오라클)
    => 요청 -> 자바 -> SQL -> 오라클
              -----------
                 HTML
   
27.사원번호가 7788번인 사원의 사원번호와 이름을 출력하시오.
     => 같다 : =

    SELECT empno, ename
    FROM emp
    WHERE empno = 7788;
    
    => 날짜, 문자 : ''
    => 문장이 종료 => ; 사용
  => 자바에서 전송시에는 ;은 자동 추가  

28.월급이 3000인 사원들의 이름과 월급을 출력하시오.
   
    SELECT ename, sal
    FROM emp
    WHERE sal = 3000;

29. 이름이 scott인 사원의 이름과 직업을 출력하시오.

    SELECT ename, job
    FROM emp
    WHERE ename = UPPER('scott');
    
    => 오라클에 저장된 데이터는 대소문자를 구분한다
                             ------------- 비밀번호 => 대소문자, 특수문자 8자 이상
 
30.월급이 3000 이상인 사원들의 이름과 월급을 출력하시오.

    SELECT ename, sal
    FROM emp
    WHERE sal >= 3000;
    
 
31. 직업이 SALESMAN이 아닌사원들의 이름과 직업을 출력하시오.

    SELECT ename, job
    FROM emp
    WHERE job <> 'SALESMAN';
    
    SELECT ename, job
    FROM emp
    WHERE job != 'SALESMAN';
    
    SELECT ename, job
    FROM emp
    WHERE job ^= 'SALESMAN';
  
32. 월급이 1000에서 3000 사이인 사원들의 이름과 월급을 출력하는데, 컬럼명을 Employee, Salary로 출력하시오.

     SELECT ename "Employee", sal "Salary"
     FROM emp
     WHERE sal BETWEEN 1000 AND 3000;
     
     SELECT ename "Employee", sal "Salary"
     FROM emp
     WHERE sal >= 1000 AND sal <= 3000;
  
33.사원이름과 월급을 출력하는데 월급이 낮은 사원부터 높은 사원순으로 출력하시오.

    SELECT ename, sal
    FROM emp
    ORDER BY sal ASC;
 
34. 이름과 입사일을 출력하는데 가장 최근에 입사한 사원부터 출력하시오.

    SELECT ename, hiredate
    FROM emp
    ORDER BY hiredate DESC;
 
35. 직업이 SALESMAN인 사원들의 이름과 월급과 직업을 출력하는데, 월급이 높은 사원부터 출력하시오.

      SELECT - FROM - WHERE - ORDER BY
      
      SELECT ename, sal, job
      FROM emp
      WHERE job = 'SALESMAN';
      ORDER BY sal DESC;
      
      => 자동 정렬
      SELECT empno, ename, sal, DENSE_RANK() OVER(ORDER BY sal DESC) "rank"
      FROM emp;
 
36. 월급이 1000 이상인 사원들의 이름과 월급을 출력하는데 월급이 낮은 사원부터 높은 사원순으로 출력하시오.

      SELECT ename, sal
      FROM emp
      WHERE sal >= 1000
      ORDER BY sal ASC;

37. 연봉(셀러리*12)이 36000 이상인 사원들의 이름과 연봉을 출력하고 컬럼명의 별칭은 "연봉"으로 하시오.

    SELECT ename, sal*12 "연봉"
    FROM emp
    WHERE sal*12 >= 36000;

38. 월급이 1000에서 3000사이가 아닌 사원들의 이름과 월급을 출력하시오.
    => NOT BETWEEN

    SELECT ename, sal
    FROM emp
    WHERE sal NOT BETWEEN 1000 AND 3000;
    
    SELECT ename, sal
    FROM emp
    WHERE sal < 1000 OR sal > 3000;
 
39. 이름의 첫 글자가 s로 시작하는 사원들의 이름을 출력하시오.

    SELECT ename
    FROM emp
    WHERE ename LIke UPPER('s%');
 
40. 이름의 끝 글자가 T로 끝나는 사원들의 이름을 출력하시오.

    SELECT ename
    FROM emp
    WHERE ename LIke UPPER('%t');
 
41. 이름의 두번째 철자가 m인 사원들의 이름을 출력하시오.

    SELECT ename
    FROM emp
    WHERE ename LIke UPPER('_m%');
 
42. 이름의 세번째 철자가 L인 사원의 이름을 출력하시오.
   
    SELECT ename
    FROM emp
    WHERE ename LIke '__L%';

45. 이름의 첫번째 철자가 S 가 아닌 사원들의 이름을 출력하시오.

    SELECT ename
    FROM emp
    WHERE ename NOT LIke 'S%';
 
46. 사원 번호가 7788, 7902, 7369번인 사원들의 사원번호와 이름을 출력하시오.

     SELECT empno, ename
     FROM emp
     WHERE empno IN(7788,7902,7369);
 
47. 직업이 SALESMAN ANALYST가 아닌 사원들의 이름과 직업을 출력하시오.

    SELECT ename, job
    FROM emp
    WHERE job NOT IN('SALESMAN','ANALYST');
 
48. 커미션이 null인 사원들의 이름과 커미션을 출력하시오.
     NULL 처리
     IS NULL / IS NOT NULL

    SELECT ename, comm
    FROM emp
    WHERE comm IS NULL;
 
49 .커미션이 null이 아닌 사원들의 이름과 커미션을 출력하시오.

    SELECT ename, comm
    FROM emp
    WHERE comm IS NOT NULL;

51. 1981년 11월 17일에 입사한 사원들의 이름과 입사일을 출력하시오.

     SELECT ename, hiredate
     FROM emp
     WHERE TO_CHAR(hiredate, 'YYYY"년" MM"월" DD"일"')='1981년 11월 17일';
 
52. 1981년도에 입사한 사원들의 이름과 입사일을 출력하시오.

    SELECT ename, hiredate
    FROM emp
    WHERE TO_CHAR(hiredate,'YYYY') = 1981; 
 
53. 연결연산자를 이용해서 이름과 월급을 연결해서 출력하시오.
     || 문자열 결합

    SELECT ename ||' '|| sal
    FROM emp;
 
54. 쿼리를 사용해 "SCOTT의 직업은 ANALYST 입니다."와 같은 결과를 출력하시오.

     SELECT ename|| '의 직업은' || job ||'입니다'
     FROM emp;
     
 
55. 아래의 쿼리 결과를 출력하시오.

     SELECT ename,job,sal
     FROM emp;
 
56. 직업이 SALESMAN인 사원들의 이름과 연봉을 출력하는데 연봉이 높은 사원부터 출력하고 아래과 같이 결과를 출력하시오.
"ALLEN 의 연봉은 36000 입니다."

      SELECT ename||'의 연봉은 '||sal*12||'입니다'
      FROM emp
      WHERE job = 'SALESMAN'
      ORDER BY sal DESC;

57. 이름은 대문자로 직업은 소문자로, 이름의 첫글자를 대문자 나머지는 소문자로 출력하시오.
       
     SELECT UPPER(ename), LOWER(job), INITCAP(ename)
     FROM emp;
 ------------------------------ 내장 함수 ---------------------------------------------------
58. 이름이 scott인 사원의 이름과 월급을 출력하는데 where절에 scott의 소문자로 검색해서 출력하시오.
  
     SELECT ename, sal
     FROM emp
     WHERE ename = UPPER('scott');

59.아래의 쿼리 결과를 출력하시오. 
     SUBSTR(문자열,시작위치,갯수)
     
     SELECT ename, SUBSTR(ename,1,3) "SUBSTR"
     FROM emp;
 
60. 이름의 첫번째 철자만 출력하는데 소문자로 출력되게 하시오
      LOWER
      
      SELECT LOWER(SUBSTR(ename,1,1))||SUBSTR(ename,2,LENGTH(ename)-1)
      FROM emp;
    
61. upper, lower, substr, || 를 사용해서 아래와 같은 결과를 출력하시오.
 
     SELECT ename,UPPER(SUBSTR(ename,1,1))||LOWER(SUBSTR(ename,2,LENGTH(ename)-1))
     FROM emp;
     => INITCAP(ename)
 
63. 이름에 EN 또는 IN을 포함하고 있는 사원들의 이름과 입사일을 출력하는데 최근에 입사한 순서로 출력하시오.
        LIKE + ORDER BY
        
        SELECT ename, hiredate
        FROM emp
        WHERE ename LIKE '%EN%' OR ename LIKE '%IN%'
        ORDER BY hiredate DESC;
        
        SELECT ename, hiredate
        FROM emp
        WHERE REGEXP_LIKE(ename,'EN|IN')
        ORDER BY hiredate DESC;
  
67. instr 함수를 이용해서 이름에 A자를 포함하고 있는 사원들의 이름을 출력하시오. 
    INSTR => INSTR(문자열, 찾는 문자,시작,몇번째) Java
      
        SELECT ename
        FROM emp
        WHERE INSTR(ename,'A',1,1) > 0;
        
        3번째 문자 O를 찾아라
        
        SELECT ename
        FROM emp
        WHERE ename LIKE '__O%';
        
        SELECT ename
        FROM emp
        WHERE INSTR(ename,'O',1,1) = 3;
        
68. 이름과 월급을 출력하는데 월급을 전체 10자리로 출력하고 나머지 자리는 *로 출력하시오! 
       RPAD => 출력 갯수 지정 => 문자가 적으면 대체문자 출력
       'ABC' 7 => ABC****
       LPAD(문자열,출력갯수,대체문자)
       
       SELECT ename, RPAD(sal,10,'*')
       FROM emp;      
       
       -- 웹 : 아이디 찾기 , 비밀번호 : 이메일 전송

69. 이름과 월급을 출력하는데 월급을 전체 10자리로 출력하고 나머지 자리는 공백으로 출력하시오. 

       SELECT ename, LPAD(sal,10,' ')
       FROM emp; 

70. length 함수를 이용해서 이름과 이름의 철자의 갯수를 출력하시오. 
 
        SELECT ename, LENGTH(ename)
        FROM emp;
        
        -- 이름이 5자인 사원의 모든 정보 출력
        
        SELECT ename
        FROM emp
        WHERE LENGTH(ename) = 5;
        
        내장함수는 SELECT에서만 사용 하는 것이 아니다
        ------- WHERE, GROUP BY, ORDER BY => FROM에서는 사용 불가
        SELECT 내장함수
        FROM table_name | view_name | SELECT~
        WHERE 내장함수 | 컬럼
        GROUP BY 내장함수 | 컬럼
        ORDER BY 내장함수 | 컬럼

71. 이름, 입사한 날짜부터 오늘까지 총 몇달 근무했는지 소수점 뒤에는 잘라서 출력하시오.
                               -----------      ----------------------
                              MONTHS_BETWEEN      TRUNC
 
       SELECT ename, TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate))
       FROM emp;       
 
72. 오늘부터 앞으로 돌아올 월요일의 날짜를 출력하시오. 
     NEXT_DAY
     
     SELECT NEXT_DAY(SYSDATE,'월')
     FROM DUAL;

73. 이번달 말일의 날짜를 출력하시오. 
     LAST_DAY
     
     SELECT LAST_DAY(SYSDATE)
     FROM DUAL; 
 
74. 오늘이 무슨 요일인지 출력하시오 
    
    SELECT SYSDATE,TO_CHAR(SYSDATE,'DY"요일"')
    FROM DUAL;

75. emp에서 이름, 입사한 요일을 출력하시오. 
 
      SELECT ename, TO_CHAR(hiredate,'DY"요일"')
      FROM emp;

76. 목요일에 입사한 사원들의 이름과 입사일, 입사한 요일을 출력하시오.
 
      SELECT ename, hiredate, TO_CHAR(hiredate,'DY"요일"')
      FROM emp
      WHERE TO_CHAR(hiredate,'DY"요일"') = '목요일';

77. 이름과 월급을 출력하는데 월급에 천단위를 부여하시오! (예: 3000 -> 3,000)
      TO_CHAR
      
      SELECT ename, TO_CHAR(sal,'L999,999')
      FROM emp; 
 
78. 이름과 커미션을 출력하는데 커미션이 null인 사원들은 0으로 출력하시오.
     NVL => NULL 값을 다른 데이터로 대체
     
    SELECT ename, NVL(comm,0)
    FROM emp;

79. 이름과 커미션을 출력하는데 커미션이 null인 사원들은 no comm 이란 글씨로 출력하시오.

    SELECT ename, NVL(TO_CHAR(comm), 'no comm')
    FROM emp;

*/