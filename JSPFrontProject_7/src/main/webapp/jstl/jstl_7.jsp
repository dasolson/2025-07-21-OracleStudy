<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.vo.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>    
<%
   List<ChartVO> list = new ArrayList<ChartVO>();
   list.add(new ChartVO("운동",20));
   list.add(new ChartVO("낚시",30));
   list.add(new ChartVO("게임",23));
   list.add(new ChartVO("등산",10));
   list.add(new ChartVO("여행",17));
   list.add(new ChartVO("음주",60));
   list.add(new ChartVO("잠자기",100));
%>
<c:set var="list" value="<%=list %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['취미', '현황'],
          <c:forEach var="vo" items="${list}">
          ['<c:out value="${vo.word}"/>', <c:out value="${vo.count}" />],
          </c:forEach>
        ]);

        var options = {
          title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
</head>
<body>
   <div id="piechart" style="width: 900px; height: 500px;"></div>
</body>
</html>