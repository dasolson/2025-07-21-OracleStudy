--2025.09.25
-- View / Index / DDL
/*
    1. View
        = 실제 데이터를 저장하지 않고 기존의 테이블에 대한 가상 테이블의 정의
       1) 특징
           = 실제 데이터가 저장 되지 않는다 : SQL 문장이 저장된
              => SELECT 문장 (JOIN, SubQuery)
           = 보안성 강화 = 특정 컬럼만 노출
           = 복잡한 SQL 문장을 단순화 
              => 자주 사용되는 JOIN / 집계 함수 재사용
           = 독립성 보장 : 실제 테이블 구조 변경 => View는 유지
       2) 종류
           = 단순뷰  : 한개의 테이블 기반
              => INSERT / UPDATE / DELETE가 가능
              *** 뷰에 DML을 적용 => 테이블에 영향
           = 복합뷰  : 여러개 테이블 조인 / 그룹 함수 사용
              => DML을 사용 할 수 없다
              => TRIGGER는 사용이 가능
              => read only
           = 인라인뷰 : SELECT를 테이블 대신 사용
                       페이징에 주로 사용 /=> OFFSET, MySQL => LIMIT
       3) 생성 방법
           = CREATE [OR REPLACE] VIEW view_name
             AS
               SELECT ~
           = SELECT ~
             FROM (SELECT ~...)
             => 생성과 동시에 수정
                CREATE OR REPLACE View view_name
                AS
                  SELECT ~~
       4) 삭제
           = DROP VIEW view_name
       5) 주의점 : 많은 View를 생성하면 성능이 저하된다
           = 자주 사용되는 SQL(문장이 길거나 복잡한 경우)
       6) 튜닝 포인트
           = 인라인뷰 : FROM절에 직접 서브쿼리를 사용
             => 뷰 정의가 복잡하면 불필요한 결과값을 메모리에 생성 할 수 있어 성능이 많이 저하
       ==> 최대한 불필요한 컬럼 제거
        ex)  
            AS
             SELECT * FROM emp; => X
       ==> 복잡한 뷰 대신 인라인뷰 주로 사용권장
       ==> 조건절 최적화된 위치에 설정
       ==> = . BETWEEN , IN , LIKE
       
       
    2. INDEX (면접 필수)
       1) 속도 향상 (Front => 속도를 처리하지 못한다)
                    ------ Vue / React (빠른 속도 가능)
       2) 특정 컬럼의 값을 빠르게 검색
          ex)  ON table명(컬럼)
       3) 목적 : 검색 속도 향상, 정렬 속도 향상, JOIN 향상
       4) 단점 : 저장 공간 부족 => DML이 있는 경우에는 성능 저하
       5) 생성
           = 단일 index
                CREATE INDEX index명 ON table명(컬럼명 ASC|DESC)
           = 복합 index
                CREATE INDEX index명 ON table명(컬럼명 ASC|DESC, 컬럼명 ASC|DESC)
       6) 삭제
           DROP INDEX index명
       7) 사용처
           = 자주 사용되는 검색 컬럼 인덱스 적용
              => title / address / genre
           = 데이터량이 작은 테이블은 인덱스 사용은 금지 (권장)
           = 자주 수정 / 삭제가 되는 경우 => 인덱스 사용 금지
           = LIKE => startsWith 
           = PK / UK => 자동 생성
              테이블 생성 => 시퀀스 생성 => 인덱스 생성    
    
    3. DDL
        = 목적 : 데이터베이스 생성 / 수정 /삭제
            => 테이블 / 뷰 / 인덱스 / 함수 / 프로시저 / 트리거
        = 주요 명령어
            - CREATE : 새로운 테이블 / 뷰 생성
                CREATE TABLE table_name(
                   컬럼명 데이터형 [제약조건],
                                  ------- NOT NULL, DEFAULT
                   컬럼명 데이터형 [제약조건],
                   컬럼명 데이터형 [제약조건],
                   [제약조건], => PRIMARY KEY (기본키)
                   [제약조건]     FOREIGN KEY (외래키, 참조키)
                                 CHECK (지정된 데이터만 출력)
                                 UNIQUE (후보키)
                   ...              
                )           
            - ALTER  : 기존의 테이블 수정                
                => 추가 : ADD
                    ALTER TABLE table명 ADD 컬럼명 데이터형 [제약조건] 
                => 수정 : MODIFY
                    ALTER TABLE table명 MODIFY 컬럼명 데이터형
                      => 크롤링시에 데이터 크기가 맞지 않는 경우
                => 삭제 : DROP
                    ALTER TABLE table명 DROP COLUMN 컬럼명
                    => 사용되지 않는 컬럼이 있는 경우
                => 컬럼명 변경 ***
                    ALTER TABLE table명 RENAME COLUMN old_name TO new_name
                => 제약조건 변경 ***
                    ALTER TABLE table명 ADD CONSTRAINT 제약조건명 제약조건
                                       ---- PK, UK, FK, CH
                                       MODIFY
                                       ------ NOT NULL
                => 제약조건 삭제
                    ALTER TABLE table명 DROP CONSTRAINT 제약조건명
              ***테이블 생성 => 추가/ 삭제 / 수정
                 --------- 데이터 수집이 된 경우
                           유지 보수에서 많이 사용
            - DROP : 삭제
                  DROP TABLE table명
                       ----- VIEW / INDEX / FUNCTION / SEQUENCE ...
            - TRUNCATE : 데이터 전체 삭제
                  TRUNCATE TALBE table명
                => 테이블 구조는 유지
            - RENAME : 이름 변경
                  RENAME old_name TO new_name
            - COMMENT : 설명 추가
                => 메뉴얼 작업
                => 신입 : 메뉴얼 작업 (문서 작업) => FRONT => BACKEND
            ==> AUTO COMMIT
        = 데이터베이스 : 데이터를 저장하는 공간 (CRUD)
                       변수 / 배열 / 클래스 / 컬렉션 / 파일
        = 제약 조건 / 데이터형   
          --------
          1. 데이터 무결성 원칙 (이상현상 방지)
              => 중복이 없는 데이터 포함 
              => PRIMARY KEY
          2. 잘못된 값 입력 방지 => 정형화된 데이터 
              => CHECK / FOREIGN KEY
          ==> 데이터 품질 관리
                 개발자 => 테스터 => QA
          3. 종류
              = NOT NULL => 컬럼뒤에 존재
                 => 반드시 입력값이 필요
                 컬럼명 데이터형 CONSTRAINT 제약조건명 NOT NULL
              = UNIQUE : 후보키 => NULL 허용
                 => 중복 허용 X
                 => 테이블 내에 고유한 원자값
                 CONSTRAINT 제약조건명 UNIQUE(컬럼명)
              = NOT NULL + UNIQUE = PRIMARY KEY
                 => 테이블의 식별자 역할 (한 테이블에 1개만 존재)
                 => 데이터 무결성 원칙 (이상현상 방지)
                     => 숫자 형식 (영화 번호, 뉴스 번호, ...)
                         => 시퀀스 (자동 증가 번호)
                 CONSTRAINT 제약조건명 PRIMARY KEY(컬럼명)        
                 CONSTRAINT 제약조건명 PRIMARY KEY(컬럼명, 컬럼명)
              = FOREIGN KEY : 기존의 데이터를 참조
                 => JOIN / 중복 제거
                 => 매핑 테이블
                     ex)  회원 ------ 예약 ------ 호텔
                                   id, 호텔번호
                 CONSTRAINT 제약조건명 FOREIGN KEY(컬럼명)
                 REFERENCES 참조테이블명(참조컬럼명)
              = CHECK : 지정된 데이터만 첨부
                 => 부서명, 근무지, 장르, 성별 ...
                 => <select> , <input type=radio>
                 CONSTRAINT 제약조건명 CHECK(컬럼명 IN(...))
              = DEFAULT : 미리 초기값 생성
                 컬럼 데이터형 DEFAULT 값
          4. 제약조건 조회
              SELECT constraint_name, constraint_type, table_name
              FROM user_constraint
              WHERE table_name = "반드시 대문자";
              
              constraint_type
               | R , C , P , U
                             -- UK
                        -- PK
                     -- NOT NULL, CHECK
                -- FK
          5. 제약조건 삭제
            ALTER TABLE 테이블명 DROP CONSTRAINT constraint_name
-----------------------------------------------------------------------------
      6 ~ 7 장
     ER-MODEL / 요구사항 분석 / 데이터베이스 설계 / 정규화
     --------
      데이터베이스 구조 / 관계도 / DB설계 기초로 만든다
        1) 요구사항 수집 : 벤치마킹
        2) 벤치마킹시 출력에 필요한 엔티티 도출
                                 ----- 테이블
        3) 컬럼명 추출 : 속성
            ex)  회사원 = 사번, 이름, 부서명, 입사일 ...
        4) 관계도 도출
            ex) 맛집 --- 예약 --- 회원
            => 액터 (동작의 주체)
        5) 제약조건 정의
           ----------- 1:1 , 1:N , N:M
        6) ER - 다이어그램
            => 테이블 (사각형), 컬럼 (타원형), 관계도 (마름모)
            => 흐름 파악
                = 시퀀스 다이어그램 / 플로우차트
     간단한 요구사항
       1. 학생은 학번, 이름, 학년, 전공을 가진다
       2. 과목은 과목코드, 과목명, 학점 정보를 가지고 있다
       3. 교수는 교번, 이름, 소속학과
       4. 학생은 여러 과목을 수강 할 수 있다, 각 과목은 여러 학생이 수강 할 수 있다
       5. 교수는 여러 과목을 담당, 한 과목은 한명의 교수 담당
       6. 수강시에는 성적이 부여된다
       
       1) 테이블 추출
            = 학생, 교수, 과목, 수강
       2) 각 테이블의 속성값 추출
            = 학생 (학번(고유번호), 이름, 학년, 전공)
            = 과목 (과목코드(pk), 과목명, 학점)
            = 교수 (교번(pk), 이름, 소속학과)
            = 수강 (학번(fk), 과목코드(fk), 성적)
       3) 관계도 도출
             학생 ------ 과목 (N:M) ------ 수강
             교수 ------ 과목 (1:N)
       4) ER - 다이어그램
             학생 -----< 수강 >----- 과목
              |           |          |
             학번         학번      과목코드
             이름        과목코드    과목명
             학년         성적       학점
             전공
       5) 제약조건
             학번, 교번, 과목코드 : PK
             수강 : 복합키 (PK : 학번 + 과목코드)
      -------------------------------------------------
       ==> 벤치마킹 => 테이블 추출 => 컬럼 추출 => 제약조건 => 테이블 생성 => 데이터 수집
       
       => 정규화 : 데이터 중복 최소화 + 이상현상 방지
                  ------------------------------
                   = 테이블을 나눠서 새로운 테이블 여러개 제작 => JOIN
                     이상현상
                      = 추가 : 불필요한 데이터가 첨부되는 경우
                         ex) 크롤링 : table / dl / ul
                      = 수정 : 같은 값인 경우 동시에 수정된다
                      = 삭제 : 원하지 않는 데이터가 삭제
           1 정규화
              => 모든 컬럼은 원자값만 추가한다 => 반복 제거
                  ex)  member (id, name, hobby)
                     => (1,'홍길동','등산','여행','게임,'운동') => 원자값은 한개여야 하기때문에 불가(수정/삭제 어려움)
              => 적용
                   (1,'홍길동','등산')
                   (1,'홍길동','여행')
                   (1,'홍길동','게임')
                    ...
           2 정규화 
              => 중복 제거
              => 복합키를 일부분 제거
                ex)  수강 (학번, 이름, 과목코드, 과목명, 성적)
                          -------------
                          학번 => 성적 ==> 성적은 학번에 따라서 제어
                          과목코드 => 과목명 ==> 과목명은 과목코드에 따라서 제어
                          부분 함수 종속
                     학생 (학번, 이름)
                     과목 (과목코드, 과목명)
                     수강 (학번, 과목코드, 성적)
           3 정규화
              => 이행 함수 종속 제거
                 ex)  A -> B, B -> C ==> A -> C
                      emp(empno(PK), ename, deptno, dname, loc)
                      -----------------------------------------
                      empno -> deptno -> dname, loc
                      emp(empno, ename, deptno)
                      dept(deptno, dname, loc)
                      
          -------------------------------------------------------------------
           비정형화 => 정형화 테이블로 변경
           -------
            ex) 
                예약(예약번호, 아이디, 이름, 주소, 전화번호, 맛집번호, 맛집명, 위치, 예약일, 시간, 예약여부)
         -------------------------------------------------------------------------------------------
          1NF(1정규화) : 원자값만 허용 반복속성 제거
          2NF(2정규화) : 부분 종속 : 복합키 일부에 종속된 속성 제거
                          id -> name fno -> food_name
                          => id -> food_name
          3NF(3정규화) : 이행 함수 종속 제거
                          PK가 아닌 컬럼이 다른 컬럼에 의해 제어가 되는 경우
         -------------------------------------------------------------------------------------------                 
           => 오류 발생시 역정규화  
                        -------- 복잡한 관계, 키가 안되는 경우
                        
     트랜잭션 : 일괄 처리
     -------
        => COMMIT : 정상 수행 => 저장
        => ROLLBACK : 비정상 수행 => 모든 SQL명령 취소
        => ROLLBACK 위치 지정 : SAVEPOINT
        --------------------------------------------
        Java => auto commit => 해제
          1. INSERT => 에러발생 (상관X) => catch
          2. UPDATE => 에러발생 
          3. INSERT => 에러발생
          4. DELETE => 에러발생
          --------------------- 마지막에 COMMIT
          catch => rollback
*/




























