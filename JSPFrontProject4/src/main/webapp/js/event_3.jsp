<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let h1 = document.querySelector('#h1')
	let green = document.querySelector('#green')
	let blue = document.querySelector('#blue')
	let red = document.querySelector('#red')
	
	// listener
	green.addEventListener('click', function(){
		h1.style.color = "green"
	})
	blue.addEventListener('click', function(){
		h1.style.color = "blue"
	})
	red.addEventListener('click', function(){
		h1.style.color = "red"
	})
	
	// $('#red').on('click',function(){})
	// $('#blue').click(function(){})
}
</script>
</head>
<body>
   <h1 id="h1">Hello JavaScript</h1>
   <button id="green">Green</button>
   <button id="blue">Blue</button>
   <button id="red">Red</button>
</body>
</html>