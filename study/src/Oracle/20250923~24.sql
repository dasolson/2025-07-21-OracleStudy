-- 내장 함수 / DML => View, Sequence / DDL
-- 1차 프로젝트 : 수업에 충실 (사용법, CRUD, 흐름 파악)
/*
    1.내장 함수
       1) 단일행 함수 : ROW단위 처리
            = 문자 함수 
                - UPPPER / LOWER => 함수기반 INDEX
                - SUBSTR : 문자를 자르는 경우
                          => 주소 동/구 => 인접한 맛집 / 명소...
                           SUBSTR(문자열 | 컬럼,자르는 시작위치, 자를갯수)
                - INSTR : 문자 찾기 (문자 번호)
                          => 서울시 마포구 서교동...
                              동 자를시 첫번째부터 시작해서 두번째 공백
                           INSTR(문자열 | 컬럼,찾는 문자, 시작위치,몇번째)                          
                - RPAD : 출력 문자 갯수 지정 => 모자라는 경우 지정 문자로 출력
                          => ad***
                           RPAD(문자열 | 컬럼, 몇글자출력, 대체문자)
                           ex) RPAD('hong',10,'*') => hong******
                - LENGTH : 문자의 갯수
                           LENGTH(문자열) => 한글 / 알파벳이 동일
                          => 비밀번호 / 닉네임 => 몇 글자 이상 
            = 숫자 함수
                - MOD : 나머지 값
                       => MOD(10,2) => 10%2
                - ROUND : 반올림 => 평균
                       => ROUND(실수,소수점자리)
                          ROUND(실수) => 소수점 지우기
                - CEIL : 올림 => 총 페이지
                       => CEIL(실수)
            = 날짜 함수
                - SYSDATE : 시스템의 시간, 날짜
                       => 계산 : 산술연산
                          어제 => SYSDATE-1 다음날 => SYSDATE+1
                - MONTHS_BETWEEN : 기간의 개월 수
                                   ------------ LONG(시간, 분, 초)
                                   ROUND이용해서 자르기
                                 => 인사관리, 보험, 적금...=> ERP  
            = 변환 함수
                - TO_CHAR : 숫자, 날짜를 문자열로 변환
                - TO_DATE : 문자열을 날짜 형태로 변환
                - TO_NUMBER : 문자열을 숫자형태로 변환
                ex) TO_NUMBER
                    SELECT *
                    FROM emp
                    WHERE empno = '7788' => 튜닝시 속도 저하
                                 -> 자동으로 To_NUMBER('7788')
                    empno='7788' => TO_NUMBER('7788')
                    
                    TO_DATE
                    SELECT *
                    FROM emp
                    WHERE TO_CHAR(hiredate,'YYYY') = 1981
                    => 함수안에 포함된 컬럼은 INDEX 적용이 안된다
                    => TABLE FULL Scan
                    ==> SELECT *
                        FROM emp
                        WHERE hiredate BETWEEN TO_DATE('1981-01-01','YYYY-MM-DD')
                        AND TO_DATE('1981-12-31','YYYY-MM-DD')
                튜닝 포인트         
                - 조건문(WHERE) 안에서 COLUMN에 함수 x
                - INDEX COLUMN이 있는 경우 => 그대로 사용해야 된다
                - 함수 기반 INDEX를 만들어라
                   => CREATE INDEX idx_hiredate ON emp(TO_CHAR(hiredate,'YYYY'))
            = 기타 함수
                - NVL : NULL값을 다른 값으로 대체
                      => 데이터형이 일치가 되어야 한다
                      ex) NVL(comm,'없음') => 오류
                             NUMBER VARCHAR2
                           => int a="aaa"
                       ==> NVL(TO_CHAR(comm),'없음')
                       
                          NVL(컬럼, 대체값)
                           => NULL값은 연산처리가 안된다
       2) 집계 함수 : COLUMN단위 처리
            = COUNT : ROW의 갯수
                    => 존재여부
            = MAX / MIN => MAX는 자동 증가번호 => SEQUENCE
            = AVG / SUM
            = RANK / DENSE_RANK(순차적) => 순위
              ------------------
              RANK   DENSE_RANK
                1         1
                2         2
                2         2
                4         3
             --------------------
               RANK() OVER(ORDER BY sal ASC) => 자동 정렬
            = CUBE / ROLLUP / GROUPING ...            
       3) GROUP BY가 없는 상태에서 같이 사용 할 수 없다
 
    2. DML : 데이터 조작 언어
            => CRUD
       1) SELECT : 데이터 검색
            SELECT * | column_list(튜닝) ============> 5
            FROM table_name | view_name | SELECT ~ => 1
            [
                WHERE 조건문 ========================> 2
                GROUP BY 그룹 컬럼 | 함수 ============> 3
                HAVING 그룹 조건 ====================> 4
                ORDER BY 컬럼 | 함수 ================> 6
            ]
      --------------------------------------------------     
       2) INSERT : 데이터 추가
            INSERT INTO table_name(컬럼...)
            VALUES(값...) => default / null 허용
            => 부분 추가
            INSERT INTO table_name
            VALUES(값...)
            => 전체 추가
            ** 문자, 날짜 => ''
            ** ''(NULL), ' '(space)
       3) UPDATE : 데이터 수정
            UPDATE table_name
            SET 컬럼=값, 컬럼=값...
            [WHERE 조건문] => 튜닝
       4) DELETE : 데이터 삭제
            DELETE FROM table_name
            [WHERE 조건문]
      -------------------------------------------------- 조건을 제시 
      CRUD : 순수하게 자바로만 제어
             ------------------- 
              Servlet => JSP => MVC => Spring
                         --- View
              ------- 보안
*/
-- 게시판 테이블
/*
    게시판 : CRUD
    페이징
    쿠키 / 세션
    -------------- JSP / Spring (트랜잭션)
*/
CREATE TABLE web_board(
   no NUMBER,
   name VARCHAR2(51) CONSTRAINT wb_name_nn NOT NULL,
   subject VARCHAR2(2000) CONSTRAINT wb_sub_nn NOT NULL,
   content CLOB CONSTRAINT wb_cont_nn NOT NULL,
   pwd VARCHAR2(10) CONSTRAINT wb_pwd_nn NOT NULL,
   regdate DATE DEFAULT SYSDATE,
   hit NUMBER DEFAULT 0,
   CONSTRAINT wb_no_pk PRIMARY KEY(no)
);
CREATE SEQUENCE wb_no_seq
   START WITH 1
   INCREMENT BY 1
   NOCYCLE
   NOCACHE;
CREATE INDEX idx_wb_name ON web_board(name); 
CREATE INDEX idx_wb_sub ON web_board(subject);
--CREATE INDEX idx_wb_cont ON web_board(content);
-- LOB => index를 사용 할 수 없다

INSERT INTO web_board(no, name, subject, content, pwd)
VALUES(wb_no_seq.nextval,'홍길동','CRUD/HTML태그',
'게시판(CRUD) CREATE(INSERT) READ(SELECT) UPDATE DELETE',
'1234');

SELECT COUNT(*) FROM web_board;

DROP TABLE web_board;
DROP TABLE web_borad;

SELECT no, subject, name, regdate, hit, num
FROM (SELECT no, subject, name, regdate, hit, rownum as num
FROm (SELECT no, subject, name, regdate, hit
FROM web_board ORDER BY no DESC))
WHERE num BETWEEN 11 AND 20;

SELECT no, subject, name, regdate, hit
FROM web_board
ORDER BY no DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;
commit;





















