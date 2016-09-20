<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	 uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql"	uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 글쓰기</title>
<link href = "../view/mystyle.css" rel = "stylesheet" type = text/css">
<script type = "text/javascript" src = "../view/script.js"></script>
</head>
	<!-- 답변글의 경우 : 부모글의 글번호, 그룹화 번호, 그룹내의 순서, 들여쓰기
	   <===== content.jsp 페이지에서 넘어옴... -->

<body bgcolor = "${bodyback_c}">
<center><b>글쓰기</b></center><br>
<form action = "writePro.do" method="post" name = "writeform" onsubmit="return writeSave()">
	<input type="hidden" name="num" value="${num}">

<table width='400' border='1' cellspacing='0' cellpadding='0' bgcolor="${bodyback_c}"
align="center">

<tr>
	<td align = "right" colspan="2"  bgcolor="${value_c}">
	<a href = "list.do"> 글목록 보기</a>
	</td>
</tr>
<tr>
	<td width="70" bgcolor = "${value_c}" align = "center"> 이  름</td>
	<td width="330"><input type="text" size= "10" maxlenth="10" name ="writer"></td>
</tr>
<tr>
	<td width="70" bgcolor = "${value_c}" align = "center"> 제  목</td>
	<td width="330">
	<!-- 답변인것에 대한 처리 -->
	<c:if test="${num == 0}">
		<input type= "text" size = "40" maxlength="50" name = "subject">
	</c:if>
	<c:if test="${num != 0 }">
		<input type= "text" size = "40" maxlength="50" name = "subject"  value ="[답변] ">
	</c:if>
	</td>
</tr>

<!--  --------------------------------------------------------------------------------------------- -->
<tr>
	<td width="70" bgcolor = "${value_c}" align = "center"> 내  용</td>
	<td width="330"><textarea rows="13" cols="40" name = "content"></textarea></td>
</tr>
<tr>
	<td align="center" colspan="2" bgcolor="${value_c }">
	<input type = "submit" value = "글쓰기">
	<input type= "reset" value = "다시작성">
	<input type = "button" value = "목록보기" onclick="windows.location='list.do'">
</tr>

</table>

</form>


</body>
</html>