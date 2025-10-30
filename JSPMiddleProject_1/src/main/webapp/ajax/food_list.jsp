<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row {
   width: 960px;
   margin: 0px auto;
}
</style>
<script type="text/javascript" src="https://unpkg.com/vue@3"></script>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
   <div class="container">
      <div class="row">
         <div class="col-md-3" v-for="vo in food_list">
		    <div class="thumbnail">
		      <a href="#">
		        <img :src="vo.poster" alt="Lights" style="width:230px; height: 200px">
		        <div class="caption">
		          <p>{{vo.name}}</p>
		        </div>
              </a>
            </div>
         </div>
      </div>
      <script>
         let foodApp=Vue.createApp({
        	 data(){
        		 return {
        			 food_list:[],
        			 curpage:1
        		 }
        	 },
        	 mounted(){
        		 // window.onload
        		 axios.get('../food/food_vue.do').then(res=>{
        			 this.food_list = res.data
        			 console.log(res.data)
        		 })
        	 }
         }).mount(".container")
      </script>
   </div>
</body>
</html>