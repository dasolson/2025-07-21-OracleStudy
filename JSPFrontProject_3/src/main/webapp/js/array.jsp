
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

p {
 overflow: hidden;
 white-space: nowrap;
 text-overflow: ellipsis;
}
a.link:hover {
  cursor: pointer;
}
</style>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
let food_list=[]
window.onload=()=>{
	dataRecv(1);
}
async function dataRecv(page)
{
	await axios.get('../food/list.do',{
		params:{
			page:page
		}
	}).then((response)=>{
		console.log(response.data)
		food_list=response.data;
		//console.log(food_list[0].name)
	})
	
	let html='';
	food_list.map((food)=>{
		html += '<div class="col-md-3">'
	     +'<div class="thumbnail">'
	     +'<a href="#">'
	     +'<img src='+food.poster+' style="width:230px;height:150px">'
	     +'<div class="caption">'
	     +'<p>'+food.name+'</p>'
	     +'</div>'
	     +'</a>'
	     +'</div>'
	     +'</div>'
	})
	document.querySelector('.list').innerHTML = html
	
	// 페이지 출력
	let pages = '<ul class="pagination">';
	if(food_list[0].startPage > 1) {
		pages += '<li><a class="link" onclick="dataRecv('+(food_list[0].startPage-1)+')">&lt;</a></li>'
	}
	for(let i = food_list[0].startPage; i <= food_list[0].endPage; i++) {
	   pages += '<li '+(i == food_list[0].curpage?"class=active":"")+'><a class="link" onclick="dataRecv('+i+')">'+i+'</a></li>'	
	}
	if(food_list[0].endPage < food_list[0].totalpage) {
		pages += '<li><a class="link" onclick="dataRecv('+(food_list[0].endPage+1)+')">&gt;</a></li>'
	}
	document.querySelector('.pages').innerHTML=pages
}
</script>
</head>
<body>
  <div class="container">
   <div class="row list">
    
   </div>
   <div style="height: 20px"></div>
   <div class="row text-center pages">
     
   </div>
  </div>
</body>
</html>
