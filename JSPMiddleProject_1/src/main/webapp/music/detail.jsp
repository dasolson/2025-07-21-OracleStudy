<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let title='${vo.title}'
let movie=[];
$(function(){
	 musicMovie()
})
async function musicMovie()
{
	  await axios.get('https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=28&q='+title+'&type=video&key=AIzaSyCjkIwifNo8t4OGYoxVIyUAoATzIFjEK34')
      .then(response=>{
      // youtube로부터 데이터를 읽어 온다 
        console.log(response.data.items)
        movie=response.data.items
      })
      let html=''
      //movie.map((m)=>{
    	 html+='<div class="col-md-6">'
  	      +'<div class="thumbnail">'
  	      +'<embed src="http://youtube.com/embed/'+movie[0].id.videoId+'" style="width:500px;height: 450px"></embed>'
  	      +'<div class="caption">'
          +'<p>'+movie[0].snippet.title+'</p>'
          +'</div>'
  	      +'</div>'
  	      +'</div>'
      //})
      $('.print').html(html)
}
</script>
<style type="text/css">
.row {
  margin: 0px auto;
  width:960px;
}
p {
   overflow: hidden;
   white-space: nowrap;
   text-overflow: ellipsis;
}
</style>
</head>
<body>
  <div class="cotainer">
   <div class="row print">
    
   </div>
  </div>
</body>
</html>