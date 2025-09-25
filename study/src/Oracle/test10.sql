-- 집합 함수 : column단위(집계 함수)
/*
    -- SQL문장 내부 실행 순서 => 144p
    -- SELECT 문장 => 145p
    -- 연산자 => 149p
    -- 내장함수 => 단일행 함수 => 209p~210p
    -- 숫자 관련 => 211p
    -- 문자 관련 => 213p
    -- 날짜 관련 => 216p
    -- 변환 관련 => 218p
    -- NULL =>219p
       
    COUNT : row의 갯수
           - COUNT(*) : NULL 포함
           - COUNT(column) : NULL 제외

      => 로그인 아이디 존재 여부 확인
      => 아이디 중복 체크
      => 검색 갯수
      => 장바구니 

   MAX : 최대값 ==> MAX(컬럼명)
      => 자동 증가번호
      => 중복없는 데이터 첨부 (PRIMARY KEY)
      => 번호 / 날짜(등록일)
                    -------------- 사용자 입력 (예약일, 생일...) 

   MIN : 최소값 => 사용빈도 낮다
      
   SUM : 총합
   AVG : 평균

*/
/*
SELECT COUNT(*)
FROM emp
WHERE empno = 8000;

SELECT COUNT(*)
FROM food
WHERE address LIKE '%서교%';
*/
SELECT MAX(empno), MAX(empno)+1
FROM emp;























