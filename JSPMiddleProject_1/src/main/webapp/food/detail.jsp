<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row {
  margin: 0px auto;
  width:960px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.images').hover(function(){
		let i=$(this).attr('src')
		$('#mainImg').attr('src',i);
	})
})
</script>
</head>
<body>
   <div class="container">
    <div class="row">
     <table class="table">
      <tr>
        <td width=40% class="text-center" rowspan="8">
         <table class="table">
          <tr>
           <td colspan=7>
             <img src="${vo.poster }" style="width: 420px;height: 300px"
              id="mainImg"
             >
           </td>
          </tr>
          <tr>
           <c:forTokens items="${vo.images }" delims=","
            var="img"
           >
             <td>
              <img src="${img }" style="width: 55px;height: 50px"
               class="images"
              >
             </td>
           </c:forTokens>
          </tr>
         </table>
        </td>
        <td colspan="2">
          <h3>${vo.name }&nbsp;<span style="color:orange">${vo.score }</span></h3>
        </td>
      </tr>
      <tr>
       <td width=10% style="color:gray">주소</td>
       <td width=50%>${vo.address }</td>
      </tr>
      <tr>
       <td width=10% style="color:gray">전화</td>
       <td width=50%>${vo.phone }</td>
      </tr>
      <tr>
       <td width=10% style="color:gray">음식종류</td>
       <td width=50%>${vo.type }</td>
      </tr>
      <tr>
       <td width=10% style="color:gray">영업시간</td>
       <td width=50%>${vo.time }</td>
      </tr>
      <tr>
       <td width=10% style="color:gray">가격대</td>
       <td width=50%>${vo.price }</td>
      </tr>
      <tr>
       <td width=10% style="color:gray">주차</td>
       <td width=50%>${vo.parking }</td>
      </tr>
      <tr>
       <td width=10% style="color:gray">테마</td>
       <td width=50%>${vo.theme }</td>
      </tr>
     </table>
     <table class="table">
      <tr>
       <td>${vo.content }</td>
      </tr>
      <tr>
        <td class="text-right">
         <a href="#" class="btn btn-xs btn-danger">좋아요</a>
         <a href="#" class="btn btn-xs btn-warning">찜하기</a>
         <a href="#" class="btn btn-xs btn-info">예약</a>
         <a href="javascript:history.back()" class="btn btn-xs btn-success">목록</a>
        </td>
      </tr>
     </table>
    </div>
    <div class="row text-center" style="margin-top: 10px">
      <div id="map" style="width:100%;height:350px;"></div>
    </div>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${vo.address}', function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.name}</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
		</script>
     
   </div>
</body>
</html>