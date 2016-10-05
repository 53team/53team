<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Insert title here</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      
      var first = '${vector[0].count }';
      var firstname = '${vector[0].category }';
      var second = '${vector[1].count }';
      var secondname = '${vector[1].category }';
      var third = '${vector[2].count }';
      var thirdname = '${vector[2].category }';
      var fourth = '${vector[3].count }';
      var fourthname = '${vector[3].category }';
      var fifth = '${vector[4].count }';
      var fifthname = '${vector[4].category }';
      
      var sum = 0;
      var sums = (first + second + third + fourth + fifth + sum);
      
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
      ['Language', 'Speakers (in millions)'],
      [firstname,(first/sums)],
      [secondname,(second/sums)],
      [thirdname,(third/sums)],
        [fourthname,(fourth/sums)],
        [fifthname,(fifth/sums)]
        ]);

       var options = {
               legend: 'none',
               pieSliceText: 'label',
               pieStartAngle: 100,
             };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
      }
    </script>
</head>
<body>
<%-- <div>
   <table width="700">
      <c:forEach var="list" items="${vector }">
         <tr>
            <td><c:out value="${vector[0].category }"/></td>
            <td><c:out value="${vector[0].count }"/></td>
         </tr>
      </c:forEach>
   </table>
</div> --%>
<div align = "center" id = "whitebox">
<font style = "align : center">Hot ProgramLanguage Category Chart</font>
<div id="piechart" style="width: 700px; height: 500px;"></div>
</div>
</body>
</html>