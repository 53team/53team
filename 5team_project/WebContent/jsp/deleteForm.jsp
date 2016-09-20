
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>

<link href="../view/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="../view/script.js"></script>

</head>
<body bgcolor="${bodyback_c}">  
<center><b>글삭제</b> <br>
<form action="deletePro.do?pageNum=${pageNum }"  method="post"
		  onsubmit="return deleteSave()"	 name="delForm">
	
	<table width="360" border="1" cellspacing="0" cellpadding="0"  align="center">
		<tr height="30"> 
			<td align="center"> 비밀 번호 : 
			<input type="password"  name="passwd" size="8" maxlength="12">
			<input type="hidden"  name="num"  value="${num }">
			</td>
		</tr>
		<tr height="30"> 
			<td align="center" bgcolor ="${value_c }">
			<input type="submit"  value="글삭제">
			<input type="button"  value="글목록" 
			onclick="document.location.href='list.do?pageNum=${ pageNum }'">
			</td>
		</tr>
	</table>
</form>

</center>
</body>
</html>



