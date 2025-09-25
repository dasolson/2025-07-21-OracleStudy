-- 시노님 => 동의어 => 테이블명에 대한 => 개인만 / 모든 사용자
/*
      CREATE 시노님
      CREATE PUBLIC 시노님
       단점 : 권한이 없다 (hr)
       사용 목적 : 테이블 / 뷰 / 시퀀스 / 함수 ...별칭
       목적 : 테이블 / 뷰 / 시퀀스 / 함수 => 명칭이 긴 경우
                => 숨기거나 / 짧게 만들어서 사용
       특징 : 
                   별칭 생성, 로컬 (사용자 전용) / 글로벌 (모든 사용자)
                   권한 부여가 필요 : SYSTEM / SYSDBA
                       DCL => GRANT / REVOKE
                                  권한부여   권한해제
                         형식)   GRANT CREATE SYNONYM TO hr
                                   GRANT CREATE VIEW TO hr
                  
                                   REVOKE CREATE SYNONYM FROM hr
                          *** table / sequence 외에 다른 권한은 가지고 있지 않다
*/
/*
CREATE VIEW emp_view
AS
SELECT * FROM emp;

-- Local : 현재 사용자
CREATE SYNONYM emp_as FOR emp;

-- 모든 사용자
CREATE PUBLIC SYNONYM emp_pub FOR emp;

DROP SYNONYM emp_as;
DROP PUBLIC SYNONYM emp_pub;
*/
/*
    SYSNONYM
    1. 다른 사용자 테이블을 편리하게 접근 가능
            hr_1 / hr_2 / hr_3
    2. 테이블 이름 변경 => SYNONYM 만 변경하면 코드 수정 최소화
                                    가독성이 좋다
                             ex)    aaa => emp
    3. 보안 목적=> 주의점 : PUBLIC 권한 주의 
*/






















