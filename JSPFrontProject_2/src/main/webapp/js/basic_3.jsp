<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
        반복문
         = do~while : 반드시 한번 이상 수행
             형식)
                  초기값 ========= 1
                  do {
                     반복수행문장 == 2
                     증가식 ====== 3
                  }while(조건문) = 4 => 후조건
         = while    : 반복 횟수가 없는 경우
             형식)
                  초기값 ========== 1
                  while(조건문 { == 2
                      반복수행문장 == 3
                      증가식 ======= 4 ====> 2이동
                  }
         = for      : 반복 횟수가 있는 경우
                      for(초기값;조건식;증가식){
                          반복수행문장
                      }
                      
         = for-each
            1) for of  : 실제 데이터 1개씩 읽어온다
            2) for in  : 배열의 인덱스 번호
            3) forEach : 함수형 => 실제 데이터 1개씩 읽어온다
            4) map     : 함수형 => 실제 데이터 1개씩 읽어온다
            ------------------------------------------
            배열 / JSON => [{},{},{},{}...]        
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	/*document.write("<h1>do~while</h1>")
	let i = 1
	do {
		document.write(i+ "&nbsp;")
		i++
	}while(i <= 10){
		document.write(i+ "&nbsp;")
		i++;
	}
	document.write("<h1>일반 for</h1>")
	for(i = 1; i <= 10; i++){
		document.write(i+ "&nbsp;")
	}*/
	const names = ["홍길동","이순신","심청이","박문수","강감찬"]
	const sexs = ["남자","남자","여자","남자","남자"]
	document.write("<h1>일반 배열 출력</h1>")
	document.write(names[0]+ "<br>")
	document.write(names[1]+ "<br>")
	document.write(names[2]+ "<br>")
	document.write(names[3]+ "<br>")
	document.write(names[4]+ "<br>")
	
	document.write("<h1>for of : 데이터를 한개씩 읽기</h1>")
	for(let name of names){
		document.write(name+ "<br>")
	}
	document.write("<h1>for in : 인덱스 번호 읽기</h1>")
	for(let j in names){
		document.write(names[j]+"("+sexs[j]+")<br>")
	}
	document.write("<h1>map 사용 : 가장 많이 사용</h1>")
	// 배열명.map(function(name){})
	names.map(function(name){
		document.write(name+ "<br>")
	})
	document.write("<h1>forEach 사용 : 권장</h1>")	
	names.forEach(function(name){
		document.write(name+ "<br>")
	})
	document.write("<h1>map 사용 : 가장 많이 사용</h1>")	
	names.map(function(name,index){
		document.write(name+ "("+sexs[index]+")<br>")
	})
}
</script>
</head>
<body>
   
</body>
</html>