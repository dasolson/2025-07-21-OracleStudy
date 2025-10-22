<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       배열 [] / 객체 {} => [{},{},{}...]
       ------
        추가 : 배열명[0]=값
              마지막에 추가 push() ***
        삭제    : pop() => 마지막 요소 삭제
        갯수    : length
        자르기   : slice(start, end) ***
        찾기    : find()
        완전 삭제 : delete
        배열 복사 : ...(스코프 연산자)      
        
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let names = ["홍길동","심청이","박문수","이순신","강감찬"];
	console.log(names);
	// 데이터 추가
	names.push("을지문덕");
	console.log(names);
	// 데이터 삭제
	names.pop();
	console.log(names);
	// 인원확인
	console.log("인원 : " +names.length);
	// 삭제
	names.shift();
	console.log(names);
	// 자르기
	let names2 = names.slice(2);
	console.log(names2);
	let names3 = names.slice(1,2); //end-1
	console.log(names3);
	
	// 복사
	let names4 = [...names,'춘향이'];
	console.log(names4);
	
	// 객체
	let sawon = {
		sabun:"1",
	    name:"홍길동",
	    dept:"개발부",
	    job:"대리",
	    pay:3500
	}
	document.write("사번 : " +sawon.sabun+"<br>")
	document.write("이름 : " +sawon.name+"<br>")
	document.write("부서 : " +sawon.dept+"<br>")
	document.write("직위 : " +sawon.job+"<br>")
	document.write("연봉 : " +sawon.pay+"<br>")	
	document.write("<hr>")
	document.write("사번 : " +sawon['sabun']+"<br>")
	document.write("이름 : " +sawon['name']+"<br>")
	document.write("부서 : " +sawon['dept']+"<br>")
	document.write("직위 : " +sawon['job']+"<br>")
	document.write("연봉 : " +sawon['pay']+"<br>")
	document.write("<hr>")
	for(let key in sawon){
		document.write(sawon[key]+"<br>")
	}
}
</script>
</head>
<body>
   
</body>
</html>