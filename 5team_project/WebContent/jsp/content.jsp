<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import = "java.text.SimpleDateFormat"%>


<html>
<head><title>게시판</title>
<link href="../view/style.css" rel = "stylesheet" type = "text/css">
</head>
<body bgcolor = "${bodyback_c }">
<center><b>상세보기 페이지</b><br>
<form>
<table width = "500" border = "1" cellspacing = "0" cellpadding = "0" 
bgcolor = "${bodyback_c }" align="center">

<tr height="30">
   <td align="center" width = "125" bgcolor="${value_c }">글번호</td>
   <td align="center" width = "125" >${vo.num }</td>
   
   <td align="center" width = "125" bgcolor="${value_c }">조회수</td>
   <td align="center" width = "125"> ${vo.readcount }</td>
</tr>
<tr height="30">
   <td align="center" width = "125" bgcolor="${value_c }">작성자</td>
   <td align="center" width = "125">${vo.writer }</td>
   
   <td align="center" width = "125" bgcolor="${value_c }">작성일</td>
   <td align="center" width = "125">${vo.reg_date }</td>
</tr>
<tr height="30">
   <td align="center" width = "125" bgcolor="${value_c }">글제목</td>
   <td align="center" width = "125">${vo.subject }</td>
   
   <td align="center" width = "125" bgcolor="${value_c }">글내용</td>
   <td align="center" width = "125"><pre>${vo.content }</pre></td>
</tr>

 <tr height ="30">
   <td colspan="4" align="right" bgcolor="${value_c }">
   <input type="button" value = "글수정" onclick="document.location.href='updateForm.do?num=${vo.num }&pageNum=${pageNum }'"> 
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input type = "button" value = "글삭제" onclick="document.location.href='deleteForm.do?num=${vo.num }&pageNum=${pageNum }'">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   

   <%--  <input type = "button"  value = "답글작성" onclick="document.location.href='writeForm.do?num=${vo.num }&ref=${vo.ref }&re_step=${vo.re_step }&re_level=${vo.re_level }'"> --%>

   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input type = "button" value = "목록 보기" onclick="document.location.href='list.do?pageNum=${pageNum}' ">
   </td>
</tr>
</table>
</form>
</body>
</center>
</html>