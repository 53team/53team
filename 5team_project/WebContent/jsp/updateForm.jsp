
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 글쓰기</title>
<link href = "../view/mystyle.css" rel = "stylesheet" type = text/css">
<script type = "text/javascript" src = "../view/script.js"></script>
</head>

<body bgcolor = "${bodyback_c}">
<center><b>글 수정하기</b></center><br>
<form action = "updatePro.do?pageNum=${pageNum }" method="post" name = "updateForm" onsubmit="return writeSave()">

<table width='400' border='1' cellspacing='0' cellpadding='0' bgcolor="${bodyback_c }"
align="center">

<tr>
	<td align = "right" colspan="2"  bgcolor="${value_c }">
	<a href = "list.do"> 글목록 보기</a>
	</td>
</tr>
<tr>
	<td width="70" bgcolor = "${value_c}" align = "center"> 이  름</td>
	<td width="330"><input type="text" size= "10" maxlenth="10" name ="writer" value="${vo.writer}">
		<input type="hidden" name="num" value="${vo.num}"></td>
	</td>
	
</tr>
<tr>
	<td width="70" bgcolor = "${value_c}" align = "center"> 제  목</td>
	<td width="330">
<!-- 	답변인것에 대한 처리 -->
<input type= "text" size = "40" maxlength="50" name = "subject" value = "${vo.subject}"></td>
</tr>

<!--  --------------------------------------------------------------------------------------------- -->
<tr>
	<td width="70" bgcolor = "${value_c}" align = "center"> EMAIL</td>
	<td width="330"><input type="text" size= "40" maxlenth="30" name ="email" value ="${vo.email}"></td>
</tr>
<tr>
	<td width="70" bgcolor = "${value_c}" align = "center"> 내  용</td>
	<td width="330"><textarea rows="13" cols="40" name = "content">${vo.content}</textarea></td>
</tr>
<tr>
	<td width="70" bgcolor = "${value_c}" align = "center"> 비밀번호</td>
	<td width="330"><input type="password" size= "8" maxlenth="10" name ="passwd"></td>
</tr>
<tr>
	<td align="center" colspan="2" bgcolor="${value_c }">
	<input type = "submit" value = "글수정">
	<input type= "reset" value = "다시작성">
	<input type = "button" value = "목록보기" onclick="window.location='list.do?pageNum=${pageNum}'">
</tr>

</table>

</form>

</body>
</html>