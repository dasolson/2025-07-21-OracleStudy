<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
  margin-top: 50px;
}
.row {
  width: 960px;
  margin: 0px auto;
}
tbody tr:hover {
   background-color: #FC6;
   cursor: pointer;
}
</style>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
// 전역변수
// 이벤트 처리 : 명시적 이벤트 처리
// <button onclick="함수호출">
let sawon = []
let detail = {}
window.onload=async()=>{
	// 지역변수
	await axios.get('../emp/list.do')
	     .then(response=>{
	    	console.log(response.data)
	    	sawon = response.data
	     })
	let html = '';
	// sawon.map(sa=>{})
	//sawon.forEach(sa=>{})
	for(let sa of sawon){
		html += '<tr onclick="detailData('+sa.empno+')">'
		     +'<td>'+sa.empno+'</td>'
		     +'<td>'+sa.ename+'</td>'
		     +'<td>'+sa.job+'</td>'
		     +'<td>'+sa.dbday+'</td>'
		     +'<td>'+sa.deptno+'</td>'
		     +'</tr>'
	}
	// 태그 읽기
	document.querySelector('tbody').innerHTML = html;
}
async function detailData(empno){
	//alert("선택 : " +empno)
	await axios.get('../emp/detail.do',{
		params:{
			empno:empno
		}
	}).then(response=>{
		console.log(response.data)
		detail = response.data
	})
	
	// 태그 읽기
	/*
	   1. ID    => document.getElementById("id명")
	               document.querySelector("#id명")
	                => Jquery => $('#id')
	   2. Class => document.getElementByClassName("클래스명")
	               document.querySelectorAll(".클래스명")
	   3. 태그명  => document.getElementByTagName("태그명") 
	               document.querySelector("태그명") 
	*/
	let table = document.querySelector("#user-table")
	table.style.display = '';
	document.querySelector('#sabun').innerHTML = detail.empno
	document.getElementById('name').innerHTML = detail.ename
	document.getElementById('job').innerHTML = detail.job
	document.getElementById('mgr').innerHTML = detail.mgr
	document.getElementById('day').innerHTML = detail.day
	document.getElementById('sal').innerHTML = detail.sal
	document.getElementById('comm').innerHTML = detail.comm
	document.getElementById('deptno').innerHTML = detail.deptno
}
</script>
</head>
<body>
   <div class="container">
      <h1 class="text-center">사원 목록</h1>
      <div class="col-sm-8">        
         <table class="table">
            <thead>
               <tr>
                  <th class="text-center">사번</th>
                  <th class="text-center">이름</th>
                  <th class="text-center">직위</th>
                  <th class="text-center">입사일</th>
                  <th class="text-center">부서번호</th>
               </tr>
            </thead>
            <tbody>
               
            </tbody>
         </table>
      </div>
      <div class="col-sm-4">
         <table class="table" id="user-table" style="display: none">            
            <tr>
               <th width="30%">사번</th>
               <td width="70%" id="sabun"></td>
            </tr>
            <tr>
               <th width="30%">이름</th>
               <td width="70%" id="name"></td>
            </tr>
            <tr>
               <th width="30%">직위</th>
               <td width="70%" id="job"></td>
            </tr>
            <tr>
               <th width="30%">사수</th>
               <td width="70%" id="mgr"></td>
            </tr>
            <tr>
               <th width="30%">입사일</th>
               <td width="70%" id="day"></td>
            </tr>
            <tr>
               <th width="30%">급여</th>
               <td width="70%" id="sal"></td>
            </tr>
            <tr>
               <th width="30%">성과급</th>
               <td width="70%" id="comm"></td>
            </tr>            
            <tr>
               <th width="30%">부서번호</th>
               <td width="70%" id="deptno"></td>
            </tr>
         </table>
      </div>
   </div>
</body>
</html>