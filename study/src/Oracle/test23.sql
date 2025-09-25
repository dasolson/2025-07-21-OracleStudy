-- 4장 (SQL 고급)
/*
      1. 내장함수 => 209p 
             사용처 : SELECT뒤에, WHERE뒤에, GROUP BY뒤에, HAVING뒤에, ORDER BY 뒤에
             => 컬럼처럼 사용
             => 리턴값을 가지고 있다
             => 리턴형(처리 결과값) / 매개변수(사용자 입력)
                     CREATE FUNCTION func_name(매개변수)
                     RETURN 데이터형
                     BEGIN
                            SQL문장 처리
                            RETURN 값
                     END;
             => 컬럼단위 처리 , ROW단위 처리
                  ----------------   ----------------
                    집계 함수         단일행 함수
                 1) 단일행 함수
                       - 문자 관련 => 웹 : 자바(String) or 오라클
                              문자 자르기 : SUBSTR(문자열|컬럼명, 시작위치, 갯수)
                                                   => 문자 시작번호 : 1~, 자바 : 0~
                                                   => 자바, 자바스크립트 : subSting()
                                                        ------------------------------------
                                                         = AJAX / VUE / REACT => 자바스크립트 라이브러리
                              문자 위치 찾기 : INSTR(문자열|컬럼명, 찾는 문자, 시작위치, 몇번쨰)
                                                       Hello java => a 
                                                       => inndexOf / lastIndexOf 동시 처리
                              문자 배치 : RPAD => 아이디 찾기
                                                 RPAD(문자열, 출력갯수, 대체문자)
                                                     RPAD('ADMIN', 10, '#') => ADMIN#####
                                                                                          AD***
                              문자 갯수 : LENGTH(문자열)
                              문자 변경 : REPLACE(문자열, 찾는문자, 변경문자)
                                                 & => URL(이미지) => |  => 변경해서 저장
                                                 -- URL => 데이터 구분
                                                  ex)  http://localhost/board.jsp?no=10&name=aaa => http://localhost/board.jsp?no=10^name=aaa
                       - 숫자 관련 => 자바 (Math)
                              MOD : 나머지 
                                    MOD(10,3) => 10%3
                              ROUND : 반올림
                              CEIL : 올림 => 총페이지
                       - 날짜 관련 => 자바 (Calendar)
                              SYSDATE : 시스템의 시간, 날짜 => 정수형 처럼 사용
                                    SYSDATE-1 (어제) / SYSDATE+1 (내일)
                              MONTHS_BETWEEN : 기간의 개월수
                                    MONTHS_BETWEEN (최신, 이전)
                                                                ------  ------
                                                            SYSDATE  hiredate
                       - 변환 함수 => 자바 (DecimalFormat / SimpleDateFormat)
                               TO_CHAR : 문자열 변환
                                    YYYY/RRRRR , MM , DD , HH/HH24, MI , SS , DY
                                    999,999,999
                       - 기타 함수 => 자바에서는 존재하지 않는다 (NVL)
                               NVL : null값 대신 다른 값으로 대체
                 2) 집계 함수
                       - *** COUNT : ROW의 갯수 
                       - MAX / MIN
                       - SUM : 합
                       - AVG : 평균
                       - CUBE : ROW 단위 평균
                       - ROLLUP : ROW, Column 합

      2. 서브쿼리 => 단계별
      3. 인덱스=> 검색 최적화 / 정렬 최적화
   5장 : 프로그램
      1. PL / SQL => 오라클 프로그램
           => FUNCTION / PROCEDURE / TRIGGER => 호불호 (ERP)
      2. JDBC
      3. 웹 프로그램 : JSP (보류)
   6장 : 데이터베이스 설계 (개념 설계, 논리 설계, 물리 설계 => 데이터 모델)
   7장 : 정규화
   8장 : 트랜젝션
  -------------------------------------------------------------------------------------- 여기까지 공부
   9장 : 어드민 => 복구 / 백업 / 보안
       
*/